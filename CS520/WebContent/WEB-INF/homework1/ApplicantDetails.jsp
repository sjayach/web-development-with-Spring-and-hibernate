<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ApplicantDetails</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <style>
  table,th {
  	text-align: center;
  }
  </style>
  <link rel="stylesheet" type="text/css" href="header_footer.css">
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
		Applicant
	</li>
</ol>
<h2>Job Position: ${jobTitle}</h2><br />
<h3>Applicant: ${applicantDetails.name}</h3><br />
<h3>Education:</h3><br />
<div style="margin-right:150px;margin-left:150px">
<table class="table table-bordered">

	<tr>
       	<th align="center">Degree</th>
       	<th>University</th>
       	<th>Year</th>
    </tr>
   <c:forEach items="${applicantDetails.degreedetails}" var="d">
   	<tr>
   		<td>${d.degree}</td>
   		<td>${d.univ}</td>
   		<td>${d.year}</td>
   	</tr>
   </c:forEach>
	</table>
</div>
</body>
</html>