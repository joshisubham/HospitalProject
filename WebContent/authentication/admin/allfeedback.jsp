<jsp:include page="../includes/includeheader.jsp"></jsp:include>
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.Feedback"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.FeedbackDao"%>
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



<!-- ----------------------------------------------------------------------- -->

					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
					<div>
						<h4 class="text-center">Feedback Records</h4>
					</div>
					<div class=" pt-3 d-flex justify-content-center">
						<table class="table-bordered" style="align-self: center;">
									<tr>
										<th>Sno</th>
										<th>Name</th>
										<th class=" text-center">Comment</th>
									</tr>
									 <%
									 	FeedbackDao Sdao=new FeedbackDao();
										List<Feedback> list=Sdao.getFeedbacks();
										Iterator<Feedback> itr=list.iterator();
										int count=0;
										while(itr.hasNext()){
											Feedback all=(Feedback)itr.next();
											count++;
									%>
									<tr>
										<td><%=count%></td>
										<td><%=all.getName() %></td>
										<td><%=all.getComment() %></td>
									</tr>
									<%} %>
								</table>
					
							</div>

					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
<jsp:include page="../includes/includefooter.jsp"></jsp:include>				