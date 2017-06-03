<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

			<div class="span7">
				<div class="widget stacked widget-table action-table">

					<div class="widget-header">
						<i class="icon-th-list"></i>
						<h3 style="text-align:center">Categories Available</h3>
					</div>
					<!-- /widget-header -->

					<div class="widget-content">
						<!-- -----------------------------------------------List--------------------------------------------------------------- -->
						<table class="table table-striped table-bordered">
							<tr>
								<th>ID</th>
								<th>Category Name</th>
								<th>Description</th>
								<th>Edit/Delete</th>
							</tr>
								<c:forEach items="${Categories}" var="product">
									<tr>
										<td>${product.id }</td>
										<td>${product.name }</td>
										<td>${product.description}</td>
										
										<td><a
											href="<c:url value= 'show_add_category${product.id}'/>"
											class="btn btn-small "><span
												class="glyphicon btn-icon-only glyphicon glyphicon-pencil"></span></a>
											<a href="<c:url value='/deletecategory/${product.id}'/>"
											class="btn btn-small "><span
												class="glyphicon glyphicon-trash"></span></a></td>
									</tr>
								</c:forEach>
						</table>
					</div>
					<!-- /widget-content -->

				</div>
				<!-- /widget -->
			</div>


</body>
</html>