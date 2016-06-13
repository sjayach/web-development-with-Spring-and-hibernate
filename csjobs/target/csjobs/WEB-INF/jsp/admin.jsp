<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
      <link href="<c:url value="/resources/main.css" />" rel="stylesheet">

</head>
<body id="background">
<div id="header">
<h3 id="header_h3"><img src="<c:url value="/resources/CSULA_Logo.png" />" height="100" width="100"><label style="margin-top:15px">CSJobs</label></h3>
</div>
<ol class="breadcrumb">
	<li>
		<a href="<c:url value='/'/>">CS Jobs</a>
	</li>
	<li class="active">
		Admin
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

<b>Hello, ${loggedInUser}</b>

<center>
<a href="<c:url value="/jobs/addJob.html" />" class="btn-success btn-circle btn-xl">New Job</a><br /><br />
</center>
<div class="well" align="center" style="margin-top:20px;margin-left:300px;margin-right:300px">
<fieldset class="scheduler-border">
		<legend class="scheduler-border"><h2>Applied Jobs</h2></legend>

<table class="table table-striped">
<tr>
<th>Job</th>
<th>PublishDate</th>
<th>CloseDate</th>
<th>Operations</th>
<th>Action</th>
</tr>

<c:forEach items="${allJobs}" var="Job">
<tr>
<td><a href="<c:url value='/jobs/view.html?id=${Job.id}' />">${Job.title}</a></td>
<td><fmt:formatDate value="${Job.publishDate}" pattern="M/d/yyyy"/></td>
<td><fmt:formatDate value="${Job.closeDate}" pattern="M/d/yyyy"/></td>
<td><a href="<c:url value='/jobs/editJob.html?editId=${Job.id}'/>">Edit</a></td>
<td><a href="viewApplications.html?jobId=${Job.id}">Show Applications</a></td>
</tr>
</c:forEach>

</table>
</fieldset>
</div>

</body>
</html>