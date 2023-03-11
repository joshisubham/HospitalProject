<html>
<body>
<%@page errorPage="../includes/errorin.jsp"%>
<%
	String url="/HospitalRecode/authentication/doctorlogin.jsp";
	if((session==null) | session.getAttribute("d")==null){
		out.println("you are not logged in");
	    
	}else{
		System.out.println("session exists");
		System.out.println("Attribute id:"+session.getAttribute("did")+", doctor:"+ session.getAttribute("d"));
		session.removeAttribute("did");
		session.removeAttribute("d");
		session.invalidate();
		out.println("done");
	}
	response.sendRedirect(url);
	
%>
</body>
</html>
