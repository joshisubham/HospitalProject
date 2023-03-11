<jsp:include page="includes/loginhead.jsp"></jsp:include>

	<div class="w-50 d-flex flex-column mx-auto bg-light p-3" style="margin-top: 12%; border-radius:20px;" id="logindiv">
		<div><h3 class="text-center"><u>Welcome to Patient portal</u></h3></div>

<%@page import="com.bean.AllPatientWithApp"%>
<%	
	if(session.getAttribute("p")!=null){
		int pid=(Integer)session.getAttribute("pid");
		response.sendRedirect("/HospitalRecode/authentication/patient/patientdashboard.jsp?pid="+pid);
	    
	}else{
		
	}

%>

		<div class="d-flex justify-content-center">
			<table>
				<form method="post" action="${pageContext.request.contextPath}/PatientLoginServlet">
					<tr>
						<td>Email: </td>
						<td><input type="text" name="patientemail" class="form-control"  placeholder="Enter Username"  required autofocus pattern="[^\s@]+@[^\s@]+\.[^\s@]+">
							</td>
					</tr>
					<tr>
						<td>Password: </td>
						<td><input type="password" name="patientpass"  class="form-control" placeholder="Enter Password"  required autofocus pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}">
							</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center"><input type="submit" name="login"  class="form-control btn-primary"></td>
					</tr>
				</form>
			</table>
		</div>
	<hr>
	<div class="text-center"><a href="../index.jsp">Back to Index</a></div>
	</div>
<%
	
	if(!(Boolean.getBoolean(request.getParameter("status")))){
		System.out.println("hello status is false ");
		%>
		<script>
			alert("details are wrong");
		</script>
		<%
	}
%>
<jsp:include page="includes/loginfoot.jsp"></jsp:include>