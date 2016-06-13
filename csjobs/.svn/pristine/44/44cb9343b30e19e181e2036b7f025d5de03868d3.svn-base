<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<div id="header">
<h3 id="header_h3"><img src="../resources/CSULA_Logo.png" height="100" width="100"><label style="margin-top:15px">CSJobs</label></h3>
</div>

<div class="well" align="center" style="margin-top:20px;margin-left:300px;margin-right:300px">
<fieldset class="scheduler-border">
	
<legend class="scheduler-border">Register</legend><br />
<form:form modelAttribute="user">
<table>
<tr><th  height="50">First Name</th> <td height="50" width="70%" align="right"><form:input path="firstName" cssClass="form-control" placeholder="Enter First Name"/><div style="color:red" align="left"><form:errors path="firstName" /></div></td></tr>
<tr><th height="50">Last Name</th><td height="50"><form:input path="lastName" cssClass="form-control" placeholder="Enter Last Name"/><div style="color:red"><form:errors path="lastName" /></div></td></tr>
<tr><th height="50">User Name(Email id)</th><td height="50"><form:input path="email" cssClass="form-control" placeholder="Enter Email"/><div style="color:red"><form:errors path="email" /></div></td></tr>
<tr><th height="50" width="200" >Password</th><td height="50"><form:password path="password" cssClass="form-control" placeholder="Enter Password"/><div style="color:red"><form:errors path="password" /></div></td></tr>
<tr><th height="50">Address</th><td height="50"><form:input path="address" cssClass="form-control" placeholder="Enter Address"/><div style="color:red"><form:errors path="address" /></div></td></tr>
<tr><th height="50">Phone</th><td height="50"><form:input path="phone" cssClass="form-control" placeholder="Enter Phone Number" /><div style="color:red"><form:errors path="phone" /></div></td></tr>
<tr><td colspan="2" align="center"><input type="submit" class="btn-success btn-circle btn-xl" value="Register" name="register" /></td></tr>
</table>
</form:form>
</fieldset>
</div>
<div class="footer">
<center>Copyright &copy; Surenkumar. All rights reserved.</center>
</div>
</body>
</html>