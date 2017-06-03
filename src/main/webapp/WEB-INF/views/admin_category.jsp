<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



	<div class="container">

		<div class="panel panel-default col-sm-8 col-sm-offset-2">

			<div class="row panel-heading"
				style="background-color: green; color: white">
				<h3>
					<span class="glyphicon glyphicon-dashboard"></span> <b>Manage Category</b>
				</h3>
			</div>

			<div class="panel-body">

				<form action="addcategory">
					<label>ID:</label> <input type="text" name="id"
						class="form-control" required="required"> <br>
					<label>NAME:</label> <input type="text" name="name"
						class="form-control" required="required"> <br> <label>DESCRIPTION:</label><input
						type="text" name="description" class="form-control"
						required="required"> <br> <input type="submit"
						value="Save" class="btn btn-success">
				</form>

			</div>
		</div>
	</div>
</body>
</html>