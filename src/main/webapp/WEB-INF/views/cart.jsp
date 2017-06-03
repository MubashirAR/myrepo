<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<div class="container text-center">
		<div class="row">
			<div class="col-xs-8">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title">
							<div class="row">
								<div class="col-xs-6">
									<h5>
										<span class="glyphicon glyphicon-shopping-cart"></span>
										Shopping Cart
									</h5>
								</div>
								<div class="col-xs-6">
									<a href="home" type="button" class="btn btn-primary btn-sm btn-block">
										<span class="glyphicon glyphicon-share-alt"></span> Continue
										shopping
									</a>
								</div>
							</div>
						</div>
					</div>
					<c:set var="total" value="${0}"/>
					<c:forEach items="${cartList}" var="cart_item">

						<hr>
						<div class="row" style="padding-left:20px">
							<div class="col-xs-2">
								<img class="img-responsive" src="http://placehold.it/100x70">
							</div>
							<div class="col-xs-4">
								<h4 class="product-name">
									<strong>${cart_item.name }</strong>
								</h4>
								
							</div>
							<div class="col-xs-6">
								<div class="col-xs-6 text-right">
									<h6>
										<strong>${cart_item.price } <span class="text-muted">x</span></strong>
										    
										
									</h6>
								</div>
								<div class="col-xs-4">
									<input type="text" class="form-control input-sm" value="${cart_item.quantity }">
									<c:set var="total" value="${total + cart_item.price*cart_item.quantity}" />
								</div>
								<div class="col-xs-2">
									<a type="button" class="btn btn-link btn-xs" href="myCart/delete/${cart_item.id}">
										<span class="glyphicon glyphicon-trash"> </span>
									</a>
								</div>
							</div>
						</div>

					</c:forEach>
					<hr>
					<div class="row">
						<div class="text-center">
							<div class="col-xs-9">
								<h6 class="text-right">Added items?</h6>
							</div>
							<div class="col-xs-3">
								<button type="button" class="btn btn-default btn-sm btn-block">
									Update cart</button>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<div class="row text-center">
						<div class="col-xs-9">
							<h4 class="text-right">
								Total <strong>${total }</strong>
							</h4>
						</div>
						<div class="col-xs-3">
							<a href="checkout" type="button" class="btn btn-success btn-block">
								Checkout</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

<h1 align="center">Suggestions</h1>















</body>
</html>