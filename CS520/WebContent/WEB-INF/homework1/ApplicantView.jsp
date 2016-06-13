<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="header_footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Applicant page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>
  <script language="javascript">

$(document).ready(function(){
	
 
    var count = 2;
    
    
 
    $("#addButton").click(function () {

		var newTextBoxDiv = $(document.createElement('div'))
			.attr("class", 'col-xs-3');
			newTextBoxDiv.attr("id", 'degree_div' + count);
 
		newTextBoxDiv.after().html(
			'<input required placeholder="Enter the Degree" class = "form-control" type="text" name="degree' + count + 
			'" id="degree' + count + '" value="" >');
 
		newTextBoxDiv.appendTo("#my_div");
		var newTextBoxDiv = $(document.createElement('div'))
			.attr("class", 'col-xs-5');
			newTextBoxDiv.attr("id", 'univ_div' + count);
 
		newTextBoxDiv.after().html(
			'<input required placeholder="Enter the University" class = "form-control" type="text" name="univ' + count + 
			'" id="univ' + count + '" value="" >');
 
		newTextBoxDiv.appendTo("#my_div");
		
		var newTextBoxDiv = $(document.createElement('div'))
			.attr("id", 'year_div' + count);
			newTextBoxDiv.attr("class", 'col-xs-1');
		newTextBoxDiv.appendTo("#my_div");	
		var s = $('<select class="form-control" required name=year'+count+' />');
 
		for(i=2016 ; i >1965 ; i--)
		{
			if (i == 2016) {
				$('<option value="">Year</option>').appendTo(s);
			}else 
				$('<option />', {value: i.toString(), text: i.toString()}).appendTo(s);
		}
 
		s.appendTo("#year_div"+count);
		
		var newTextBoxDiv = $(document.createElement('div'))
			.attr("id", 'remove_div' + count);
			newTextBoxDiv.attr("class", 'col-xs-1');
			newTextBoxDiv.after().html(
			'<button class="glyphicon glyphicon-trash" type="button" name="remove' + count + 
			'" id="removeButton" value="Remove" onClick="changeIt('+count+')"></button>');
		newTextBoxDiv.appendTo("#my_div");
		var newTextBoxDiv = $(document.createElement('div'))
			.attr("id", 'new_div' + count);
			newTextBoxDiv.after().html('<br /> <br />');
			newTextBoxDiv.appendTo("#my_div");
		$('#field').val(count.toString());
		
		++count;
	});
    /* $('#appName').blur(function() { 
    	var names;
    	names=${appNames};
    	var index;
    	for	(index = 0; index < names.length; index++) {
    	    if($("#appName").val() === names[index]) {
    	    	alert("You already applied for this job");
    	    }
    	}
    	
    });
 */  
});

$(document).ready(function () {

    $('#myform').validate({
        rules: {
            jobcheckbox: {
                required: true
            }
    		
        },
        messages: {
        	jobcheckbox: {
				required : "<label style='margin-left:15px' class='label label-danger'><big>Please select atleast one Job</big></label>",
        	}
		},
        errorPlacement: function(error, element) {
        	error.insertAfter("#error_div");
        }
        	
    });



});


    
	function changeIt(i) {
		$("#degree_div"+i).remove();
		$("#univ_div"+i).remove();
		$("#year_div"+i).remove();
		$("#remove_div"+i).remove();
		$("#new_div"+i).remove();

	}
</script>
<style>

</style>

</head>
<body id="background">
<div id="header">
<h3 id="header_h3"><a href="CSJobs"><img src="CSULA_Logo.png" height="100" width="100"><label style="margin-top:15px">CSJobs</label></a></h3>
</div>

<ol class="breadcrumb">
	<li>
		<a href="CSJobs">CS Jobs</a>
	</li>
	<li class="active">
		Applicant
	</li>
</ol>

<c:choose>
	<c:when test="${not empty nojobs}">
	<h3> No jobs Available</h3>
	</c:when>
	<c:otherwise>
		<h3>Applicant Form:</h3><br/>
		<form id="myform" action="Applicant" method="post">
		<div class="col-xs-4"><label>Name :</label> <input class="form-control" type="text" id="appName" name="ApplicantName" placeholder="Enter your name" required></div><br /><br /><br /><br />
			
			<label style="margin-left:15px">Available Jobs:(Job Description, Posted Date)</label> <br/>
			<div id="error_div"></div>
				<c:forEach items="${jobs}" var="joblist">
						<div class="checkbox" style="margin-left:15px">
						<label><input type="checkbox" name="jobcheckbox" value="${joblist.jobid }" />${joblist.job} (${joblist.date})</label>
					</div>

				</c:forEach>
			<br />
			
			<label style="margin-left:15px">Education:(Degree, University and Awarded year)</label><br />
		 
		
			<div class="col-xs-3">
				<input style="margin-right:47px" type="text" name="degree1" class="form-control" placeholder="Enter the Degree" required>
			</div>
			
			<div class="col-xs-5">
				<input style="margin-right:45px" type="text" name="univ1" class="form-control" placeholder="Enter the University " required>
			</div>
			
			<div class="col-xs-1">
				<select required name="year1" class="form-control">
					<option value="">Year</option>
					<c:forEach var="i" begin="0" end="50">
						<option value="${2015-i}">${2015-i}</option>
					</c:forEach>
				</select>
			</div><br /><br />
			
			<div id="my_div"></div>
			<input style="margin-left:15px" type="button" id="addButton" class="btn btn-info" value="Add Degree"><br /> <br />
			<input type="hidden" name="field" id="field" value="1">
			<div style="text-align:center">
				<input type="submit" class="btn btn-success" value="Submit" id="submit" style="margin-top:-20px;margin-bottom:25px">
			</div>
		</form>
	</c:otherwise>
</c:choose>
<div class="footer">
<center>Copyright &copy; Surenkumar. All rights reserved.</center>
</div>
</body>
</html>