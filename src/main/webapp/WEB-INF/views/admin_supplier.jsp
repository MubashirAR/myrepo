<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:set var="id" value=""></c:set>
<c:set var="name" value=""></c:set>
<c:set var="description" value=""></c:set>
<c:forEach items="${suppliers }" var="supplier">
<c:if test="${supplier_id eq supplier.id}">
<c:set var="id" value="${supplier.id }"></c:set>
<c:set var="name" value="${supplier.name }"></c:set>
<c:set var="description" value="${supplier.address }"></c:set>
</c:if>
</c:forEach>


	<div class="container">

		<div class="panel panel-default col-sm-8 col-sm-offset-2">

			<div class="row panel-heading" style="background-color:green; color:white" >
				<h3>
					<span class="glyphicon glyphicon-dashboard"></span> <b>Manage Supplier</b>
				</h3>
			</div>

			<div class="panel-body">
				<form action="addsupplier">
				<label>ID:</label>
					<input type="text" name="id" class="form-control" required="required" value="${id }"> <br> <label>NAME:</label> <input
						type="text" name="name" class="form-control" required="required" value="${name }"> <br> <label>ADDRESS:</label><input
						type="text" name="address" class="form-control" required="required" value="${description }"> <br> <input type="submit" class="btn btn-success"
						value="Save">
				</form>


			</div>
		</div>
	</div>



</body>
</html>