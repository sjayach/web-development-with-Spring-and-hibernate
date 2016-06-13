<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form:form modelAttribute="jobEdit">
<input type="hidden" name="id" value="${jobEdit.id}" />
<table border = 1>
<tr>
<th>Title</th>
<td><form:input path="title" /></td>
</tr>
<tr>
<th>Description</th>
<td><form:textarea path="description" rows="5" cols="30" /></td>
</tr>
<tr>
<th>Publish Date</th>
<td><form:input path="publishDate" /></td>
</tr>
<tr>
<th>Close Date</th>
<td><form:input path="closeDate" /></td>
</tr>
<tr>
<th>Committee Chair</th>
<td>
<select name="committee_head">
<c:forEach items="${availableReviewers}" var="rhead">


<c:choose>
<c:when test="${rhead.id eq jobEdit.committeeChair.id}">
<option value ="${rhead.email}" selected="selected">${rhead.firstName} ${rhead.lastName}</option>
</c:when>
<c:otherwise>
<option value ="${rhead.email}">${rhead.firstName} ${rhead.lastName}</option>
</c:otherwise>
</c:choose>
</c:forEach>
</select>
</td>
</tr>
<tr>
<th>Committee Members</th>
<td>
<c:forEach items="${availableReviewers}" var="review">
<input type="checkbox" name="rev"  value="${review.id}"/> ${review.firstName} ${review.lastName}<br />
</c:forEach>
</td>
</tr>
<tr>
<td><input type="submit" value="Save" name="Save" />
</tr>
</table>
</form:form>

</body>
</html>