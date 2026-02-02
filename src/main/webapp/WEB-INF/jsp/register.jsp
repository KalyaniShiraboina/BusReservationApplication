<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	      rel="stylesheet">

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<title>User Registration</title>
</head>
<body>
	<jsp:include page="common/navbar.jsp"/>


<h2>Register</h2>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>

<form action="/user/register" method="post">
    Username: <input type="text" name="username" required /><br><br>
    Password: <input type="password" name="password" required /><br><br>
    First Name: <input type="text" name="firstName" required /><br><br>
    Last Name: <input type="text" name="lastName" required /><br><br>
    Contact: <input type="text" name="contact" required /><br><br>
    Email: <input type="email" name="email" required /><br><br>
    <input type="submit" value="Register" />
</form>

<a href="/user/login">Already registered? Login here</a>

</body>
</html>
