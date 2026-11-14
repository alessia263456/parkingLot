<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Cars">
    <h1>Cars</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Licence plate</th>
            <th scope="col">Parking spot</th>
            <th scope="col">Owner</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="car" items="${cars}">
        <tr>
            <th scope="row">${car.licensePlate}</th>
            <td>${car.parkingSpot}</td>
            <td>${car.ownerName}</td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <h5>Free parking spots: ${numberOfFreeParkingSpots}</h5>
</t:pageTemplate>

