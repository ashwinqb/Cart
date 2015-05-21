<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
	<title>AdminUsersControl</title>
	<meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
	<!--Import materialize.css-->
	<link type="text/css" rel="stylesheet"
			href="resources/css/materialize.min.css" media="screen,projection" />
	<link type="text/css" rel="stylesheet" href="resources/css/home.css"
			media="screen,projection" />

<link rel="stylesheet"
	href='<c:url value="resources/css/pure-0.4.2.css"/>'>

<link rel="stylesheet"
	href='<c:url value="resources/css/font-awesome-4.0.3/css/font-awesome.css"/>'>

<link rel="stylesheet"
	href='<c:url value="resources/css/jquery-ui-1.10.4.custom.css"/>'>

<style type="text/css">
th {
	text-align: left
}
</style>


	<!--Let browser know website is optimized for mobile-->
	<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
</head>
<body>
	<nav>
		<%@ include file = "partials/header.jsp"%>
	</nav>

	<div id="userDialog" style="display: none;">
			<%@ include file="partials/userForm.jsp"%>
		</div>
	<div>
		<table>
			<thead>
				<tr>
					<th width="10%">SL No</th>
					<th width="20%">Email</th>
					<th width="15%">First Name</th>
					<th width="15%">Last Name</th>
				<c:forEach items="${roles}" var="roles">
					<th width="10%" id="${roles}">${roles}</th>
				</c:forEach>
					<th width="20%"></th>
				</tr>
			</thead>
			<tbody>
		<c:forEach items="${listUsers}" var="user" varStatus="loopCounter">
				<tr>
					<td><c:out value="${loopCounter.count}" /></td>
					<td><c:out value="${user.email}" /></td>
					<td><c:out value="${user.fName}" /></td>
					<td><c:out value="${user.lName}" /></td>
				<c:forEach items="${roles}" var="role">
					<td>
						<c:set var="flag" value="${0}"></c:set>
						<c:forEach items="${user.userRole}" var="userrole">
							<c:choose>
								<c:when test="${role == userrole.role}">
									<c:set var="flag" value="${1}"></c:set>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${flag==1}">
								<i class="small mdi-action-done"></i>
								<button onclick="deleteRole('${user.email}','${role}')">Delete This Role</button>
							</c:when>
							<c:otherwise>
								<button onclick="addRole('${user.email}','${role}')">Add This Role</button>
							</c:otherwise>
						</c:choose>
					</td>
				</c:forEach>
					<td>
						<nobr>
						
							<button onclick="editInfo('${user.email}','${user.fName}','${user.lName}','${pageContext.request.userPrincipal.name}');">Edit</button>
							<button onclick="deleteUser('${user.email}');">Delete</button>
						</nobr>
					</td>
				</tr>
		</c:forEach>
			</tbody>
		</table>
	</div>

	<!--   	  FOOTER	-->

	<footer class="page-footer">
		<%@ include file = "partials/footer.jsp"%>
	</footer>
	
	
	<!-- Import scripts -->

	<!--  It is advised to put the <script> tags at the end of the document body so they don't block rendering of the page -->
	<script type="text/javascript"
		src="resources/js/lib/jquery-1.10.2.js"></script>
	<script type="text/javascript"
		src="resources/js/lib/jquery-ui-1.10.4.custom.js"></script>
	<script type="text/javascript"
		src="resources/js/lib/jquery.ui.datepicker.js"/></script>
<!-- 
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-2.1.1.min.js"></script> -->
	<script type="text/javascript" src="resources/js/materialize.min.js"></script>
	<script type="text/javascript" src="resources/js/home-ads.js"></script>
	<script type="text/javascript" src="resources/js/custom.js"></script>
	<script>
	function addRole(email,role){
		
		alert(role);
		$.ajax({
            type: "GET",
            url: "adminAddRole",
            contentType : 'application/json; charset=utf-8',
            data: { "role" :role,
            		"email" : email
              }, 
            success :function(result) {
            	location.reload();
           }
        });
		}
	function deleteRole(email,role){
		
		var x = confirm('Are you sure you want to delete this role?');
		if (x == true)
		{
		$.ajax({
            type: "GET",
            url: "adminDeleteRole",
            contentType : 'application/json; charset=utf-8',
            data: { "role" :role,
            		"email" : email
              }, 
            success :function(result) {
            	location.reload();
           }
        });
		}
	}
	function deleteUser(email){
		
		var x = confirm('Are you sure you want to delete this User? '+email);
		if (x == true)
		{
		$.ajax({
            type: "GET",
            url: "adminUserDelete",
            contentType : 'application/json; charset=utf-8',
            data: { "email" : email
              }, 
            success :function(result) {
            	location.reload();
           }
        });
		}
	}
		function addUser() {
			$('#userDialog').dialog("option", "title", 'Add User');
			$('#userDialog').dialog('open');
		}

		function editInfo(email,fname,lname,cur_email) {
			alert(email);
			$("#userDialog").html();
			if(cur_email != email)
				{
				document.getElementById("email").disabled = true;
				}
			else
				{
				document.getElementById("email").disabled = false;
				}
			$("#email").val(email);
			
			$("#fname").val(fname);
			$("#lname").val(lname);
			$('#userDialog').dialog("option", "title", 'Edit User');
			$("#userDialog").dialog('open');

			}

		$(document).ready(function() {
			$('#userDialog').dialog({
				autoOpen : false,
				position : 'center',
				modal : true,
				resizable : false,
				top:0,
				width : 440,
				buttons : {
					"Save" : function() {
				        var loginemail = $("#loginName").html();
				        alert(loginemail);
				        var email =  document.getElementById("email").value;
				        var user = 
				        	{
				        		"email" : document.getElementById("email").value,
								"fName"	: document.getElementById("fname").value,
								"lName"	: document.getElementById("lname").value
				        	};
				        alert(JSON.stringify(user));
						$.ajax({
				            type: "GET",
				            url: "adminEditUser",
				            contentType : 'application/json; charset=utf-8',
				            data: {"loginId":loginemail,
				            	"user":  JSON.stringify(user),
 				            },
				            success :function(result) {
				            	location.reload();
				           }
				        });
					},
					"Cancel" : function() {
						$(this).dialog('close');
					}
				},
				close : function() {

					resetDialog($('#userDialog'));

					$(this).dialog('close');
				}
			});
		});

		function resetDialog(form) {
			form.find("input").val("");
		}
	</script>
</body>
</html>