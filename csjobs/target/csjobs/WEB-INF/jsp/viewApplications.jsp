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
<h3 id="header_h3"><img src="resources/CSULA_Logo.png" height="100" width="100"><label style="margin-top:15px">CSJobs</label></h3>
</div>
<ol class="breadcrumb">
	<li>
		<a href="<c:url value='/'/>">CS Jobs</a>
	</li>
	<li>
		<sec:authorize access="hasRole('ROLE_REVIEWER')">
			<a href="<c:url value='/reviewer.html'/>">Reviewer</a>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<a href="<c:url value='/admin.html'/>">Admin</a>
		</sec:authorize>
	</li>
	<li class="active">
		View Applications
	</li>
</ol>

<div class="well" style="margin-top:50px;margin-left:100px;margin-right:100px">
	<fieldset class="scheduler-border">
	<legend class="scheduler-border"><h2>Applications Detail</h2></legend>
<table class="table table-striped">
	<tr>
		<th>Applicant Name</th>
		<th>Action</th>
	</tr>
	<c:forEach items="${ viewApp}" var="app" >
	<tr>
		<td>
			${app.applicant.fullName}
		</td>
		<td>
			<a href="application/showApplication.html?appId=${app.id}">Show Application</a>
	</tr>
	</c:forEach>
</table>
</fieldset>
</div>
</body>
</html>