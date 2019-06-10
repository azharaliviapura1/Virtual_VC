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
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">	
$(document).ready(function(){
    $("#group_id").change(function(){
    	// alert("On Change");
    	var val=$(this).val();
        
        // alert(val);
        $.ajax({
            type : "GET",
            url : "${pageContext.request.contextPath}/getusersByGroup",
            data : {
            "groupId" : $(this).val()
            },
            dataType: "json",
            success: function(data){
            //response from controller
           // alert("success");
            // alert('data'+data.length);
            
             
                $('#user_id').html('');  
                var options = '';  
                options += '<option value="Select">Select</option>';  
                for (var i = 0; i < data.length; i++) { 
                	alert(data[i].firstName);
                    options += '<option value="' + data[i].id + '">' + data[i].firstName + '</option>';  
                }  
                $('#user_id').append(options);  

           
            
            
            },
            error:function(){
                alert("error");
            }
        });
});
    
    
//************ Load Transaction Data **********/////

    $("#loadButton").click(function(){
    	// alert("On Change");
        
        // alert(val);
        $.ajax({
            type : "GET",
            url : "${pageContext.request.contextPath}/loadTransactionDetails",
            data : {
            "groupId" : $("#group_id").val(),
            "userId" : $("#user_id").val()
            },
            dataType: "json",
            success: function(data){
            //response from controller
           // alert("success");
            // alert('data'+data.length);
            	var trHTML = '';
             
            	$.each(data, function (i, item) {
                    trHTML += '<tr><td>' + item.group_id + '</td><td>' + item.user_id + '</td><td>' + item.creditDebit + '</td><td>' + item.amount + '</td></tr>';
                });
                $('#transactionTable').append(trHTML);

           
            
            
            },
            error:function(){
                alert("error");
            }
        });
});
    
    
});

$( function() {
    $( "#transaction_date" ).datepicker();
  } );

    </script>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container">
<h1>
	Credit/Debit
</h1>

<c:url var="addAction" value="/user/transaction" ></c:url>

<form:form action="${addAction}" commandName="creditDebit">
<table>

	<tr>
	<td>
			<form:label path="group_id">
				<spring:message text="Group Name"/>
			</form:label>
		</td>
	<td><form:select path="group_id" id="group_id">
                <form:option value="0" label="--- Select ---" />
                <c:forEach var="theUser" items="${listGroups}">
                    <form:option value="${theUser.id}"><c:out value="${theUser.groupName}"/></form:option>
                </c:forEach>
                </form:select>
            </td>
	</tr>
	<tr>
	<td>
			<form:label path="user_id">
				<spring:message text="User Name"/>
			</form:label>
		</td>
	<td><form:select path="user_id" id="user_id">
                <form:option value="0" label="--- Select ---" />
                <%-- <c:forEach var="theUser" items="${listGroups}">
                    <form:option value="${theUser.id}"><c:out value="${theUser.groupName}"/></form:option>
                </c:forEach> --%>
                </form:select>
            </td>
	</tr>
	
	<tr>
	<td>
			<form:label path="creditDebit">
				<spring:message text="Credit/Debit"/>
			</form:label>
		</td>
	<td><form:select path="creditDebit" id="creditDebit">
                <form:option value="0" label="--- Select ---" />
                <form:option value="C" label="Credit" />
                <form:option value="D" label="Debit" />
                </form:select>
            </td>
	</tr>
	
	<tr>
	<td>
			<form:label path="amount">
				<spring:message text="amount"/>
			</form:label>
		</td>
	<td>
		<form:input path="amount" />
    </td>
	</tr>
	
	
	<tr>
	<td>
			<form:label path="transaction_date">
				<spring:message text="Transaction Date"/>
			</form:label>
		</td>
	<td>
		<form:input path="transaction_date" id="transaction_date"/>
    </td>
	</tr>
	
	<tr>
		
		<td>
				
			
					<input type="submit"
					value="<spring:message text="Save"/>" />
			
		</td>
		
		<td>
				
			
					<input type="button" name="loadButton" id="loadButton" value="<spring:message text="Load"/>" />
			
		</td>
		
	</tr>
	
</table>	

<table id="transactionTable">
	
	<tr>
                            <th>Group Id</th>
                            <th>User Id</th>
                            <th>Credit/Debit</th>
                            <th>Amount</th>
	</tr>

</table>

</form:form>
<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
</div>
</body>
</html>
