<jsp:include page="../includes/includeheader.jsp"></jsp:include>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bean.AllPatientWithApp"%>
<%@page import="com.bean.AllDeptDoctors"%>
<%@page import="com.bean.DeptDoctors"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AdminDao"%>
<%@page import="com.dao.SearchDao"%>
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



<!-- ------------------------------------------- -->
				<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
					
					<div>
						<h2 class="text-center"><a href="editpatient.jsp">Edit Patient Records</a></h2>
					</div>
					
		<div class="d-flex justify-content-center">
            <form action="editpatient.jsp" method="get">
                Enter Patient Name:
                    <select name="pid">
                                 <%
                                     AdminDao dao=new AdminDao();
                                Map<Integer, String> patientmap=dao.getAllPatient();
                                Set<Map.Entry<Integer, String>> patienset=patientmap.entrySet();
                                for(Map.Entry<Integer, String> entry: patienset){
                                %>
                                <option value="<%=entry.getValue()%>" name="pid"><%=entry.getValue()%></option>
                                <%
                                    }
                                %>
                            
                </select>
                <input type="submit" name="search" value="search" class="btn btn-primary">
            </form>
            <a href="editpatient.jsp" class="ml-5">All Records</a>
            <a href="addpatient.jsp" class="ml-5">+Add Patient</a>
        </div>
        <div class="d-flex justify-content-center">
        	<table border=1>
        		<tr>
	        		<th>Sno</th>
					<th>Name</th>
					<th>Email</th>
					<th>Bloodgroup</th>
					<th>Sex</th>
					<th>Age</th>
					<th>Edit Profile</th>
					<th>Update</th>
				</tr>
				
        <%
			SearchDao Sdao=new SearchDao();
			List<AllPatientWithApp> list;
			String pid=request.getParameter("pid");
			if(pid!=null){
				 list=Sdao.getAllPatients(pid);
			}else{
				list=Sdao.getAllPatients();
			}
			Iterator<AllPatientWithApp> itr2=list.iterator();
			int count=0;
			while(itr2.hasNext()){
				AllPatientWithApp all=(AllPatientWithApp)itr2.next();
				count++;
				%>
				<tr>
					
					<td><%=count%></td>
					<td><%=all.getName()%></td>
					<td><%=all.getEmail()%></td>
					<td><%=all.getBloodgroup()%></td>
					<td><%=all.getSex()%></td>
					<td><%=all.getAges()%></td>
					<td><a href="updatepatient.jsp?pid=<%=all.getId()%>" class="bg-primary text-white">Edit</a>
						<a href="deletepatient.jsp?pid=<%=all.getId()%>" class="bg-danger text-white">Delete</a>
					</td>
					<td><% if(all.getDate()!=null){%>
						<%
					    	SimpleDateFormat ft=new SimpleDateFormat("dd/MM/yyyy");
						%>
						<%=ft.format(all.getDate())%>
						</br><%="Department: "+all.getDeptname()%><br>
								<a href="updateappointment.jsp?pid=<%=all.getId()%>" class="bg-primary text-white">Edit</a>
								<a href="deleteappointment.jsp?pid=<%=all.getId()%>" class="bg-danger text-white">Delete</a>
					<%
					}else{
						%>Appointment :Null
						<%
							} %>
					</td>
					
				</tr>
				<%
			}
			%>
		
        </table>
        </div>
        
        
					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../includes/includefooter.jsp"></jsp:include>			