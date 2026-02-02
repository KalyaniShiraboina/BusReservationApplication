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
<title>Admin - Manage Routes</title>

<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<jsp:include page="admin-navbar.jsp"/>


<div class="container mt-5">

    <h2 class="text-center mb-4">Manage Routes</h2>

    <!-- ADD ROUTE FORM -->
    <div class="card shadow mb-5">

        <div class="card-header bg-dark text-white">
            Add New Route
        </div>

        <div class="card-body">
            <form action="routes/save" method="post" class="row g-3">

                <div class="col-md-5">
                    <label class="form-label">From</label>
                    <input type="text" name="routeFrom"
                           class="form-control"
                           placeholder="Source city"
                           required>
                </div>

                <div class="col-md-5">
                    <label class="form-label">To</label>
                    <input type="text" name="routeTo"
                           class="form-control"
                           placeholder="Destination city"
                           required>
                </div>

                <div class="col-md-2 d-flex align-items-end">
                    <button class="btn btn-success w-100">
                        Add
                    </button>
                </div>

            </form>
        </div>
    </div>

    <!-- ROUTE LIST TABLE -->
    <h4 class="mb-3">Available Routes</h4>

    <table class="table table-bordered table-striped table-hover">

        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>From</th>
            <th>To</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="r" items="${routes}">
            <tr>
                <td>${r.routeId}</td>
                <td>${r.routeFrom}</td>
                <td>${r.routeTo}</td>
                <td>
                    <a href="routes/delete/${r.routeId}"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Delete this route?')">
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
