<jsp:include page="includes/loginhead.jsp"></jsp:include>
<%@page errorPage="../includes/errorin.jsp"%>

	<div class="w-50 d-flex flex-column mx-auto bg-light p-3" style="margin-top: 12%; border-radius:20px;" id="logindiv">
		<div><h3 class="text-center"><u>Welcome to Admin portal</u></h3></div>

<%	
	if(session.getAttribute("a")!=null){
		response.sendRedirect("/HospitalRecode/authentication/admin/admindashboard.jsp");
	    
	}else{
		
	}

%>

		<div class="d-flex justify-content-center">
				<table>
					<form method="post" action="${pageContext.request.contextPath}/AdminLoginServlet">
						<tr>
							<td>Username: </td>
							<td><input type="text" class="form-control" name="adminuser" id="adminuser" autocomplete="off" placeholder="Enter Username"  required autofocus  pattern="[a-zA-Z ]*">
							</td>
						</tr>
						<tr>
							<td>Password: </td>
							<td><input type="password"  class="form-control" name="adminpass" id="adminpass" autocomplete="off" placeholder="Enter Password"  required autofocus  pattern="[a-zA-Z ]*">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center"><input type="submit" name="login" value="Login" class="form-control btn-primary"></td>
						</tr>
					</form>
				</table>
			<hr>
			
		</div>
		<div class="text-center"><a href="../index.jsp">Back to Index</a></div>
	</div>
	
<jsp:include page="includes/loginfoot.jsp"></jsp:include>
