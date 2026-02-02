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
<title>Admin - Manage Buses</title>

<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<jsp:include page="admin-navbar.jsp"/>


<div class="container mt-5">

    <h2 class="text-center mb-4">Manage Buses</h2>

    <!-- ADD BUS FORM -->
    <div class="card shadow mb-5">
        <div class="card-header bg-dark text-white">
            Add New Bus
        </div>

        <div class="card-body">
            <form action="buses/save" method="post" class="row g-3">

                <div class="col-md-6">
                    <label class="form-label">Bus Name</label>
                    <input type="text" name="busName" class="form-control" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Driver Name</label>
                    <input type="text" name="driverName" class="form-control" required>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Bus Type</label>
                    <select name="busType" class="form-select">
                        <option>AC</option>
                        <option>Non-AC</option>
                        <option>Sleeper</option>
                    </select>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Total Seats</label>
                    <input type="number" name="seats" class="form-control" required>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Price</label>
                    <input type="number" name="price" class="form-control" required>
                </div>

                <div class="col-md-12">
                    <label class="form-label">Route</label>
                    <select name="route.routeId" class="form-select">
                        <c:forEach var="r" items="${routes}">
                            <option value="${r.routeId}">
                                ${r.routeFrom} → ${r.routeTo}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-12 text-center">
                    <button class="btn btn-success px-5">
                        Add Bus
                    </button>
                </div>

            </form>
        </div>
    </div>

    <!-- BUS LIST TABLE -->
    <h4 class="mb-3">Available Buses</h4>

    <table class="table table-bordered table-striped table-hover">

        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Driver</th>
            <th>Type</th>
            <th>Seats</th>
            <th>Available</th>
            <th>Price</th>
            <th>Route</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="b" items="${buses}">
            <tr>
                <td>${b.busId}</td>
                <td>${b.busName}</td>
                <td>${b.driverName}</td>
                <td>${b.busType}</td>
                <td>${b.seats}</td>
                <td>${b.availableSeats}</td>
                <td>₹ ${b.price}</td>
                <td>${b.route.routeFrom} → ${b.route.routeTo}</td>

                <td>
                    <a href="buses/delete/${b.busId}"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Delete this bus?')">
                        Delete
                    </a>
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
