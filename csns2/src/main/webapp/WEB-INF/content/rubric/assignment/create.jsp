<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="csns" uri="http://cs.calstatela.edu/csns" %>

<c:set var="section" value="${assignment.section}"/>

<script>
$(function(){
    $(".add").autocomplete({
        source: "<c:url value='/autocomplete/user' />",
        select: function(event, ui) {
            if( ui.item )
            {
                $("<span>").attr({
                    id: $(this).attr("id") + "-" + ui.item.id
                }).append(
                    $("<input>").attr({
                        type: "hidden",
                        name: "userId",
                        value: ui.item.id
                    })
                ).append(
                    $("<a>").attr({
                        href: "javascript:delete" + $(this).attr("id") + "(" + ui.item.id + ")"
                    }).text(ui.item.value)
                ).append(", ").insertBefore($(this));
                event.preventDefault();
                $(this).val("");
            }
        }
    });
    $("#publishDate").datetimepicker({
        timeFormat: 'HH:mm:ss'
    });
    $("#dueDate").datetimepicker({
        timeFormat: 'HH:mm:ss'
    });
    $("select[name='assignmentType']").click(function(){
       if( $(this).val() == "REGULAR" )
           window.location.href = "../../assignment/create?sectionId=${section.id}";
       else if( $(this).val() == "ONLINE" )
    	   window.location.href = "../../assignment/online/create?sectionId=${section.id}";
    });
    $("#rubric").change(function(){
    	$("#name").val( "Rubric: " + $(this).find(":selected").text() );
    });
    $("div.help").dialog({
        autoOpen: false,
        modal: true
    });
});
function help( name )
{
    $("#help-"+name).dialog("open");
}
function deleteevaluator( evaluatorId )
{
    var msg = "Are you sure you want to remove this evaluator?";
    if( confirm(msg) )
      $("#evaluator-"+evaluatorId).remove();
}
</script>

<ul id="title">
<li><a class="bc" href="<c:url value='/section/taught#section-${section.id}' />">${section.course.code} - ${section.number}</a></li>
<li>Create Assignment
  <select name="assignmentType" style="margin-left: 2em;">
    <option value="RUBRIC">Rubric</option>
    <option value="REGULAR">Regular</option>
    <option value="ONLINE">Online</option>
  </select>
</li>
</ul>

<form:form modelAttribute="assignment">
<table class="general">
  <tr>
    <th class="shrink">Name</th>
    <td>
      <form:input path="name" cssClass="leftinput" cssStyle="width: 99%;" maxlength="255" />
      <div class="error"><form:errors path="name" /></div>
    </td>
  </tr>

  <tr>
    <th>Rubric</th>
    <td>
      <form:select path="rubric">
        <form:options items="${rubrics}" itemLabel="name" />
      </form:select>
    </td>
  </tr>

  <tr>
    <th>Evaluators</th>
    <td>
      <form:checkbox path="evaluatedByInstructors" disabled="true" /> Instructors
      <form:checkbox path="evaluatedByStudents" /> Students
    </td>
  </tr>

  <tr>
    <th><csns:help name="exteva">External Evaluators</csns:help></th>
    <td><input id="evaluator" type="text" class="forminput add"
      name="ee" style="width: 150px;" /></td>
  </tr>

  <tr>
    <th><csns:help name="pubdate">Publish Date</csns:help></th>
    <td>
      <form:input path="publishDate" cssClass="leftinput" size="30" maxlength="30" />
    </td>
  </tr>

  <tr>
    <th><csns:help name="duedate">Due Date</csns:help></th>
    <td>
      <form:input path="dueDate" cssClass="leftinput" size="30" maxlength="30" />
    </td>
  </tr>

  <tr><th></th><td><input class="subbutton" type="submit" value="Create" /></td></tr>
</table>
</form:form>

<div id="help-exteva" class="help"><em>External Evaluators</em> are people who
are not in the class, e.g. other faculty or IAB members. They must have a CSNS
account and are in one of the department user groups: faculty, instructors, or
rubric evaluators.</div>

<div id="help-pubdate" class="help">
<em>Publish Date</em> controls when the assignment is made available to the
evaluators. The rubric of the assignment cannot be changed after the
assignment is published.</div>

<div id="help-duedate" class="help">
<p>Rubric evaluation must be completed before the due date</p></div>
