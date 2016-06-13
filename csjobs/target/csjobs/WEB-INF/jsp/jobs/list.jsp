<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Available Jobs</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value="/resources/main.css" />" rel="stylesheet">
</head>
<body id="background">

<div id="header">
<h3 id="header_h3"><img src="resources/CSULA_Logo.png" height="100" width="100"><label style="margin-top:15px">CSJobs</label></h3>
</div>

<sec:authorize access="isAuthenticated()">
<div align="right" style="margin-top:20px;margin-right:50px">
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Logout" class="btn btn-danger btn-sm active" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</div>
<b>Hello, <sec:authentication property="principal.fullName" /></b>
</sec:authorize>

<div class="well" style="margin-top:50px;margin-left:100px;margin-right:100px">
	<fieldset class="scheduler-border">
	<legend class="scheduler-border"><h2>Available Jobs</h2></legend>
<table class="table table-striped">
	<tr>
		<th>Title</th>
	</tr>
	<c:forEach items="${jobs}" var="job">
		<tr>
			<td><a href="jobs/view.html?id=${job.id }">${job.title}</a></td>
		</tr>
	</c:forEach>
</table>
</fieldset>
</div>

<table align="center">
<tr>
<td><a href="register.html" class="btn-success btn-circle btn-xl" >Register</a></td><td width="150" align="center"><a href="login.html" class="btn-success btn-circle btn-xl" >Login</a></td>
</tr>
</table>
<div class="footer">
<center>Copyright &copy; Surenkumar. All rights reserved.</center>
</div>
</body>
</html>