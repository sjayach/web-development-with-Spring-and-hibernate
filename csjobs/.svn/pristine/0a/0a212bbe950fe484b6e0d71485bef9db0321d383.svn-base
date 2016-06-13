<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value="/resources/main.css" />" rel="stylesheet">
</head>
<body id="background">
<div id="header">
<h3 id="header_h3"><img src="../resources/CSULA_Logo.png" height="100" width="100"><label style="margin-top:15px">CSJobs</label></h3>
</div>
<ol class="breadcrumb">
	<li>
		<a href="<c:url value='/'/>">CS Jobs</a>
	</li>
	<li class="active">
		View
	</li>
</ol>
<div class="well" style="margin-top:50px;margin-left:100px;margin-right:100px">
<table class="table table-striped">
	<tr>
		<th>ID</th>
		<td>${job.id} </td>
	</tr>
	<tr>
		<th>Title</th>
		<td>${job.title} </td>
	</tr>

	<tr>
		<th>Description</th>
		<td>${job.description} </td>
	</tr>
	<tr>
		<th>Publish Date</th>
		<td>${job.publishDate} </td>
	</tr>
	<tr>
		<th>Close Date</th>
		<td>${job.closeDate} </td>
	</tr>
	<sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_REVIEWER')">
	<tr>
		<th>Review Chair Person</th>
		<td>${job.committeeChair.fullName}</td>
	</tr>
	<tr>
		<th>Reviewers</th>
		<td>
		<c:forEach items="${job.committeeMembers}" var="mem">
		${mem.fullName}<br />
		</c:forEach>
		</td>
	</tr>
	</sec:authorize>
	
	
</table>
</div>
<div class="footer">
<center>Copyright &copy; Surenkumar. All rights reserved.</center>
</div>
</body>
</html>