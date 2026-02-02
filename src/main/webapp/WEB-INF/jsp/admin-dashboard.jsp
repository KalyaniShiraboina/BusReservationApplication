<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
    if(session.getAttribute("admin") == null){
        response.sendRedirect("login");
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<jsp:include page="admin-navbar.jsp"/>


<div class="container mt-5">

    <h2 class="mb-4 text-center">Welcome Admin 👋</h2>

    <div class="row g-4">

        <!-- ROUTES -->
        <div class="col-md-3">
            <div class="card shadow text-center">
                <div class="card-body">
                    <h5 class="card-title">Routes</h5>
                    <p class="card-text">Manage bus routes</p>
                    <a href="/admin/routes" class="btn btn-primary">
                        View
                    </a>
                </div>
            </div>
        </div>

        <!-- BUSES -->
        <div class="col-md-3">
            <div class="card shadow text-center">
                <div class="card-body">
                    <h5 class="card-title">Buses</h5>
                    <p class="card-text">Manage buses</p>
                    <a href="/admin/buses" class="btn btn-success">
                        View
                    </a>
                </div>
            </div>
        </div>

        <!-- RESERVATIONS -->
        <div class="col-md-3">
            <div class="card shadow text-center">
                <div class="card-body">
                    <h5 class="card-title">Reservations</h5>
                    <p class="card-text">View bookings</p>
                    <a href="/admin/reservations" class="btn btn-warning">
                        View
                    </a>
                </div>
            </div>
        </div>

        <!-- FEEDBACKS -->
        <div class="col-md-3">
            <div class="card shadow text-center">
                <div class="card-body">
                    <h5 class="card-title">Feedbacks</h5>
                    <p class="card-text">User feedbacks</p>
                    <a href="/admin/feedbacks" class="btn btn-info">
                        View
                    </a>
                </div>
            </div>
        </div>

    </div>

</div>

</body>
</html>
