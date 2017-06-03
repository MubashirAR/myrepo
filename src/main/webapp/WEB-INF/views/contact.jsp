<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>
</head>
<body>

<div class="panel panel-default" style="margin:50px">
<div class="container" >
	<div class="row" style="margin:40px 10px 40px 10px">
		<div class="span6">
            <form>
                <div class="controls controls-row">
                    <input id="name" name="name" type="text" class="form-control" placeholder="Name"><br/> 
                    <input id="email" name="email" type="email" class="form-control" placeholder="Email address"><br/>
                </div>
                <div class="controls">
                    <textarea id="message" name="message" class="form-control" placeholder="Your Message" rows="5"></textarea>
                </div>
                  <br/>
                <div class="controls">
                    <button id="contact-submit" type="submit" class="btn btn-primary input-medium pull-right">Send</button>
                </div>
            </form>
        </div>
	</div>
</div>

</div>
</body>
</html>