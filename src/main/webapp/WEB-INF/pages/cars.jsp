<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Cars">
    <h1>Cars</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Cars">
        <a href="${pageContext.request.contextPath}/AddCar" class="btn btn-primary btn-lg">Add Car</a>
        <button class="btn btn-danger" type="submit">Delete Cars</button>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col">Licence plate</th>
                <th scope="col">Parking spot</th>
                <th scope="col">Owner</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="car" items="${cars}">
            <tr>
                <th scope="row">
                    <input type="checkbox" name="car_ids" value="${car.id}"/>
                </th>
                <td>${car.licensePlate}</td>
                <td>${car.parkingSpot}</td>
                <td>${car.ownerName}</td>
                <td>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/EditCar?id=${car.id}">Edit Car</a>
                </td>

            </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
    <h5>Free parking spots: ${numberOfFreeParkingSpots}</h5>
</t:pageTemplate>

