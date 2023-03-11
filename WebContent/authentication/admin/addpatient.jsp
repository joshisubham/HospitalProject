<jsp:include page="../includes/includeheader.jsp"></jsp:include>
<%@page import="com.bean.Admin"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AdminDao"%>
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



<!-- ---------------------------------------------------------- -->

					
<div>
            <br><div>
						<h4 class="text-center">Add OPD Patient</h4>
					</div>
					<div class="d-flex justify-content-center">
            <form method="post" action="${pageContext.request.contextPath}/AddPatients">
                <table>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="name" class="form-control" placeholder="Enter Name" pattern="[a-zA-Z ]*" required></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" class="form-control" placeholder="Enter Email" pattern="[^\s@]+@[^\s@]+\.[^\s@]+" required></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" class="form-control" placeholder="Enter Password" pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}" required></td>
                    </tr>
                    <tr>
                        <td>bloodgroup</td>
                        <td><select name="bloodgroup" class="form-control" required>
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
                        <td>sex</td>
                        <td><select name="sex" class="form-control"required>
                        		<option value="male" name="sex">Male</option>
                        		<option value="female" name="sex">Female</option>
                        		<option value="other" name="sex">Other</option>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                        <td>ages</td>
                        <td><input type="number" name="ages" min="15" max="120" class="form-control" required></td>
                    </tr>
                    <tr>
                         <td colspan="2" class="text-center"><input type="submit" name="Add Patient" value="Add Patient" class="form-control"></td>
                    </tr>
                </table>
            </form>
            </div>
        </div>
						
						
					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
<jsp:include page="../includes/includefooter.jsp"></jsp:include>