<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	      rel="stylesheet">

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<title>Booking Successful</title>
</head>
<body>
	<jsp:include page="common/navbar.jsp"/>


<h2>Booking Confirmed</h2>

<p>Reservation ID: ${reservation.reservationId}</p>
<p>Bus: ${reservation.bus.busName}</p>
<p>Seats: ${reservation.seatsRequested}</p>
<p>Status: ${reservation.reservationStatus}</p>

<a href="/user/search">Book Another Ticket</a>

</body>
</html>
