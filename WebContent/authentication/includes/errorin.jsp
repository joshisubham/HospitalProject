<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../../css/fontawesome.min.css" />
<link rel="shortcut icon" type="image/png" href="../../images/icon.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!---------------------fonts--------------------------------------->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Patrick+Hand&display=swap" rel="stylesheet">
<title>Something went wrong</title>
</head>
<body style="background-color:rgba(25,145, 255,0.9); background-image: linear-gradient(180deg, white,transparent);">
	
	<div class="w-50 d-flex flex-column mx-auto bg-light p-3" style="margin-top: 12%; border-radius:20px;" id="logindiv">
		<div><h2 class="text-center"><u>Something Went Wrong</u></h2></div>
		
		<div class="d-flex justify-content-center">
			<img alt="icon" src="../../images/icon.png" style="height:25vh;">
			
		</div>
	<hr>
		<div class="text-center">
			<h5><%=exception %></h5>
		</div>
		<div class="text-center"><a href="../../index.jsp"><h5>Back to Index</h5></a></div>
	</div>
		
		
	
	 

</body>
</html>