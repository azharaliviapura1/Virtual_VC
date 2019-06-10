<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<style type="text/css">
h1{
	color:#0000FF;
}

h2{
	color:#FF0000;
}
</style>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />


<link href="${jstlCss}" rel="stylesheet" />

</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container">
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="<%=request.getContextPath() %>">Home</a></li>
					<li><a href="<%=request.getContextPath() %>/persons">Add User</a></li>
					<li><a href="<%=request.getContextPath() %>/groups">Add Group</a></li>
					<li><a href="<%=request.getContextPath() %>/creditdebit">Credit/Debit</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<script type="text/javascript"
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>