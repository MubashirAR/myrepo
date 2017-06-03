<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

								<form id="register-form" action="register" method="post" role="form" >
									<div class="form-group">
										<input type="text" name="id" id="username" tabindex="1" class="form-control" placeholder="userID" value="" aria-required="true">
									</div>
									<div class="form-group">
										<input type="name" name="name" id="name" tabindex="1" class="form-control" placeholder="Name" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
										<input type="text" name="contact" id="contact" tabindex="2" class="form-control" placeholder="Contact">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-success" value="Register Now">
											</div>
										</div>
									</div>
								</form>
	<%-- 
	
	 <form action="register">
		USER ID:<input type="text" name="username"> <br>
		NAME:<input type="text" name="name"> <br>
		
		
		PASSWORD:<input
			type="password" name="password"> <br> 
		EMAIL ID:<input type="text" name="mail"> <br>
		CONTACT:<input type="text" name="contact"> <br>
			
			<input
			type="submit" value="login">
	</form>  --%>

</body>
</html>