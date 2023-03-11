<html>
<body>
<%@page errorPage="../includes/errorin.jsp"%>
<%
	String url="/HospitalRecode/authentication/adminlogin.jsp";
	if((session==null) | session.getAttribute("a")==null){
		out.println("you are not logged in");
	    
	}else{
		System.out.println("session exists");
		session.removeAttribute("a");
		session.invalidate();
	}
	response.sendRedirect(url);
	
%>
</body>
</html>
