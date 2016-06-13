<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Guest Book - Add Comment</title>
</head>
<body>

<form action="AddComment" method="post">
<c:if test="${empty sessionScope.name}">
name: <input name='name' type='text' /> <br />
</c:if>
<c:if test="${not empty sessionScope.name}">
name: ${sessionScope.name} <br />
</c:if>
comment: <input name='comment' type='text' /> <br />
<input name='submit' type='submit' value='Add' />
</form>

</body>
</html>
