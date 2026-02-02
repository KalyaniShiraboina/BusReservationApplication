<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	      rel="stylesheet">

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<title>Book Ticket</title>
</head>
<body>
	<jsp:include page="common/navbar.jsp"/>


	<div class="container mt-5 col-md-6">

	<div class="card shadow">
	<div class="card-body">

	<h3 class="text-center mb-4">Book Ticket</h3>

	<c:if test="${not empty error}">
	  <div class="alert alert-danger">${error}</div>
	</c:if>

	<form action="/user/book" method="post">

	  <input type="hidden" name="busId" value="${busId}"/>

	  <label class="form-label">Seats Required</label>
	  <input type="number" name="seats" class="form-control" required>

	  <br>
	  <button class="btn btn-primary w-100">Confirm Booking</button>

	</form>

	</div>
	</div>

	</div>

</body>
</html>
