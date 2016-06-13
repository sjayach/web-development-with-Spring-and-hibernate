<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  
  <link rel="stylesheet" type="text/css" href="header_footer.css">
  <style>

	h1 {
	margin-top:150px;
	font-size: 550%;
	}
	.btn-circle.btn-xl {
		display:block;
		width:100px;
		height:100px;
		border-radius:200px;
		font-size:20px;
		color:green;
		line-height:100px;
		text-align:center;
		background:#ddd
	}
  </style>
    <script language="javascript">
  $(document).ready(function(){
	  $('#bounce1,#bounce2').mouseover(function () {
          $(this).effect("bounce", { times:5},800);
    });
  });
  </script>
 
 
 
</head>
<body id="background">
<div id="header">
<h3 id="header_h3"><a href="CSJobs"><img src="CSULA_Logo.png" height="100" width="100"><label style="margin-top:15px">CSJobs</label></a></h3>
</div>
<div class="footer">
<center>Copyright &copy; Surenkumar. All rights reserved.</center>
</div>
<h1 align="center">CS Jobs</h1><br/>
<table align="center">
<tr>
<td>
<a href="Admin" class="btn-success btn-circle btn-xl" id="bounce1" style="background:#00CED1;"><i>Admin</i></a></td>
<td><a href="Applicant"  class="btn-success btn-circle btn-xl" style="margin-left:20px" id="bounce2"><i>Applicant</i></a></td>
</tr>
</table>
</body>
</html>