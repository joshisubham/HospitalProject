<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%@page import="com.bean.DeptDoctors"%>
<%@page import="com.dao.EditDao"%>
<%@page import="com.dao.SearchDao"%>
<%@page import="com.bean.AllPatientWithApp"%>
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
	EditDao dao=new EditDao();
	int status=dao.deleteAppoint(id);
	out.println("deleted status: "+status);
	response.sendRedirect("/HospitalRecode/authentication/patient/patientdashboard.jsp?pid="+id);
%>
</body>
</html>