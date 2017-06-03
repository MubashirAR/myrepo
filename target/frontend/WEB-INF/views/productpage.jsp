<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Title</title>


<!-- --------------------------------------RESOURCES------------------------------------- -->

<link rel="stylesheet" href="resources/css/productpage.css"
	type="text/css">

<script type="text/javascript">

$(document).ready(function(){
    //-- Click on detail
    $("ul.menu-items > li").on("click",function(){
        $("ul.menu-items > li").removeClass("active");
        $(this).addClass("active");
    })

    $(".attr,.attr2").on("click",function(){
        var clase = $(this).attr("class");

        $("." + clase).removeClass("active");
        $(this).addClass("active");
    })

    //-- Click on QUANTITY
    $(".btn-minus").on("click",function(){
        var now = $(".section > div > input").val();
        if ($.isNumeric(now)){
            if (parseInt(now) -1 > 0){ now--;}
            $(".section > div > input").val(now);
        }else{
            $(".section > div > input").val("1");
        }
    })            
    $(".btn-plus").on("click",function(){
        var now = $(".section > div > input").val();
        if ($.isNumeric(now)){
            $(".section > div > input").val(parseInt(now)+1);
        }else{
            $(".section > div > input").val("1");
        }
    })                        
}) 


</script>
<style type="text/css">
/*----------------------
Product Card Styles 
----------------------*/
.panel.panel--styled {
    background: #F4F2F3;
}
.panelTop {
    padding: 30px;
}

.panelBottom {
    border-top: 1px solid #e7e7e7;
    padding-top: 20px;
}
.btn-add-to-cart {
    background: #FD5A5B;
    color: #fff;
}
.btn.btn-add-to-cart.focus, .btn.btn-add-to-cart:focus, .btn.btn-add-to-cart:hover  {
	color: #fff;   
    background: #FD7172;
	outline: none;
}
.btn-add-to-cart:active {
	background: #F9494B;
	outline: none;
}


span.itemPrice {
    font-size: 24px;
    color: #FA5B58;
}


/*----------------------
##star Rating Styles 
----------------------*/
.stars {
    padding-top: 10px;
	width: 100%;
	display: inline-block;
}
span.glyphicon {
    padding: 5px;
}
.glyphicon-star-empty {
    color: #9d9d9d;
}
.glyphicon-star-empty, .glyphicon-star { 
    font-size: 18px;
}
.glyphicon-star {
    color: #FD4;
    transition: all .25s;
}   
.glyphicon-star:hover { 
    transform: rotate(-15deg) scale(1.3); 
}






</style>
</head>
<body>
















<c:forEach items="${product_list}" var="product">
<c:if test="${pid eq product.id }">
<div class="container">    
		<div class="row">
			<div class="col-md-8">				
				<div class="panel panel-default ">
					<div class="panel-body">
						<div class="col-md-12 panelTop">	
							<div class="col-md-4">	
								<img class="img-responsive" src="resources/images/${product.id }.jpg" alt="${product.name }"/>
							</div>
							<div class="col-md-8">	
								<h2>${product.name }</h2>
								<p>${product.description }</p>
							</div>
						</div>
						
						<div class="col-md-12 panelBottom">
					
							<div class="col-md-4 text-left">
								<h5>Price <span class="itemPrice">${product.price }</span></h5>
							</div>
							<div class="col-md-4">
								<div class="stars">
								 <div id="stars" class="starrr"></div>
								</div>
							</div>
									<div class="col-md-4 text-center">
								<a class="btn btn-lg btn-success" href="myCart/add/${product.id }"><span class="glyphicon glyphicon-shopping-cart"></span>   Add to Cart</a>						
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>

</c:if>
</c:forEach>









</body>
</html>