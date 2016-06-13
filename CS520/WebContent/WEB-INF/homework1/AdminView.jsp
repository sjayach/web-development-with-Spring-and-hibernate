<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="header_footer.css">
  <style>
  table,th {
  	text-align: center;
  	
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
	<li class="active">
		Admin
	</li>
</ol>


<center><a href="NewJob" class="btn-success btn-circle btn-xl">New job</a></center><br /><br />
<div style="margin-right:150px;margin-left:150px">
<table class="table table-bordered">

	<tr>
       	<th>Job</th>
       	<th>Posted on</th>
       	<th></th>
    </tr>
    <c:forEach items="${jobAttr}" var="jobs">
    	<tr>
    		<td><font color="green">${jobs.job}</font></td>
    		<td><font color="green">${jobs.date}</font></td>
    		<td><a href="ViewApplicants?id=${jobs.jobid}"><font color="MediumVioletRed">Applicants</font></a></td>
    	</tr>
    </c:forEach>
	</table>
</div>
</body>
</html>