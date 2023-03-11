<jsp:include page="../includes/includeheader.jsp"></jsp:include>
<%@page import="com.bean.AllPatientWithApp"%>
<%@page import="com.dao.EditDao"%>
<%@page import="com.dao.SelectDao"%>
<%@page import="com.bean.Admin"%>
<%@page errorPage="../includes/errorin.jsp"%>
<%
	if((session==null) | session.getAttribute("a")==null){
		response.sendRedirect("/HospitalRecode/authentication/adminlogin.jsp");
		out.println("you are not logged in");
	}else{
		
	}
Admin a=(Admin)session.getAttribute("a");
%>
<section id="mainbar">
			<div class="pt-2">
				<div>
					<a href="../admin/admindashboard.jsp"><h4 class="text-center text-uppercase"><u>Admin Dashboard</u></h4></a><br>
				</div>
			
				<div>
					<div class="float-right m-1">
						<div id="usernameicon" class="px-1">
							<div class="d-flex px-3">
								<h5 class="p-2"><%=a.getAdminuser()%>
								<span class="fa fa-angle-down pl-2 mx-auto" id="logoutdemo" ></span></h5>
							</div>
							<div id="logoutdiv">
								<div class="d-flex justify-content-center">
									<a href="adminlogout.jsp"><h6>Admin Logout</h6></a>
								</div>
							</div>
							
						</div>
					</div>
					<br>
					<div></div>
				</div>
				<div style="clear:both;"></div>
				<hr>
				<div>



					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

<%
	System.out.println(request.getParameter("pid"));
	int id=Integer.parseInt(request.getParameter("pid"));
	SelectDao dao=new SelectDao();
	AllPatientWithApp p=(AllPatientWithApp)dao.selectpatient(id);
		
%>
					<div>
						<h4 class="text-center">Update Patient</h4>
					</div>
					<div class=" pt-3 d-flex justify-content-center">
					<form method="get" action="${pageContext.request.contextPath}/UpdatePatients">
						<table style="align-self: center;">
									<tr>
										<td>Name</td>
										<td><input type="text" name="name" value="<%=p.getName()%>" placeholder="<%=p.getName()%>" class="form-control" pattern="[a-zA-Z ]*"></td>
									</tr>
									<tr>
										<td>Email</td>
										<td><input type="text" name="email" value="<%=p.getEmail()%>" placeholder="<%=p.getEmail()%>" class="form-control" readonly></td>
									</tr>
									<tr>
										<td>Password</td>
										<td><input type="password" name="password" value="<%=p.getPassword()%>" placeholder="<%=p.getPassword()%>" class="form-control" pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}"></td>
									</tr>
									
									<tr>
										<td>Bloodgroup</td>
										<td><select name="bloodgroup" value="<%=p.getBloodgroup()%>" placeholder="<%=p.getBloodgroup()%>" class="form-control">
				                        		<option value="A+" name="bloodgroup">A+</option>
				                        		<option value="B+" name="bloodgroup">B+</option>
				                        		<option value="O+" name="bloodgroup">O+</option>
				                        		<option value="AB+" name="bloodgroup">AB+</option>
				                        		<option value="O-" name="bloodgroup">O-</option>
				                        		<option value="Other" name="bloodgroup">Other</option>
				                        	</select>
										</td>
									</tr>
									<tr>
										<td>Sex</td>
										<td><select name="sex" class="form-control"value="<%=p.getSex()%>" placeholder="<%=p.getSex()%>">
				                        		<option value="male" name="sex">Male</option>
				                        		<option value="female" name="sex">Female</option>
				                        		<option value="other" name="sex">Other</option>
				                        	</select>
										</td>
									</tr>
									<tr>
										<td>Age</td>
										<td><input type="number" min="15" max="120" name="age" value="<%=p.getAges()%>" placeholder="<%=p.getAges()%>" class="form-control"></td>
									</tr>
									<tr>
										<td></td>
										<td><input type="hidden" name="pid" value="<%=id%>" placeholder="<%=id%>"></td>
									</tr>
									<tr>
										
										<td colspan="2" class="text-center"><input type="submit" value="update"></td>
									</tr>
								</table>
							</form>
						</div>

					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
<jsp:include page="../includes/includefooter.jsp"></jsp:include>			