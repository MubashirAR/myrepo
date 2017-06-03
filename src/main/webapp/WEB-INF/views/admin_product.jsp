<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<html>
  
<head>
<title>Product Page</title>

<spring:url value="/resources/images/" var="imag"></spring:url>
<style type="text/css">
.panel-default>.panel-heading {
    color: #f7f4f4;
    background-color: #3c48a5;
    border-color: #118ef9;
}
</style>


</head>
<body>
<%-- ${msg}<br>
${message}<br>
 --%>
<c:set var="id" value=""></c:set>
<c:set var="name" value=""></c:set>
<c:set var="description" value=""></c:set>
<c:set var="price" value=""></c:set>
<c:forEach items="${product }" var="supplier">
<c:if test="${product_id eq supplier.id}">
<c:set var="id" value="${supplier.id }"></c:set>
<c:set var="name" value="${supplier.name }"></c:set>
<c:set var="description" value="${supplier.description }"></c:set>
<c:set var="price" value="${supplier.price }"></c:set>
</c:if>
</c:forEach>




<div class="container">

	<div class="panel panel-default col-sm-8 col-sm-offset-2">

		<div class="row panel-heading " style="background-color:green; color:white"><h3><span class="glyphicon glyphicon-dashboard"></span>  <b>Manage Product</b></h3></div>

		<div class="panel-body">
		
		 <c:url var="addAction" value="addproduct"></c:url> 
		  
			<form:form method="post" action="${addAction}"  modelAttribute="product_object" enctype="multipart/form-data" >

				
					<div class="row">
						<div class="col-sm-3">
							<form:label path="">
								<spring:message text="Product Id" />
							</form:label>
						</div>
						<div class="col-sm-9">
							<form:input path="id"  class="form-control" value="${id }"/>
							
						</div>
					</div>
				
				<br>
				<div class="row">
					<div class="col-sm-3">
						<form:label path="">Product Name</form:label>
					</div>
					<div class="col-sm-9">
						<form:input path="name" cssClass="form-control" required="" value="${name }"/>
						<span><form:errors path="name" cssClass="error" /></span>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-3">
						<form:label path="description">Product Description</form:label>
					</div>
					<div class="col-sm-9">
						<form:input path="description" class="form-control" value="${description }"/>
						<span><form:errors path="description" cssClass="error" /></span>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-3">
						<form:label path="">Product Suppliers</form:label>
					</div>
					<div class="col-sm-9">
						<form:select path="supplier_id" cssClass="form-control">

							<c:forEach items="${supplierList}" var="supplier">

								<form:option value="${supplier.id }">${supplier.id}</form:option>

							</c:forEach>

						</form:select>
					</div>
				</div>
				
				<br>

				
				<div class="row">
					<div class="col-sm-3">
						<form:label path="">Product Category</form:label>
					</div>
					<div class="col-sm-9">
						<form:select path="category_id" cssClass="form-control">

							<c:forEach items="${categoryList}" var="category">

								<form:option value="${category.id }">${category.id}</form:option>

							</c:forEach>

						</form:select>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-3">
						<form:label path="">Product Price</form:label>
					</div>
					<div class="col-sm-9">
						<form:input path="price" class="form-control" value="${price }"/>
						<span><form:errors path="price" cssClass="error" /></span>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-3">
						<form:label path="file">
							<spring:message text="Choose Image" />
						</form:label>
					</div>
					<div class="col-sm-9">
						<form:input path="file" type="file" cssClass="form-control"
							required="required" />
					</div>
				</div>
				<br>
					
					
					<input type="submit" name=action value="save" class="btn btn-success"/>
					 
			</form:form>
		</div>
	</div>
	
	</div>

</body> 

</html>

</body> 

</html>


	