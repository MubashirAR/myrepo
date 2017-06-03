<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/general.css">







<style>
#box {
	color: black;
	/* Position absolutely, 30px down from the top */
	position: absolute;
	top: 70px;
	/* In my case I'm centering it in the window; do what you like */
	/* margin-left: -100px;
  
  width: 200px; */
	right: 20px;
	/* These are just for my example */
	height: 1.25em;
	border: 0px solid #bbb;
	text-align: center;
	font-size: 50px;
	color: black;
	text-shadow: 2px 2px 4px #ffffff;
}
</style>

<script>
	window.onload = function() {

		function getScrollTop() {
			if (typeof window.pageYOffset !== 'undefined') {
				// Most browsers
				return window.pageYOffset;
			}

			var d = document.documentElement;
			if (d.clientHeight) {
				// IE in standards mode
				return d.scrollTop;
			}

			// IE in quirks mode
			return document.body.scrollTop;
		}

		window.onscroll = function() {
			var box = document.getElementById('box'), scroll = getScrollTop();

			if (scroll <= 58) {
				box.style.top = "70px";
			} else {
				box.style.top = (scroll + 20) + "px";
			}
		};

	};
</script>
</head>


<body>




	<!-- ----------------------------------------REGISTER MODAL----------------------------------- -->


	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Sign Up</h4>
				</div>
				<div class="modal-body">
					<div class="span3">

						<form action="register" method="post">
							<div class="form-group">
								<input type="text" name="id" id="username" tabindex="1"
									class="form-control" placeholder="User Name" value="" required>
							</div>
							<div class="form-group">
								<input type="name" name="name" id="name" tabindex="1"
									class="form-control" placeholder="Full Name" value="" required>
							</div>
							<div class="form-group">
								<input type="password" name="password" id="password"
									tabindex="2" class="form-control" placeholder="Password"
									required>
							</div>
							<div class="form-group">
								<input type="email" name="mail" id="mail" tabindex="2"
									class="form-control" placeholder="e-mail" required>
							</div>
							<div class="form-group">
								<input type="text" name="contact" id="contact" tabindex="2"
									class="form-control" placeholder="10 digit mobile number"
									pattern="[789][0-9]{9}" required>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3">
										<input type="submit" name="register-submit"
											id="register-submit" tabindex="4"
											class="form-control btn btn-success" value="Register Now">
									</div>
								</div>
							</div>
							<!-- <div class="modal-footer">

								<input type="submit" value="Sign up"
									class="btn btn-primary pull-right">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div> -->
							<div class="clearfix"></div>
						</form>
					</div>

				</div>

			</div>

		</div>
	</div>









	<!-- 	<a href="add_to_cart">Add to cart</a>


	<input type="button" class="btn btn-submit"> This is home

		<input type="button" class="btn btn-submit">

	<br />
	<br /> -->
	<c:if test="${isAdmin==false}">

		<c:if test="${isClickedCart==true}"></c:if>

	</c:if>














	<nav class="navbar navbar-dark bg-inverse navbar-full"
		style="box-shadow: 0px 10px 5px #888888;">
	<div class=" container container-fluid" id="flipkart-navbar">
		<div class="navbar-header">
			<a class="navbar-brand" href="home"
				style="box-shadow: 0px 10px 25px #888888;">GetGadgets</a>
		</div>
		<ul class="nav navbar-nav">
			<sec:authorize access="!hasRole('ROLE_ADMIN')">


				<li><a href="about">About Us</a></li>
				<li><a href="contact">Contact Us</a></li>
				<li>
					<div class="dropdown" style="display: inline; padding-top: 20px">
						<button type="button" data-toggle="dropdown"
							style="color: #23527C; background-color: white; padding-top: 13px; border: none">
							<font color="#23527C">Categories </font><span class="caret"
								style="color: #23527C"></span>
						</button>
						<ul class="dropdown-menu">

							<c:forEach items="${navproducts }" var="navproduct">
								<li><a href="${navproduct.id }">${navproduct.name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</li>
			</sec:authorize>
		</ul>
		<!-- <form class="navbar-form navbar-left">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
			<button type="submit" class="btn btn-primary">Go</button>
		</form> -->
		<ul class="nav navbar-nav navbar-right">

			<sec:authorize access="hasRole('ROLE_ADMIN')">

				<li><a href="show_add_category"> Add Category </a></li>

				<li><a href="show_add_product"> Add Product </a></li>
				<li><a href="show_add_supplier"> Add Supplier </a></li>
			</sec:authorize>

			<sec:authorize access="not isAuthenticated()">
				<li><a href="#" data-toggle="modal" data-target="#myModal"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="login"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">

				<li><a href="j_spring_security_Logout"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</sec:authorize>

		</ul>

	</div>
	</nav>

	<c:if test="${show_cart }">
		<jsp:include page="cart.jsp"></jsp:include>
	</c:if>




	<c:if test="${isInvalidLogin }">
		<div style="width: 100%; text-align: center;">
			<h1>Invalid Credentials!</h1>
			<br />
			<h3>Please try again</h3>
		</div>
	</c:if>
	<%-- 
	<jsp:include page="admin_home.jsp"></jsp:include>

 --%>














	<c:if test="${show_about==true}">
		<jsp:include page="about.jsp"></jsp:include>

	</c:if>

	<c:if test="${show_contact==true}">
		<jsp:include page="contact.jsp"></jsp:include>

	</c:if>
	<sec:authorize access="!hasRole('ROLE_ADMIN')">

		<c:if test="${show_product_page}">
			<jsp:include page="productpage.jsp"></jsp:include>

		</c:if>
	</sec:authorize>
	
	<c:if test="${AddressPage}">
	<jsp:include page="AddressPage.jsp"></jsp:include>
	</c:if>
	
	<c:if test="${checkedOut}">
	<jsp:include page="checkedout.jsp"></jsp:include>
	</c:if>

	<!-- ---------------------------------------------ADMIN AREA------------------------------------------------------ -->



	<sec:authorize access="hasRole('ROLE_ADMIN')">


		<c:if test="${isClickedCategory }">
			<jsp:include page="admin_category.jsp"></jsp:include>
			<jsp:include page="categorylist.jsp"></jsp:include>
		</c:if>

		<c:if test="${isClickedProduct }">
			<jsp:include page="admin_product.jsp"></jsp:include>
			<jsp:include page="productlist.jsp"></jsp:include>
		</c:if>

		<c:if test="${isClickedSupplier }">
			<jsp:include page="admin_supplier.jsp"></jsp:include>
			<jsp:include page="supplierlist.jsp"></jsp:include>
		</c:if>

		<c:if test="${isClickedHome}">
			<jsp:include page="categorylist.jsp"></jsp:include>
			<jsp:include page="productlist.jsp"></jsp:include>
			<jsp:include page="supplierlist.jsp"></jsp:include>
		</c:if>






	</sec:authorize>








	<!-- ---------------------------------------Take me to the LOGIN PAGE--------------------------------------------- -->
	<c:if test="${isClickedLogin}">
		<jsp:include page="login.jsp"></jsp:include>
	</c:if>


	<!-- --------------------------------------------------USER LOGGED IN--------------------------------------------- -->
	<%-- 	<c:if test="${isUserLoggedIn==true}">
		<jsp:include page="logout.jsp"></jsp:include>
		<jsp:include page="cart.jsp"></jsp:include>
	</c:if>
 --%>

	<!-- ---------------------------------------Take me to the REGISTER PAGE--------------------------------------------- -->
	<c:if test="${isClickedRegister==true}">
		<jsp:include page="register.jsp"></jsp:include>
	</c:if>



	<!-- -------------------------------------------------------CAROUSEL-------------------------------------------------- -->
	<sec:authorize access="!hasRole('ROLE_ADMIN')">

		<c:if test="${show_carousel }">

			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox" align="center">
					<div class="item active">
						<img src="resources/images/Samsung_ban.jpg" alt="Galaxy C7 Pro">
						<div class="carousel-caption">Samsung Galaxy C7 Pro</div>
					</div>
					<div class="item">
						<img src="resources/images/MotoG5_ban.jpg" alt="...">
						<div class="carousel-caption">Moto G5</div>
					</div>

					<div class="item">
						<img src="resources/images/Redmi_ban.jpg" alt="...">
						<div class="carousel-caption">Moto G5</div>
					</div>

				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>

		</c:if>


























		<c:if test="${isClickedHome}">
			<h1 style="text-align: center">Products</h1>

		</c:if>
		<c:forEach items="${Products}" var="category">

			<a href="show_product${category.id}">
				<div class="panel panel-default col-xs-12 col-sm-4 col-md-4">
					<div class="panel-body">
						<img src="resources/images/${category.id }.jpg" class="img-responsive"
							alt="${category.description}"><br />
						<h4 style="text-align: center">${category.name}</h4>


					</div>
				</div>
			</a>
			
			
		</c:forEach>

		<c:if test="${display_category==true }">
		
			<div class="container">
				<div class="row">
					<c:forEach items="${products }" var="product">
						<c:if test="${product.category_id==category_id }">




							<div class="col-lg-4 col-md-4 col-sm-3 col-xs-12">
								<div class="my-list">
									<spring:url value="resources/images/${product.id}.jpg"
										var="imagepath">
									</spring:url>
									<img src="${imagepath}" alt="${product.name }" />
									<h3>${product.name }</h3>
									<span>${product.price }</span> <span class="pull-right">${product.id }</span>
									<div class="offer">${product.description }</div>
									<div class="detail">
										<p>${product.description }</p>
										<img src="${imagepath}" alt="dsadas" style="display: block" />
										<a class="btn btn-info" href="myCart/add/${product.id}">Add
											To Cart</a> <a href="show_product${product.id }"
											class="btn btn-info">Details</a>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</c:if>


	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_USER')">
		<a href="myCart"><div id='box'
				class="glyphicon glyphicon-shopping-cart"></div></a>
	</sec:authorize>




</body>
</html>