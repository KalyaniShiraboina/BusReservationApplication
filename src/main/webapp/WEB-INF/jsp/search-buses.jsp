<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	      rel="stylesheet">

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<title>Search Buses</title>
</head>
<body>
	<jsp:include page="common/navbar.jsp"/>

	<div class="container mt-5">
	  <h2 class="text-center mb-4">Search Buses</h2>

	  <form action="search" method="post" class="row g-3">

	    <div class="col-md-5">
	      <label class="form-label">Source</label>
	      <select name="source" class="form-select">
	        <c:forEach var="r" items="${routes}">
	          <option value="${r.routeFrom}">${r.routeFrom}</option>
	        </c:forEach>
	      </select>
	    </div>

	    <div class="col-md-5">
	      <label class="form-label">Destination</label>
	      <select name="destination" class="form-select">
	        <c:forEach var="r" items="${routes}">
	          <option value="${r.routeTo}">${r.routeTo}</option>
	        </c:forEach>
	      </select>
	    </div>

	    <div class="col-md-2 d-flex align-items-end">
	      <button class="btn btn-primary w-100">Search</button>
	    </div>

	  </form>
	</div>


</body>
</html>
