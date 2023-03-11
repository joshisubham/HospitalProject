<jsp:include page="../includes/includeheader.jsp"></jsp:include>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.AllDeptDoctors"%>
<%@page import="com.bean.AllAppointments"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AdminDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dao.SearchDao"%>
<%@page errorPage="../includes/errorin.jsp"%>
<%@page import="com.bean.Admin"%>
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



<!-- ---------------------------------------- -->

					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

					<div>
						<h4 class="text-center">Appointment Records</h4>
					</div>
					<div>
				
					<div class="d-flex justify-content-center">
            <form method="get" action="allappointment.jsp">
            
                <table>
                    <tr id="searchby">
                        <td>Patient Name</td>
                        <td>
                            <select name="pemail">
                                 <%
                                     AdminDao dao=new AdminDao();
                                Map<Integer, String> patientmap=dao.getAllappPatient();
                                Set<Map.Entry<Integer, String>> patienset=patientmap.entrySet();
                                for(Map.Entry<Integer, String> entry: patienset){
                                	System.out.println("id is "+entry.getKey());
                                %>
                                <option value="<%=entry.getValue()%>" name="pemail"><%=entry.getValue()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    
                         <td class="text-center"><input type="submit" name="Search" value="search" class="btn btn-primary"></td>
                    </tr>
                </table>
              </form>
              
            </div>
            <div class="d-flex justify-content-center">
              <form method="get" action="allappointment.jsp">
            
                <table>
                    <tr id="searchby">
                        <td>Department</td>
                        <td>
                            <select name="deptid">
                                <%
                                Map<Integer,AllDeptDoctors> map=new AdminDao().getAllappDept();
                                Set<Map.Entry<Integer,AllDeptDoctors>> s=map.entrySet();
                                for(Map.Entry<Integer, AllDeptDoctors> entry: s){
                                	AllDeptDoctors dept=(AllDeptDoctors)entry.getValue();
                                %>
                                <option value="<%=dept.getDeptname()%>" name="deptid"><%=dept.getDeptname()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    
                         <td class="text-center"><input type="submit" name="search" value="search" class="btn btn-primary"></td>
                    </tr>
                </table>
            </form>
            
            </div>
            <div class="d-flex justify-content-center">
            	<a href="allappointment.jsp" class="ml-5">All Records</a>
              	<a href="addappointment.jsp" class="ml-5">+Add Appointment</a>
            </div>
            
        </div>
					
					<div class=" pt-3 d-flex justify-content-center">
						<table class="table-bordered" style="align-self: center;">
									<tr>
										<th>Sno</th>
										<th>Patient Name</th>
										<th>Appointment Date</th>
										<th>Department</th>
									</tr>
									<%
										SearchDao Sdao=new SearchDao();
										List<AllAppointments> list;
										String deptname=request.getParameter("deptid");
										String pemail=request.getParameter("pemail");
										AllDeptDoctors dept2=new AllDeptDoctors();
										dept2.setDeptname(deptname);
										if(pemail!=null){
											list=Sdao.getAllAppointments(pemail);
											System.out.println("Patient id :"+pemail);
											
										}else if(dept2!=null & deptname!=null){
											list=Sdao.getAllAppointments(dept2);
											System.out.println("Dept :"+dept2);
										}
										else{
											list=Sdao.getAllAppointments();
										}
										int count=0;
										Iterator<AllAppointments> itr=list.iterator();
										while(itr.hasNext()){
											AllAppointments all=(AllAppointments)itr.next();
											count++;
									%>
									<tr>
										<td><%=count %></td>
										<td><%=all.getName() %></td>
										<%
									    	SimpleDateFormat ft=new SimpleDateFormat("dd/MM/yyyy");
										%>
										<td><%=ft.format(all.getDate())%></td>
										<td><%=all.getDeptname() %></td>
									</tr>
									<%
										}
									%>
								</table>
					
							</div>
					
					
					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../includes/includefooter.jsp"></jsp:include>			