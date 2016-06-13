<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value="/resources/main.css" />" rel="stylesheet">
</head>
<body id="background">
Hello, ${loggedInUser }
<div id="header">
<h3 id="header_h3"><img src="resources/CSULA_Logo.png" height="100" width="100"><label style="margin-top:15px">CSJobs</label></h3>
</div>
<ol class="breadcrumb">
	<li>
		<a href="<c:url value='/'/>">CS Jobs</a>
	</li>
	<li class="active">
		Reviewer
	</li>
</ol>



<div align="right" style="margin-top:20px;margin-right:50px">
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Logout" class="btn btn-danger btn-sm active" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</div>
<b>Hello, <sec:authentication property="principal.fullName" /></b>

<div class="well" style="margin-top:50px;margin-left:100px;margin-right:100px">
	<fieldset class="scheduler-border">
	<legend class="scheduler-border"><h2>Available Jobs</h2></legend>
<table class="table table-striped">
	<tr>
		<th>Title</th>
		<th>Action</th>
	</tr>
	<c:forEach items="${openJobs}" var="job">
		<tr>
			<td><a href="jobs/view.html?id=${job.id }">${job.title}</a></td>
			<td>
			<c:forEach items="${job.committeeMembers}" var="rev">
			<sec:authorize access="principal.username == '${rev.username}'">
			<a href="viewApplications.html?jobId=${job.id}">Show Applications</a>
			</sec:authorize>
			</c:forEach>
			</td>
			
		</tr>
	</c:forEach>
</table>
</fieldset>
</div>

<div class="footer">
<center>Copyright &copy; Surenkumar. All rights reserved.</center>
</div>
</body>
</html>