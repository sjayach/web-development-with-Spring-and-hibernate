<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs - Admin</title>
</head>
<body>
<h2>CS Jobs (Exam Edition)</h2>

<p>You are logged in as <em>${authenticatedUser.firstName} ${authenticatedUser.lastName}</em>.
<a href="<c:url value='/logout.html' />">Logout</a></p>

<h3>Admin Home</h3>

<a href="job/addJob.html">Add new Job</a><br /><br />

<table border="1">
<tr>
<th>Job</th>
<th>PublishDate</th>
<th>CloseDate</th>
<th>Operations</th>
</tr>

<c:forEach items="${allJobs}" var="Job">
<tr>
<td><a href="<c:url value='/job/view_Jobs_Reviewer.html?id=${Job.id}' />">${Job.title}</a></td>
<td><fmt:formatDate value="${Job.publishDate}" pattern="M/d/yyyy"/></td>
<td><fmt:formatDate value="${Job.closeDate}" pattern="M/d/yyyy"/></td>
<td><a href="<c:url value='/job/editJob.html?editId=${Job.id}'/>">Edit</a></td>
</tr>
</c:forEach>

</table>
</body>
</html>
