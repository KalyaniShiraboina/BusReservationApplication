<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	      rel="stylesheet">

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<title>My Reservations</title>
</head>
<body>
	<jsp:include page="common/navbar.jsp"/>

	<div class="container mt-5">

	<h3>My Reservations</h3>

	<table class="table table-hover">
	<thead class="table-dark">
	<tr>
	  <th>ID</th>
	  <th>Bus</th>
	  <th>Seats</th>
	  <th>Status</th>
	  <th>Journey</th>
	  <th>Action</th>
	</tr>
	</thead>

	<tbody>
	<c:forEach var="r" items="${reservations}">
	<tr>
	  <td>${r.reservationId}</td>
	  <td>${r.bus.busName}</td>
	  <td>${r.seatsRequested}</td>
	  <td>${r.reservationStatus}</td>

	  <td>
	    <c:if test="${r.journeyEnded}">
	      Completed
	    </c:if>
	    <c:if test="${!r.journeyEnded}">
	      In Progress
	    </c:if>
	  </td>

	  <td>
	    <c:if test="${r.journeyEnded}">
	      <a class="btn btn-sm btn-warning"
	         href="/user/feedback/${r.reservationId}">
	         Feedback
	      </a>
	    </c:if>
	  </td>
	</tr>
	</c:forEach>
	</tbody>

	</table>
	</div>


</body>
</html>
