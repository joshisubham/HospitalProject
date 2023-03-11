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

<div>
				<br><div>
						<h4 class="text-center">Add Appointment</h4>
					</div>
					<div class="d-flex justify-content-center">
            <form method="post" action="${pageContext.request.contextPath}/AddAppointments">
            
                <table>
                    <tr>
                        <td>Appointment Date</td>
                        <td><input type="date" name="appdate" class="form-control" required></td>
                    </tr>
                    <tr>
                        <td>Patient Name</td>
                        <td>
                            <select name="pid"  class="form-control" required>
                                 <%
                                     AdminDao dao=new AdminDao();
                                Map<Integer, String> patientmap=dao.getAllPatient();
                                Set<Map.Entry<Integer, String>> patienset=patientmap.entrySet();
                                for(Map.Entry<Integer, String> entry: patienset){
                                %>
                                <option value="<%=entry.getKey()%>" name="deptid" ><%=entry.getValue()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Department</td>
                        <td>
                            <select name="deptid"  class="form-control" required>
                                <%
                                Map<Integer,AllDeptDoctors> map=new AdminDao().getAllDept();
                                Set<Map.Entry<Integer,AllDeptDoctors>> s=map.entrySet();
                                for(Map.Entry<Integer, AllDeptDoctors> entry: s){
                                	AllDeptDoctors dept=(AllDeptDoctors)entry.getValue();
                                %>
                                <option value="<%=entry.getKey()%>" name="deptid"><%=dept.getDeptname()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                         <td colspan="2" class="text-center"><input type="submit" name="Add Appointment" value="Add Appointment" class="form-control"></td>
                    </tr>
                </table>
            </form>
            </div><p></p>
        </div>
	

					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../includes/includefooter.jsp"></jsp:include>			