<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Cars">
    <h1>Cars</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Cars">
        <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
            <a href="${pageContext.request.contextPath}/AddCar" class="btn btn-primary btn-lg">Add Car</a>
            <button class="btn btn-danger" type="submit">Delete Cars</button>
        </c:if>
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
                    <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                        <input type="checkbox" name="car_ids" value="${car.id}"/>
                    </c:if>
                </th>
                <td>${car.licensePlate}</td>
                <td>${car.parkingSpot}</td>
                <td>${car.ownerName}</td>
                <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                    <td>
                        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/EditCar?id=${car.id}">Edit Car</a>
                    </td>
                </c:if>

            </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
    <h5>Free parking spots: ${numberOfFreeParkingSpots}</h5>
</t:pageTemplate>

