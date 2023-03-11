<jsp:include page="../includes/includeheader.jsp"></jsp:include>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.DeptDoctors"%>
<%@page import="com.bean.AllDeptDoctors"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.AdminDao"%>
<%@page import="com.dao.SearchDao"%>
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



<!-- ------------------------------------- -->

					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
<%
	System.out.println(request.getParameter("id"));
	int id=Integer.parseInt(request.getParameter("id"));
	SelectDao dao=new SelectDao();
	AllDeptDoctors d=(AllDeptDoctors)dao.selectdoctor(id);
	List<DeptDoctors> list2=new ArrayList<DeptDoctors>();
	list2=d.getDeptDoctors();
	Iterator<DeptDoctors> itr=list2.iterator();
	while(itr.hasNext()){
		  DeptDoctors dd=(DeptDoctors)itr.next();
		
%>
<!--  -->
 <div>
 			<br><div>
						<h4 class="text-center">Update Doctor</h4>
					</div>
					<div class="d-flex justify-content-center">
            <br><hr> 
            <form method="get" action="${pageContext.request.contextPath}/UpdateDoctors">
                <table>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="name" value="<%=dd.getName()%>" placeholder="<%=dd.getName()%>" pattern="[a-zA-Z ]*"></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td><input type="text" name="phone" value="<%=dd.getPhone()%>" placeholder="<%=dd.getPhone()%>" pattern="[0-9]{10}"></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="<%=dd.getEmail()%>" placeholder="<%=dd.getEmail()%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="<%=dd.getPassword()%>" placeholder="<%=dd.getPassword()%>" pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}"></td>
                    </tr><%} %>
                    <tr>
                        <td>Department</td>
                        <td>
                            <select name="deptid">
                                <%
                                Map<Integer,AllDeptDoctors> map=new AdminDao().getAllDept();
                                Set<Map.Entry<Integer,AllDeptDoctors>> s=map.entrySet();
                                for(Map.Entry<Integer, AllDeptDoctors> entry: s){
                                	AllDeptDoctors dept=(AllDeptDoctors)entry.getValue();
                                %>
                                <option value="<%=entry.getKey()%>" placeholder="<%=d.getDeptid()%>"><%=dept.getDeptname()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                         <td colspan="2"><input type="hidden" name="did" value="<%=id%>"></td>
                    </tr>
                    <tr>
                         <td colspan="2" class="text-center"><input type="submit" name="Update Doctor" value="Update Doctor" class="form-control"></td>
                    </tr>
                </table>
            </form>
            </div>
            
        </div>


					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
<jsp:include page="../includes/includefooter.jsp"></jsp:include>