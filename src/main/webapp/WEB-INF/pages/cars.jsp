<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

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
        <tr>
            <th scope="row">Car 1</th>
            <td>Spot 1</td>
            <td>User 1</td>
        </tr>
        <tr>
            <th scope="row">Car 2</th>
            <td>Spot 2</td>
            <td>User 2</td>
        </tr>
        <tr>
            <th scope="row">Car 3</th>
            <td>Spot 3</td>
            <td>User 3</td>
        </tr>
        </tbody>
    </table>
    <h5>Free parking spots: ${numberOfFreeParkingSpots}</h5>
</t:pageTemplate>

