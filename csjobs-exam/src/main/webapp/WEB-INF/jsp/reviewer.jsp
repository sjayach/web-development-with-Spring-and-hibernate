<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs - Reviewer</title>
</head>
<body>
<h2>CS Jobs (Exam Edition)</h2>

<p>You are logged in as <em><security:authentication property="principal.name" /></em>.</p>
<form action="<c:url value='/logout' />" method="post">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  <input name="submit" type="submit" value="Logout" />
</form>
<p>
  <security:authorize access="hasRole('ROLE_ADMIN')">
    [<a href="<c:url value='/admin.html' />">Admin Home</a>]
  </security:authorize>
  <security:authorize access="hasRole('ROLE_REVIEWER')">
    [Reviewer Home]
  </security:authorize>
    [<a href="<c:url value='/applicant.html' />">Applicant Home</a>]
</p>
<form method="get">
<input type="text" name="term" />
<input type="submit" value="Search CV" />
</form>
<br />
<br />
<c:set var="principalReviewer"><security:authentication property='principal.id' /></c:set>
<table border="1">
<tr>
	<th> Job Position</th>
	<th>Applicant </th>
	<th>CV</th>
	<c:forEach items="${allApplication}" var="app">
		<tr>
			<td>${app.job.title }</td>
			<td>${app.applicant.firstName} ${app.applicant.lastName }</td>
			<td><a href="<c:url value='/download.html?fileId=${app.cv.id}' />">View</a></td>
	
	
		</tr>
	</c:forEach>
</tr>
</table>
</body>
</html>
