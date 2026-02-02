<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    if(session.getAttribute("admin") == null){
        response.sendRedirect("login");
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Reservations</title>

<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<jsp:include page="admin-navbar.jsp"/>


<div class="container mt-5">

    <h2 class="text-center mb-4">All Reservations</h2>

    <table class="table table-bordered table-striped table-hover">

        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>User</th>
            <th>Bus</th>
            <th>Seats</th>
            <th>Source</th>
            <th>Destination</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="res" items="${reservations}">
            <tr>
                <td>${res.reservationId}</td>
                <td>${res.user.username}</td>
                <td>${res.bus.busName}</td>
                <td>${res.seatsRequested}</td>
                <td>${res.source}</td>
                <td>${res.destination}</td>
                <td>${res.reservationDate}</td>
                <td>${res.reservationTime}</td>

                <!-- Status badge -->
                <td>
                    <c:if test="${res.reservationStatus == 'CONFIRMED'}">
                        <span class="badge bg-success">CONFIRMED</span>
                    </c:if>
                    <c:if test="${res.reservationStatus == 'CANCELLED'}">
                        <span class="badge bg-danger">CANCELLED</span>
                    </c:if>
                </td>

                <!-- Action -->
                <td>
                    <c:if test="${res.reservationStatus == 'CONFIRMED'}">
                        <a href="/admin/cancel-reservation/${res.reservationId}"
                           class="btn btn-warning btn-sm"
                           onclick="return confirm('Cancel this reservation?')">
                           Cancel
                        </a>
                    </c:if>

                    <c:if test="${res.reservationStatus == 'CANCELLED'}">
                        <span class="text-muted">No Action</span>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>

    </table>

    <div class="text-center mt-4">
        <a href="/admin/dashboard" class="btn btn-secondary">
            Back to Dashboard
        </a>
    </div>

</div>

</body>
</html>
