<jsp:include page="../includes/includeheader.jsp"></jsp:include>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.AllDeptDoctors"%>
<%@page import="com.bean.DeptDoctors"%>
<%@page import="java.util.Iterator"%>
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

					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

					<div>
						<h3 class="text-center"><a href="admindashboard.jsp">Departments Records</a></h3><br>
					</div>
					 <div class="d-flex justify-content-center">
            <form action="admindashboard.jsp" method="get">
                Search department
                <select name="deptname" >
                    <%
                    Map<Integer,AllDeptDoctors> map=new AdminDao().getAllDept();
                    Set<Map.Entry<Integer,AllDeptDoctors>> s=map.entrySet();
                    for(Map.Entry<Integer, AllDeptDoctors> entry: s){
                    	AllDeptDoctors dept=(AllDeptDoctors)entry.getValue();
                    %>
                    <option value="<%=dept.getDeptname()%>" name="deptname"><%=dept.getDeptname()%></option>
                    <%
                        }
                    %>
                </select>
                <input type="submit" name="search" value="search" class="btn btn-primary">
            </form>
             <a href="admindashboard.jsp" class="ml-5">All Departments' Records</a>
             </div>
            <!-- --------- -->
            <div class=" d-flex flex-wrap justify-content-around">
            	<%
            	SearchDao dao=new SearchDao();
            	List<AllDeptDoctors> list=dao.getDeptDoctors();
                String name=request.getParameter("deptname");
            	if(name!=null){
                    list=dao.getDeptDoctors(name);
            	}else{
            		list=dao.getDeptDoctors();
            	}
            	Iterator<AllDeptDoctors> itr=list.iterator();
            	int count=0;
                while(itr.hasNext()){
                    AllDeptDoctors all=(AllDeptDoctors)itr.next();
                    count++;
                    %>
                  	<!-- -------- -->
						<div class="card mr-3 mt-2" id="carddemo">
							<div class="card-header text-left"><%="Department-"+(count)%><%=": "+all.getDeptname()%></div>
							<div class="card-body">
								<h5 class="card-title text-center">NO.OF DOCTORS :<%=" "+all.getCount()%></h5>
								<%
				                    List<DeptDoctors> alldoctors=all.getDeptDoctors();
				                    Iterator<DeptDoctors> itr2=alldoctors.iterator();
				                    %>
				                    <ul class="ml-3">
				                    <%
				                    while(itr2.hasNext()){
				                        DeptDoctors deptdoctors=(DeptDoctors)itr2.next();
				                        %>
								<li><h5 class="card-subtitle"><u>Doctor name: </u><%=deptdoctors.getName()%></h5></li>
								<p class="card-text"><%="Phone:"+deptdoctors.getPhone()%></br><%="Email"+deptdoctors.getEmail()%></p>
								<%
									} 
				                    %>
				                    
				                    </ul>
								
							</div>
							
							<div class="card-footer text-right">
								<div>
									<form action="${pageContext.request.contextPath}/UpdateDepts" method="post">
										<p>Edit DeptName:</p><input type="text" name="deptname" value="<%=all.getDeptname()%>" placeholder="<%=all.getDeptname()%>" class="form-control">
										<input type="hidden" name="deptid" value="<%=all.getDeptid()%>">
										<input type="submit" name="submit" value="change">
									</form>
								</div>
									
								
								
								</h5>
							</div>
						</div>
						<%
							}
						%>
						
					</div>
					<!-- -------->
						<div class="d-flex justify-content-center pt-4">
            				<form action="${pageContext.request.contextPath}/AddDeptServlet" method="post">
                			New department: <input type="text" name="deptname" id="entereddept" autocomplete="off" placeholder="Enter Username"  required autofocus pattern="[a-z]{3,}">
                    
                    		<input type="submit" name="login">
				            </form>
				        </div>
					
            <!-- ------ -->
            
            
        
        
        
        
					
					

					<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
<jsp:include page="../includes/includefooter.jsp"></jsp:include>