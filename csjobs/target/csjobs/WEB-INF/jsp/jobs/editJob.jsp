<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
      <link href="<c:url value="/resources/main.css" />" rel="stylesheet">

</head>
<body id="background">
<div id="header">
<h3 id="header_h3"><img src="../resources/CSULA_Logo.png" height="100" width="100"><label style="margin-top:15px">CSJobs</label></h3>
</div>
<ol class="breadcrumb">
	<li>
		<a href="<c:url value='/'/>">CS Jobs</a>
	</li>
	<li>
		<a href="<c:url value='/admin.html' />">Admin</a>
	</li>
	<li class="active">
		Edit Job
	</li>
</ol>
<div class="well" align="center" style="margin-top:20px;margin-left:300px;margin-right:300px">
<fieldset class="scheduler-border">
	
<legend class="scheduler-border">Eidt Job</legend><br />

<form:form modelAttribute="jobEdit">
<input type="hidden" name="id" value="${jobEdit.id}" />
<table class="table table-striped">
<tr>
<th height="50">Title</th>
<td height="50" width="70%" align="right"><form:input path="title" cssClass="form-control" /></td>
</tr>
<tr>
<th>Description</th>
<td><form:textarea path="description" rows="5" cols="30" cssClass="form-control"/></td>
</tr>
<tr>
<th>Publish Date</th>
<td><form:input path="publishDate" cssClass="form-control" placeholder="M/d/yyyy"/></td>
</tr>
<tr>
<th>Close Date</th>
<td><form:input path="closeDate" cssClass="form-control" placeholder="M/d/yyyy"/></td>

</tr>
<tr>
<th>Committee Chair</th>
<td>
<form:select items="${availableReviewers}" path="committeeChair" itemValue="id" itemLabel="FullName" cssClass="form-control"/>
</td>
</tr>
<tr>
<th>Committee Members</th>
<td>
<c:forEach items="${availableReviewers}" var="reviewer">
<form:checkbox path="committeeMembers" value="${reviewer}" />
 ${reviewer.fullName}<br />
</c:forEach>
</td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="Save" name="Save" class="btn-success"/>
</tr>
</table>
</form:form>
</fieldset>
</div>

</body>
</html>