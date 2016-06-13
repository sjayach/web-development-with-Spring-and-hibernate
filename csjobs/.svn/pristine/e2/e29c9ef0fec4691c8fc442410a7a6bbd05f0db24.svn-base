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
</head>
<body id="background">
<ol class="breadcrumb">
	<li>
		<a href="<c:url value='/'/>">CS Jobs</a>
	</li>
	<li class="active">
		Applicant
	</li>
</ol>
<div align="right" style="margin-top:20px;margin-right:50px">
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Logout" class="btn btn-danger btn-sm active" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<!-- <a href="/csjobs" class="btn btn-danger btn-sm active">Logout</a> -->
</div>

<b> Hello, ${loggedInUser }</b>


<div class="well" style="margin-top:30px">
<fieldset class="scheduler-border">
		<legend class="scheduler-border"><h2>Applied Jobs</h2></legend>

<table class="table table-striped">
	<tr>
		<th>Title</th>
		<th></th>
	</tr>
	<c:forEach items="${appliedjobs}" var="job">
		<tr>
			<th>${job.title}</th>
			<td align="left"><span style="margin-left:300px;float:left"><a href="application/showApplication.html?id=${job.id }" class="btn btn-primary btn-sm active">Show Application</a></span>
		</tr>
	</c:forEach>
</table>
</fieldset>
</div>
<br />
<div class="well">
<fieldset class="scheduler-border">
		<legend class="scheduler-border"><h2>Available Jobs</h2></legend>

<c:choose>
	<c:when test="${not empty NoAvailableJobs}">
	<h2>${NoAvailableJobs}</h2>
	</c:when>
	<c:otherwise>
	<table class="table table-striped" >
		<tr>
			<th>Title</th>
			<th></th>
			<c:forEach items="${availablejobs}" var="apply">
				<tr>
					<th class="text-left">${apply.title}</th>
					<td align="left"><span style="margin-left:300px;float:left"><a href="application/apply.html?jobid=${apply.id}" class="btn btn-success btn-sm active">Apply</a></span></td>
				</tr>
			</c:forEach>
			
	</table>
	</c:otherwise>
</c:choose>
</fieldset>
</div>
<div class="footer">
<center>Copyright &copy; Surenkumar. All rights reserved.</center>
</div>
</body>
</html>