<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>




  <div class="row">
    <div class="col-md-4 col-md-offset-4">
      <form:form class="form-horizontal" role="form" action="checkedout" method="post" modelAttribute="address_object">
        <fieldset>

          <!-- Form Name -->
          <legend>Address Details</legend>

          <!-- Text input-->

            <label class="col-sm-2 control-label" for="textinput" >Block No</label>

              <input type="text" placeholder="e.g. 102-D" class="form-control" name="bno">



          <!-- Text input-->

            <label class="col-sm-2 control-label" for="textinput">Street</label>

              <input type="text" placeholder="J.P. Road" class="form-control" name="street">



          <!-- Text input-->
  
            <label class="col-sm-2 control-label" for="textinput">City</label>
  
              <input type="text" placeholder="Mumbai" class="form-control" name="city">
  
  

          <!-- Text input-->
  
            <label class="col-sm-2 control-label" for="textinput">State</label>
  
              <input type="text" placeholder="Maharashtra" class="form-control" name="state">
  

            <label class="col-sm-2 control-label" for="textinput">Postcode</label>
  
              <input type="text" placeholder="400001" class="form-control" name="pin">
  
  



          <!-- Text input-->

            <label class="col-sm-2 control-label" for="textinput">India</label>

              <input type="text" placeholder="Country" class="form-control" name="country">






                <a href="home" class="btn btn-default" >Cancel</a>
                <input type="submit" class="btn btn-primary" value="Checkout">




        </fieldset>
      </form:form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
</body>
</html>