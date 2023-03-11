<jsp:include page="../includes/includeheader.jsp"></jsp:include>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.AllDeptDoctors"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AdminDao"%>
				
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



<!-- ---------------------------------------------------------- -->

<!--  -->
 <div>
 			<br><div>
						<h4 class="text-center">Doctor Add</h4>
					</div>
					<div class="d-flex justify-content-center">
            <br><hr> 
            <form method="post" action="${pageContext.request.contextPath}/AddDoctors">
                <table>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="name" class="form-control" placeholder="Enter Name" pattern="[a-zA-Z ]*" required></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td><input type="text" name="phone" class="form-control" placeholder="Enter Phone" pattern="[0-9]{10}" required></td>
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
                        <td>Department</td>
                        <td>
                            <select name="deptid"  class="form-control" required>
                                <%
                                Map<Integer,AllDeptDoctors> map=new AdminDao().getAllDept();
                                Set<Map.Entry<Integer,AllDeptDoctors>> s=map.entrySet();
                                for(Map.Entry<Integer,AllDeptDoctors> entry: s){
                                	AllDeptDoctors dept=(AllDeptDoctors)entry.getValue();
                                %>
                                <option value="<%=entry.getKey()%>"><%=dept.getDeptname()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                         <td colspan="2" class="text-center"><input type="submit" name="Add Doctor" value="Add Doctor" class="form-control"></td>
                    </tr>
                </table>
            </form>
            </div>
             
        </div>


					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
<jsp:include page="../includes/includefooter.jsp"></jsp:include>