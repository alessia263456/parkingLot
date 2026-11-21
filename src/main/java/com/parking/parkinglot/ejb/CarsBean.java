package com.parking.parkinglot.ejb;

import com.parking.parkinglot.common.CarDto;
import com.parking.parkinglot.entities.Car;
import com.parking.parkinglot.entities.User;
import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class CarsBean {
    private static final Logger LOG = Logger.getLogger(CarsBean.class.getName());

    @PersistenceContext
    private EntityManager entityManager;

    public List<CarDto> findAllCars(){
        LOG.info("findAllCars");
        try {
            TypedQuery<Car> typedQuery = entityManager.createQuery("SELECT c FROM Car c", Car.class);
            List<Car> cars = typedQuery.getResultList();
            return copyCarsToDto(cars);
        } catch(Exception ex) {
            throw new EJBException(ex);
        }
    }

    public CarDto findById(Long id){
        LOG.info("findById");
        try{
            Car car = entityManager.find(Car.class, id);
            if(car!=null){
                return new CarDto(car.getId(), car.getOwner().getUsername(), car.getParkingSpot(), car.getLicensePlate());
            }
            else return null;
        }
        catch(Exception ex){
            throw new EJBException(ex);
        }
    }

    public List<CarDto> copyCarsToDto(List<Car> cars){
        List<CarDto> dtos = new ArrayList<>();
        for (Car car : cars) {
            dtos.add(new CarDto(car.getId(), car.getOwner().getUsername(), car.getParkingSpot(), car.getLicensePlate()));
        }
        return dtos;
    }

    public void createCar(String licensePlate, String parkingSpot, Long userId){
        LOG.info("createCar");

        Car car = new Car();
        car.setLicensePlate(licensePlate);
        car.setParkingSpot(parkingSpot);

        User user=entityManager.find(User.class, userId);
        user.getCars().add(car);
        car.setOwner(user);

        entityManager.persist(car);
    }

    public void updateCar(Long carId, String licensePlate, String parkingSpot, Long ownerId) {
        LOG.info("updateCar");
        if(carId==null){
            return;
        }

        User newOwner=entityManager.find(User.class, ownerId);
        Car car=entityManager.find(Car.class, carId);
        car.setLicensePlate(licensePlate);
        car.setParkingSpot(parkingSpot);

        if(!newOwner.equals(car.getOwner())){
            //add the car to its new owner
            car.setOwner(newOwner);
            newOwner.getCars().add(car);
        }
    }

    public void deleteCarsByIds(Collection<Long> carIds){
        LOG.info("deleteCarsByIds");

        for(Long carId : carIds){
            Car car = entityManager.find(Car.class, carId);
            entityManager.remove(car);
        }
    }
}
