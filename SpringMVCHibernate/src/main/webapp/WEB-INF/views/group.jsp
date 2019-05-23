<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Group Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container">
<h1>
	Add a Group
</h1>

<c:url var="addAction" value="/group/add" ></c:url>

<form:form action="${addAction}" commandName="group">
<table>
	<c:if test="${!empty group.groupName}">
	<tr>
		<td>
			<form:label path="id">
				<spring:message text="ID"/>&nbsp;&nbsp;
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="groupName">
				<spring:message text="Name"/>&nbsp;&nbsp;
			</form:label>
		</td>
		<td>
			<form:input path="groupName" />&nbsp;&nbsp;
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="type">
				<spring:message text="Type"/>&nbsp;&nbsp;
			</form:label>
		</td>
		<td>
			<form:input path="Type" />
		</td>
	</tr>
	
	<tr>
		<td>
			<form:label path="description">
				<spring:message text="Description"/>&nbsp;&nbsp;
			</form:label>
		</td>
		<td>
			<form:input path="description" />
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
		</br>
			<c:if test="${!empty group.groupName}">
				<input type="submit"
					value="<spring:message text="Edit Group"/>" />
			</c:if>
			<c:if test="${empty group.groupName}">
				<input type="submit"
					value="<spring:message text="Add Group"/>" />
			</c:if>
		</td>
	</tr>
	
</table>	
</form:form>
<br>
<h3>Groups List</h3>
<c:if test="${!empty listGroups}">
	<table class="tg">
	<tr>
		<th width="80">Group ID</th>
		<th width="120">Group Name</th>
		<th width="120">Group Description</th>
		<th width="120">Balance</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listGroups}" var="group">
		<tr>
			<td>${group.id}</td>
			<td>${group.groupName}</td>
			<td>${group.description}</td>
			<td>${group.balance}</td>
			<td><a href="<c:url value='/editGroup/${group.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/removeGroup/${group.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div>
</body>
</html>
