<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="header_footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  
</head>
<body id="background">
<div id="header">
<h3 id="header_h3"><a href="CSJobs"><img src="CSULA_Logo.png" height="100" width="100"><label style="margin-top:15px">CSJobs</label></a></h3>
</div>
<div class="footer">
<center>Copyright &copy; Surenkumar. All rights reserved.</center>
</div>
<ol class="breadcrumb">
	<li>
		<a href="CSJobs">CS Jobs</a>
	</li>
	<li>
		<a href="Admin">Admin</a>
	</li>
	<li class="active">
		New Job Opening
	</li>
</ol>
<form action="NewJob" method="post">
	<table class="table table-bordered">
		<tr>
			<td><h4>Job:</h4></td>
			<td><div class="col-xs-7"><input class="form-control" type="text" name="JobName" required></div></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" class="post" value="Post"></td>
		</tr>
	</table>
</form>

</body>
</html>