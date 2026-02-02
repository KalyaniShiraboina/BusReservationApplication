<%
    if(session.getAttribute("user") == null){
        response.sendRedirect("login");
    }
%>

<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	      rel="stylesheet">

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<title>User Dashboard</title>
</head>
<body>
	<jsp:include page="common/navbar.jsp"/>


<h2>Welcome, ${sessionScope.user.firstName}</h2>

<ul>
    <li><a href="/user/search">Search Buses</a></li> 
	<li><a href="/user/my-reservations">My Reservations</a></li>
	<li><a href="/logout">Logout</a></li>
 
</ul>

</body>
</html>
