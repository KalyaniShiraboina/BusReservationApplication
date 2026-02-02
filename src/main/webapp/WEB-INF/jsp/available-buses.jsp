<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	      rel="stylesheet">

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<title>Available Buses</title>
</head>
<body>
	<jsp:include page="common/navbar.jsp"/>


	<div class="container mt-5">

	<h3 class="mb-3">Available Buses</h3>

	<table class="table table-bordered table-striped">
	<thead class="table-dark">
	<tr>
	  <th>Bus</th>
	  <th>Type</th>
	  <th>Driver</th>
	  <th>Seats</th>
	  <th>Price</th>
	  <th>Action</th>
	</tr>
	</thead>

	<tbody>
	<c:forEach var="b" items="${buses}">
	<tr>
	  <td>${b.busName}</td>
	  <td>${b.busType}</td>
	  <td>${b.driverName}</td>
	  <td>${b.availableSeats}</td>
	  <td>₹ ${b.price}</td>
	  <td>
	    <a href="/user/book/${b.busId}" class="btn btn-success btn-sm">
	      Book
	    </a>
	  </td>
	</tr>
	</c:forEach>
	</tbody>
	</table>

	</div>


</body>
</html>
