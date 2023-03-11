<jsp:include page="../includes/headerpd.jsp"></jsp:include>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bean.AllPatientWithApp"%>
<%@page import="com.bean.AllDeptDoctors"%>
<%@page import="com.bean.DeptDoctors"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.SelectDao"%>
<%@page import="com.dao.SearchDao"%>
<%@page errorPage="../includes/errorin.jsp"%>
<%
	if((session==null) | session.getAttribute("d")==null){
		response.sendRedirect("/HospitalRecode/authentication/doctorlogin.jsp");
		out.println("you are not logged in");
	}else{
		
	}

%>

<%
  int id=Integer.parseInt(request.getParameter("id"));
  SelectDao dao=new SelectDao();
  AllDeptDoctors d=dao.selectdoctor(id);
  List<DeptDoctors> list2=new ArrayList<DeptDoctors>();
  list2=d.getDeptDoctors();
  Iterator<DeptDoctors> itr=list2.iterator();
  while(itr.hasNext()){
	  DeptDoctors dd=(DeptDoctors)itr.next();
  
%>

<section id="mainbar">
			<div class="pt-2">
				<div>
					<a href="../doctor/doctordashboard.jsp?id=<%=id%>"><h4 class="text-center text-uppercase"><u>Doctor Dashboard</u></h4></a><br>
				</div>
			
				<div>
					<div class="float-right m-1">
						<div id="usernameicon" class="px-1">
							<div class="d-flex px-3">
								<h5 class="p-2"><%=dd.getName() %>
								<span class="fa fa-angle-down pl-2 mx-auto" id="logoutdemo" ></span></h5>
							</div>
							<div id="logoutdiv">
								<div class="d-flex justify-content-center">
									<a href="doctorlogout.jsp"><h6>Doctor Logout</h6></a>
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
            <table  border="1" id="tab">
                    <tr>
                        <td>Name</td>
                        <td><%=dd.getName() %></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td><%=dd.getPhone() %></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><%=dd.getEmail() %></td>
                    </tr>
                    <%} %>
                    <tr>
                        <td>Department</td>
                        <td><%=d.getDeptname() %></td>
                    </tr>
                    <tr>
                         <td colspan="2" class="text-center bg-primary">
                         	<a href="updatedoc.jsp?id=<%=id%>" class="text-white px-2">Edit</a>
                         </td>
                    </tr>
                </table>
            </div>
             
        </div>
        <br>
        <div class="pt-3" >
						<h4 class="text-center">Appointment Details</h4>
					</div>
         <div class="d-flex py-2 justify-content-center">
         
        	<table border=1 id="tab">
        		<tr>
	        		<th>Sno</th>
					<th>Name</th>
					<th>Email</th>
					<th>Bloodgroup</th>
					<th>Sex</th>
					<th>Age</th>
					<th>Appointment</th>
				</tr>
				
        <%
			SearchDao Sdao=new SearchDao();
			List<AllPatientWithApp> list;
			list=Sdao.getAllPatientsDept(d.getDeptname());
			Iterator<AllPatientWithApp> itr2=list.iterator();
			while(itr2.hasNext()){
				AllPatientWithApp all=(AllPatientWithApp)itr2.next();
				%>
				<tr>
					
					<td><%=all.getId()%></td>
					<td><%=all.getName()%></td>
					<td><%=all.getEmail()%></td>
					<td><%=all.getBloodgroup()%></td>
					<td><%=all.getSex()%></td>
					<td><%=all.getAges()%></td>
					<td><% if(all.getDate()!=null){%>
						<%
					    	SimpleDateFormat ft=new SimpleDateFormat("dd/MM/yyyy");
						%>
						<%=ft.format(all.getDate())%>
						</br><%="Department: "+all.getDeptname()%>
					<%
					}else{
						%>Appointment :Null<br>
						<a href="addappointment.jsp">Add appointment</a>
						<%
							} %>
					</td>
				</tr>
				<%
			}
			%>
		
        </table>
        </div>

 
						
<jsp:include page="../includes/footerpd.jsp"></jsp:include>			