<jsp:include page="../includes/headerpd.jsp"></jsp:include>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bean.AllPatientWithApp"%>
<%@page import="com.bean.AllAppointments"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.SelectDao"%>
<%@page import="com.dao.SearchDao"%>
<%@page errorPage="../includes/errorin.jsp"%>
<%
	if((session==null) | session.getAttribute("p")==null){
		response.sendRedirect("/HospitalRecode/authentication/patientlogin.jsp");
		out.println("you are not logged in");
	}else{
		
	}

%>
<%
  int id=Integer.parseInt(request.getParameter("pid"));
  SelectDao dao=new SelectDao();
  AllPatientWithApp p=dao.selectpatient(id);
  
  
%>
<section id="mainbar">
			<div class="pt-2">
				<div>
					<h4 class="text-center text-uppercase"><a href="../patient/patientdashboard.jsp?pid=<%=id%>"><u>Patient Dashboard</u></a></h4><br>
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
						<h4 class="text-center">Details</h4>
					</div>
					<div class="d-flex justify-content-center">
            <br><hr> 
            <table border="1" id="tab">
                    <tr>
                        <td>Name</td>
                        <td><%=p.getName() %></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><%=p.getEmail() %></td>
                    </tr>
                    <tr>
                        <td>Blood Group</td>
                        <td><%=p.getBloodgroup() %></td>
                    </tr>
                    <tr>
                        <td>Sex</td>
                        <td><%=p.getSex() %></td>
                    </tr>
                    <tr>
                        <td>Age</td>
                        <td><%=p.getAges() %></td>
                    </tr>
                    
                    <tr>
                         <td colspan="2" class="text-center bg-primary ">
                         	<a href="updatepat.jsp?pid=<%=id%>" class="text-white px-2">Edit</a>
                         </td>
                    </tr>
                </table>
                
            </div>
             
        </div>
        <div class=" pt-5 d-flex flex-column justify-content-center">
        <%
										SearchDao Sdao=new SearchDao();
										List<AllAppointments> list;										
										list=Sdao.getAllAppointmentsByid(id);
										Iterator<AllAppointments> itr=list.iterator();
										if(!(itr.hasNext())){
											%>
											<h6 class="text-center">
											<a href="addapp.jsp?id=<%=id%>" class="bg-success text-white px-3 py-1">Add appointment</a></h6>
											<%
										}else
										{
											AllAppointments all=(AllAppointments)itr.next();
									%>
						<div><h3 class="text-center">Appointments</h3></div>
						<div class="d-flex justify-content-center">
						<table class="table-bordered" style="align-self: center;" id="tab">
									<tr>
										
										<th>Patient Name</th>
										<th>Appointment Date</th>
										<th>Department</th>
										
									</tr>
									
									<tr>
										
										<td><%=all.getName() %></td>
										<%
									    	SimpleDateFormat ft=new SimpleDateFormat("dd/MM/yyyy");
										%>
										<td><%=ft.format(all.getDate())%></td>
										<td><%=all.getDeptname() %></td>
									</tr>
									<tr>
										
										<td colspan="3" class="text-right">
											<a href="updateapp.jsp?pid=<%=id%>" class="bg-primary text-white">Edit</a>
											<a href="deleteapp.jsp?pid=<%=id%>" class="bg-danger text-white">Delete</a>
										</td>
									</tr>
									<%
										}
									%>
								</table>
								</div>
							</div>
					



<jsp:include page="../includes/footerpd.jsp"></jsp:include>			