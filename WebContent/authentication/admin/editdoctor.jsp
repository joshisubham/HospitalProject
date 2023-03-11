<jsp:include page="../includes/includeheader.jsp"></jsp:include>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.AllDeptDoctors"%>
<%@page import="com.bean.AllDeptDoctors"%>
<%@page import="com.bean.DeptDoctors"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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



<!-- -------------------------------------------------- -->

					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
					<div>
						<h2 class="text-center"><a href="alldoctor.jsp">Doctor Records</a></h2><br>
					</div>
					
				
		<div class="d-flex justify-content-center">
            <form action="editdoctor.jsp" method="get">
                Enter department
                <select name="deptname">
                
                    <%
                    Map<Integer,AllDeptDoctors> map=new AdminDao().getAllDept();
                    Set<Map.Entry<Integer,AllDeptDoctors>> s=map.entrySet();
                    for(Map.Entry<Integer,AllDeptDoctors> entry: s){
                    	AllDeptDoctors dept=(AllDeptDoctors)entry.getValue();
                    %>
                    <option value="<%=dept.getDeptname()%>" name="deptname"><%=dept.getDeptname()%></option>
                    <%
                        }
                    %>
                </select>
                <input type="submit" name="search" value="search" class="btn btn-primary">
            </form>
             <a href="editdoctor.jsp" class="ml-5">All Records</a>
             <a href="adddoctor.jsp" class="ml-5">+Add Doctor</a>
        </div>
        <div class="d-flex justify-content-center">
        	<table border=1>
        		<tr>
	        		<td>deptid</td>
	        		<td>deptname</td>
	        		<td>No of Doctors</td>
	                <td>doctors details</td>
                </tr>
                <%
                	SearchDao Sdao=new SearchDao();
                	List<AllDeptDoctors> list=null;
		            String search=request.getParameter("search");
		            String deptname=request.getParameter("deptname");
		            if(deptname!=null){
		            	list=Sdao.getDeptDoctors(deptname);
		            	
		            }else{
		           
		            	list=Sdao.getDeptDoctors();
		            }
		                Iterator<AllDeptDoctors> itr=list.iterator();
		                int count=0;
		                while(itr.hasNext()){
		                    AllDeptDoctors all=(AllDeptDoctors)itr.next();
		                    count++;
		                    %>
		                    <tr><td><%=count%></td>
		                    	<td><%=all.getDeptname()%></td>
		                    	<td><%=all.getCount()%></td>
		                    	<td>
		                    <%
		                    List<DeptDoctors> alldoctors=all.getDeptDoctors();
		                    Iterator<DeptDoctors> itr2=alldoctors.iterator();
		                    while(itr2.hasNext()){
		                        DeptDoctors deptdoctors=(DeptDoctors)itr2.next();
		                        %>
		                        <dl>
		                    		<dt><%=deptdoctors.getName()%>
		                    		<dd class="ml-2"><%="Phone: " +deptdoctors.getPhone()%><br><%="Email: " +deptdoctors.getEmail() %></dd>
		                    		<dd class="ml-2">
		                    			<a href="updatedoctor.jsp?id=<%=deptdoctors.getId()%>" class="bg-primary text-white">Edit</a>
		                    			<a href="deletedoctor.jsp?id=<%=deptdoctors.getId()%>" class="ml-3 bg-danger text-white">Delete</a>
		                    		</dd>
		                    	</dt>
		                    	</dl>
		                    
		                    
		                    <%
		                    }
		                    %>
		                    	</td>
		                    </tr>
		                <%
		                }//end of outer while
		           //end of condition
		            %>
                
                </table>
            </div>

					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../includes/includefooter.jsp"></jsp:include>			