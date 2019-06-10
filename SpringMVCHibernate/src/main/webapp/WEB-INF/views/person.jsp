<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Person Page</title>
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
	Add a Person
</h1>

<c:url var="addAction" value="/person/add" ></c:url>

<form:form action="${addAction}" commandName="person">
<table>
	<c:if test="${!empty person.firstName}">
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
			<form:label path="groupId">
				<spring:message text="Group Name"/>&nbsp;&nbsp;
			</form:label>
		</td>
	<td><form:select path="groupId">
                <form:option value="0" label="--- Select ---" />
                <c:forEach var="theUser" items="${listGroups}">
                    <form:option value="${theUser.id}"><c:out value="${theUser.groupName}"/></form:option>
                </c:forEach>
                </form:select>
            </td>
	</tr>
	
	<tr>
		<td>
			<form:label path="firstName">
				<spring:message text="First Name"/>&nbsp;&nbsp;
			</form:label>
		</td>
		<td>
			<form:input path="firstName" />
		</td> 
	</tr>
	
	
	<tr>
		<td>
			<form:label path="firstName">
				<spring:message text="First Name"/>&nbsp;&nbsp;
			</form:label>
		</td>
		<td>
			<form:input path="firstName" />
		</td> 
	</tr>
	
	<tr>
		<td>
			<form:label path="lastName">
				<spring:message text="Last Name"/>&nbsp;&nbsp;
			</form:label>
		</td>
		<td>
			<form:input path="lastName" />
		</td> 
	</tr>
	
	<tr>
		<td>
			<form:label path="occupation">
				<spring:message text="Occupation"/>&nbsp;&nbsp;
			</form:label>
		</td>
		<td>
			<form:input path="occupation" />
		</td> 
	</tr>
	
	<tr>
		<td>
			<form:label path="contactNumber">
				<spring:message text="Contact Number"/>&nbsp;&nbsp;
			</form:label>
		</td>
		<td>
			<form:input path="contactNumber" />
		</td> 
	</tr>
	
	<tr>
		<td>
			<form:label path="address">
				<spring:message text="Address"/>&nbsp;&nbsp;
			</form:label>
		</td>
		<td>
			<form:input path="address" />
		</td> 
	</tr>
	
	<tr>
		<td>
			<form:label path="emailAddress">
				<spring:message text="Email Address"/>&nbsp;&nbsp;
			</form:label>
		</td>
		<td>
			<form:input path="emailAddress" />
		</td> 
	</tr>
	
	<tr>
		<td>
			<form:label path="active">
				<spring:message text="Active"/>&nbsp;&nbsp;
			</form:label>
		</td>
		<td>
			<form:input path="active" />
		</td> 
	</tr>
	
	
	<tr>
		<td colspan="2">
		</br>
			<c:if test="${!empty person.firstName}">
				<input type="submit"
					value="<spring:message text="Edit Person"/>" />
			</c:if>
			<c:if test="${empty person.firstName}">
				<input type="submit"
					value="<spring:message text="Add Person"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>Persons List</h3>
<c:if test="${!empty listPersons}">
	<table class="tg">
	<tr>
		<th width="80">Person ID</th>
		<th width="100">First Name</th>
		<th width="100">Last Name</th>
		<th width="100">Contact Number</th>
		<th width="100">Email Address</th>
		<th width="100">Balance</th>
		
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listPersons}" var="person">
		<tr>
			<td>${person.id}</td>
			<td>${person.firstName}</td>
			<td>${person.lastName}</td>
			<td>${person.contactNumber}</td>
			<td>${person.emailAddress}</td>
			<td>${person.balance}</td>
			<td><a href="<c:url value='/edit/${person.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/remove/${person.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div>
</body>
</html>
