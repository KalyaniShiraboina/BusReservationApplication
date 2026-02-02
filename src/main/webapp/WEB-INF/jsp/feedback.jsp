<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	      rel="stylesheet">

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<title>Feedback</title>
</head>
<body>
	<jsp:include page="common/navbar.jsp"/>


<h2>Give Feedback</h2>

<form action="/user/feedback/save" method="post">

    <input type="hidden" name="reservationId"
           value="${reservation.reservationId}" />

    Driver Rating (1–5):
    <input type="number" name="driverRating" min="1" max="5" required /><br><br>

    Service Rating (1–5):
    <input type="number" name="serviceRating" min="1" max="5" required /><br><br>

    Overall Rating (1–5):
    <input type="number" name="overallRating" min="1" max="5" required /><br><br>

    Comments:<br>
    <textarea name="comments"></textarea><br><br>

    <input type="submit" value="Submit Feedback" />

</form>

</body>
</html>
