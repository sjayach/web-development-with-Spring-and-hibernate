<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Guest Book</title>
</head>
<body>

<c:if test="${not empty name}">
<p>Welcome, ${name}!</p>
</c:if>

<table border="1">
<c:forEach items="${entries}" var="entry" varStatus="status">
<tr>
  <td>${entry.name} says</td>
  <td>${entry.comment}</td>
  <td><a href="EditComment?index=${status.index}">Edit</a></td>
</tr>
</c:forEach>
</table>

There are ${fn:length(entries)} comments so far.

<p><a href="AddComment">Add Comment</a></p>
</body>
</html>
