<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>
<script language="javascript">
$(document).ready(function(){

	var count = 1;
	var numdegrees = 0;
	$("#addButton").click(function () {
		numdegrees = $(this).data('selector');
		count = Number(count) + Number(numdegrees);
			var newTextBoxDiv = $(document.createElement('div'))
			.attr("class", 'col-xs-3');
			newTextBoxDiv.attr("id", 'degree_div' + count);
		newTextBoxDiv.after().html(
			'<input placeholder="Enter the Degree" class = "form-control" type="text" name="degrees[' + count + 
			'].name" id="degree' + count + '" value="" >');
	
		newTextBoxDiv.appendTo("#my_div");
		var newTextBoxDiv = $(document.createElement('div'))
			.attr("class", 'col-xs-5');
			newTextBoxDiv.attr("id", 'univ_div' + count);
	
		newTextBoxDiv.after().html(
			'<input placeholder="Enter the University" class = "form-control" type="text" name="degrees[' + count + 
			'].school" id="univ' + count + '" value="" >');
	
		newTextBoxDiv.appendTo("#my_div");
		
		var newTextBoxDiv = $(document.createElement('div'))
			.attr("id", 'year_div' + count);
			newTextBoxDiv.attr("class", 'col-xs-2');
		newTextBoxDiv.appendTo("#my_div");	
		var s = $('<input type="number" placeholder="Year" class="form-control" name="degrees['+count+'].year" />');
	
		s.appendTo("#year_div"+count);
		
		var newTextBoxDiv = $(document.createElement('div'))
			.attr("id", 'new_div' + count);
			newTextBoxDiv.after().html('<br /> <br />');
			newTextBoxDiv.appendTo("#my_div");
		$('#field').val(count.toString());
		
		++count;
	});
	
});
</script>
      <link href="<c:url value="/resources/main.css" />" rel="stylesheet">
  

<style>

</style>
</head>
<body id="background">

<div id="header">
<h3 id="header_h3"><img src="../resources/CSULA_Logo.png" height="100" width="100"><label style="margin-top:15px">CSJobs</label></h3>
</div>
<form:form modelAttribute="application">
	<h2>${jobTitle}</h2>
	<div class="well">
	<fieldset class="scheduler-border">
		<legend class="scheduler-border">Current Job Info</legend>
		<div class="col-xs-3"><form:input path="currentJobTitle" cssClass="form-control" placeholder="Current Job Title" /><label style="color:red"><form:errors path="currentJobTitle" /> </label></div>
		<div class="col-xs-5"><form:input path="currentJobInstitution" cssClass="form-control" placeholder="Current Job Institution" /><label style="color:red"><form:errors path="currentJobInstitution" /></label></div>
		<div class="col-xs-2"><form:input type="number" path="currentJobYear" cssClass="form-control" placeholder="Start Year" /><label style="color:red"><form:errors path="currentJobYear" /></label> </div><br />
	</fieldset>
	</div>
	<div class="well">
	<fieldset class="scheduler-border">
	
		<legend class="scheduler-border">Education:(Degree, University and Awarded year)</legend><br />
		 
		
			<div class="col-xs-3">
				<form:input placeholder="Enter the Degree" path="degrees[0].name" cssClass="form-control"/>
				<label style="color:red"><form:errors path="degrees[0].name" /></label>
			</div>
			
			<div class="col-xs-5">
				<form:input placeholder="Enter the University" path="degrees[0].school" cssClass="form-control"/>
				<label style="color:red"><form:errors path="degrees[0].school" /></label>
			</div>
				
			<div class="col-xs-2">
				<form:input type="number" placeholder="Year" path="degrees[0].year" cssClass="form-control"/>
				<label style="color:red"><form:errors path="degrees[0].year" /></label>
			</div>
			<br /><br />
			<div id="my_div">
				<c:if test="${numdegrees > 1 }">
					<c:forEach var="i" begin="1" end="${numdegrees-1}">
						<div class="col-xs-3">
							<form:input placeholder="Enter the Degree" path="degrees[${i}].name" cssClass="form-control"/>
							<label style="color:red"><form:errors path="degrees[${i}].name" /></label>
						</div>
						<div class="col-xs-5">
							<form:input placeholder="Enter the University" path="degrees[${i}].school" cssClass="form-control"/>
							<label style="color:red"><form:errors path="degrees[${i}].school" /></label>
						</div>
						<div class="col-xs-2">
							<form:input type="number" placeholder="Year" path="degrees[${i}].year" cssClass="form-control" />
							<label style="color:red"><form:errors path="degrees[${i}].year" /></label>
						</div>
						<div><br /><br /></div>
					</c:forEach>
				</c:if>
			</div>
			</fieldset>
			<c:set var="degreeindex" value="0" />
	<c:if test="${not empty numdegrees}">
		<c:set var="degreeindex" value="${numdegrees-1}" />
	</c:if>
				<input style="margin-left:15px" type="button" id="addButton" class="btn btn-info" value="Add Degree" data-selector="${degreeindex}" ><br /> <br />
			
		
	</div>
	
	<input type="hidden" name="field" id="field" value="1">
	
	<center><input type="submit" class="btn btn-success" value="Apply" /></center>
</form:form>
<div class="footer">
<center>Copyright &copy; Surenkumar. All rights reserved.</center>
</div>
</body>
</html>