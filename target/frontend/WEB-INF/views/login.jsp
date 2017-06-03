<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<!--  <form action="validation">
		USER ID:<input type="text" name="username"> <br> PASSWORD:<input
			type="password" name="password"> <br> <input
			type="submit" value="login">
	</form>  -->

	<c:url var="addAction" value="j_spring_security_check"></c:url>
	<%-- 	<form id="login-form" action="${addAction}" method="post" role="form"
		style="display: block;">
		<div class="form-group">
			<input type="text" name="username" id="username" tabindex="1"
				class="form-control" placeholder="Username" value="" required>
		</div>
		<div class="form-group">
			<input type="password" name="password" id="password" tabindex="2"
				class="form-control" placeholder="Password" required>
		</div>
		<div class="form-group">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<input type="submit" name="login-submit" id="login-submit"
						tabindex="4" class="form-control btn btn-login" value="Log In">
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="row"></div>
		</div>
	</form>
 --%>

	<sec:authorize access="not isAuthenticated()">

		<div class="" id=""
			style="text-align: center; background-color: white;">
			<div class="well col-sm-12">

				<div class="panel panel-default" style="display: inline-flex">
					<div class="panel-body">

						<form class="form-inline" action="${addAction}" method="post">
							<div class="form-group" style="padding-top: 20px">
								<input type="text" name="username" id="username"
									class="form-control" placeholder="Username" required><br />
							</div>
							<br />
							<div class="form-group" style="padding-top: 20px">
								<input type="password" name="password" id="password"
									class="form-control" placeholder="Password" required>
							</div>
							<br /> <input type="submit" value="Login" class="btn btn-success"
								style="margin: 20px">

						</form>
					</div>
				</div>
			</div>
		</div>
	</sec:authorize>
	
		<sec:authorize access="isAuthenticated()">
		<center><h1>You are already logged in</h1></center>
	</sec:authorize>

</body>
</html>