<html>
<body>
<%@page errorPage="../includes/errorin.jsp"%>
<%
	String url="/HospitalRecode/authentication/patientlogin.jsp";
	if((session==null) | session.getAttribute("p")==null){
		out.println("you are not logged in");
	    
	}else{
		System.out.println("session exists");
		System.out.println("Attribute id:"+session.getAttribute("pid")+", patient:"+ session.getAttribute("p"));
		session.removeAttribute("pid");
		session.removeAttribute("p");
		session.invalidate();
		out.println("done");
	}
	response.sendRedirect(url);
	
%>
</body>
</html>
