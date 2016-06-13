<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value="/resources/main.css" />" rel="stylesheet">
<style>
</style>
</head>
<body id="background">
<div id="header">
<h3 id="header_h3"><img src="../resources/CSULA_Logo.png" height="100" width="100"><label style="margin-top:15px">CSJobs</label></h3>
</div>

<div align="right" style="margin-top:20px;margin-right:50px">
<a href="/csjobs" class="btn btn-danger btn-sm active">Logout</a>
</div>
<h2>${app.job.title }</h2>
<div class="well" style="margin-top:50px;margin-right:160px;margin-left:60px" id="well">
<table class="table table-striped">
	<tr>
		<th class="text-center">Application Number</th>
		<td align="left">${app.id}</td>
	</tr>
	<tr>
		<th class="text-center">Submit Date</th>
		<td align="left">${app.submitDate}</td>
	</tr>
	<tr>
		<th class="text-center">Current Job Title</th>
		<td align="left">${app.currentJobTitle}</td>
	</tr>
	<tr>
		<th class="text-center">Current Job Institution</th>
		<td align="left">${app.currentJobInstitution}</td>
	</tr>
	<tr>
		<th class="text-center">Current Job Year</th>
		<td align="left">${app.currentJobYear}</td>
	</tr>
	<c:forEach items="${app.degrees}" var="degree">
		<tr>
			<th class="text-center"> Degree Details</th>
			<td align="left">${degree.name}<br /> ${degree.school} <br /> ${degree.year}</td>
		</tr>
	</c:forEach>
</table>
</div>
<div class="footer">
<center>Copyright &copy; Surenkumar. All rights reserved.</center>
</div>
</body>
</html>