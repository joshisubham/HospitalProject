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
<%@page errorPage="../includes/errorin.jsp"%>
<%
	if((session==null) | session.getAttribute("a")==null){
		response.sendRedirect("/HospitalRecode/authentication/adminlogin.jsp");
		out.println("you are not logged in");
	}else{
		out.println("you are logged in");
		
	}

%>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	EditDao dao=new EditDao();
	int status=dao.deleteDoctor(id);
	out.println("deleted status: "+status);
	response.sendRedirect("/HospitalRecode/authentication/admin/editdoctor.jsp");
%>
</body>
</html>