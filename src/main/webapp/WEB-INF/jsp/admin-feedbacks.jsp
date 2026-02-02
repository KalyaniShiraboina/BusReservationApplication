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
<title>Admin - Feedbacks</title>

<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<jsp:include page="admin-navbar.jsp"/>


<div class="container mt-5">

    <h2 class="text-center mb-4">User Feedbacks</h2>

    <table class="table table-bordered table-striped table-hover">

        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>User</th>
            <th>Bus</th>
            <th>Rating</th>
            <th>Comment</th>
            <th>Date</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="f" items="${feedbacks}">
            <tr>
                <td>${f.feedbackId}</td>
                <td>${f.user.username}</td>
                <td>${f.bus.busName}</td>

                <td>
                    <span class="badge bg-info">
                        ${f.rating} ★
                    </span>
                </td>

                <td>${f.comment}</td>
                <td>${f.feedbackDate}</td>
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
