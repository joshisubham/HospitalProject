<jsp:include page="../includes/headerpd.jsp"></jsp:include>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.AllDeptDoctors"%>
<%@page import="com.bean.AllAppointments"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AdminDao"%>
<%@page import="com.dao.SelectDao"%>
<%@page import="com.bean.AllPatientWithApp"%>
<%@page errorPage="../includes/errorin.jsp"%>
<%
	if((session==null) | session.getAttribute("p")==null){
		response.sendRedirect("/HospitalRecode/authentication/patientlogin.jsp");
		out.println("you are not logged in");
	}else{
		
	}
AllPatientWithApp p=(AllPatientWithApp)session.getAttribute("p");
%>
					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
					
<!-- ----- -->
<%
int id=Integer.parseInt(request.getParameter("pid"));
SelectDao dao=new SelectDao();
AllAppointments appoint=dao.getAppointmentsByPid(id);
 
%>
<section id="mainbar">
			<div class="pt-2">
				<div>
					<a href="../patient/patientdashboard.jsp?pid=<%=id%>"><h4 class="text-center text-uppercase"><u>Patient Dashboard</u></h4></a><br>
				</div>
			
				<div>
					<div class="float-right m-1">
						<div id="usernameicon" class="px-1">
							<div class="d-flex px-3">
								<h5 class="p-2"><%=p.getName() %>
								<span class="fa fa-angle-down pl-2 mx-auto" id="logoutdemo" ></span></h5>
							</div>
							<div id="logoutdiv">
								<div class="d-flex justify-content-center">
									<h5><a href="patientlogout.jsp">Patient Logout</a></h5>
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




<!-- ----------------------------------------------- -->

<div>
				<br><div>
						<h4 class="text-center">Edit Appointment</h4>
					</div>
					<div class="d-flex justify-content-center">
            <form method="get" action="${pageContext.request.contextPath}/PatientUpAppointments">
            	
                <table  id="tab">
                    <tr>
                        <td>Appointment Date</td>
                        <td><input type="date" name="appdate" value="<%=appoint.getDate()%>" class="form-control" required></td>
                    </tr>
                    <tr>
                        <td><input type="hidden" name="appid" value="<%=appoint.getId()%>"></td>
                        <td><input type="hidden" name="pid" value="<%=id%>"></td>
                        
                    </tr>
                    <tr>
                        <td>Department</td>
                        <td>
                            <select name="deptid" class="form-control">
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
                         <td colspan="2" class="text-center"><input type="submit" name="update appointment" value="Update Appointment" class="form-control"></td>
                    </tr>
                </table>
            </form>
            </div>
            
        </div>


					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../includes/footerpd.jsp"></jsp:include>			