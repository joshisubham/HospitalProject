<!DOCTYPE html>
<html>
<head>
	<title>Hospital Management System</title>
	<link rel="shortcut icon" type="image/png" href="../../images/icon.png">  
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" type="text/css" href="../../css/style.css">
	<link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="../../css/fontawesome.min.css" />
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
	
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	
	<style type="text/css">
	th,td{
		padding:5px;
	}
	a{
		text-decoration:none;
		color:inherit;
	}
	a:hover{
		text-decoration:none;
		color:inherit;
		text-decoration-line: underline;
	}
	*, html{
		font-size: small;
	}
	</style>
<!--------------------------------------------------------------->


	<script src="../../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../../js/main.js"></script>
	<script src="https://kit.fontawesome.com/fddca41e00.js" crossorigin="anonymous"></script>
</head>
<body>

	<!---------------heading content----------------------->
	<header id="head">
		<div class="d-flex flex-column p-2">
			<div class="pt-4 pb-2">
				<a href="../../index.jsp"><h3 class="text-left text-uppercase pb-2">Hospital</h3></a>
				<div class="d-flex flex-row justify-content-between">
					<div><p>Phone: 8007002340<br>Email:hospital32@gmail.com</p></div>
					<div><p>Address: Hospital<br>Canal road, Premnagar,<br> Dehradun-248005</p></div>
				</div>
				
			</div>
			<div>
				<a href="../../index.jsp"><h5 class="text-center" style="border-top: 2px ridge;">Hospital Management System </h5></a>
			</div>
		</div>
		<div class="bg-dark text-white" id="toggleicon"><span class=" p-2 fa fa-bars"><span class="px-2">Menu</span></span></div>
	</header>
	<!---------------main content over---------------------->
	<section id="collectivebar">
		<!------------sidebar start------------------->
		<section id="sidebar" class="mt-2"><!----------------for mobiles sidebar--------------------->
			<div class="bg-dark text-white rounded-circle" id="closeicon"><span class="px-2 fa fa-close"></span></div>
			
			<div class="my-4">
				<h2 class="text-center text-uppercase">Menu</h2>
			</div>
			
			<div class="sidebarhref">
				<ul class="list-unstyled "><p class="mx-4">All Records</p>
					<li><a href="allpatient.jsp" target="_parent"><button class="btn btn-block">All Patient</button></a></li>
					<li><a href="alldoctor.jsp" target="_parent"><button class="btn btn-block">All Doctor</button></a></li>
					<li><a href="allappointment.jsp" target="_parent"><button class="btn btn-block">All Appointment</button></a></li>
					<li><a href="allfeedback.jsp" target="_parent"><button class="btn btn-block">All Feedback</button></a></li>					
				</ul>
				<ul class="list-unstyled "><p class="mx-4"> Add</p>
					<li><a href="addpatient.jsp" target="_parent"><button class="btn btn-block">Add Patient</button></a></li>
					<li><a href="adddoctor.jsp" target="_parent"><button class="btn btn-block">Add Doctor</button></a></li>
					<li><a href="addappointment.jsp" target="_parent"><button class="btn btn-block">Add Appointment</button></a></li>					
				</ul>
				<ul class="list-unstyled "><p class="mx-4"> Update/Delete</p>
					<li><a href="editpatient.jsp" target="_parent"><button class="btn btn-block">Update/Delete Patient</button></a></li>
					<li><a href="editdoctor.jsp" target="_parent"><button class="btn btn-block">Update/Delete Doctor</button></a></li>
							
				</ul>
				
			</div>
		</section>
		<section id="sidebarfixed"><!----------------for laptop sidebarfixed--------------------->
			
			<div class="my-4">
				<h2 class="text-center text-uppercase">Menu</h2>
			</div>
			
			<div class="sidebarfixedhref">
				<ul class="list-unstyled ">All Records
					<li><a href="allpatient.jsp" target="_parent"><button class="btn btn-block">All Patient</button></a></li>
					<li><a href="alldoctor.jsp" target="_parent"><button class="btn btn-block">All Doctor</button></a></li>
					<li><a href="allappointment.jsp" target="_parent"><button class="btn btn-block">All Appointment</button></a></li>
					<li><a href="allfeedback.jsp" target="_parent"><button class="btn btn-block">All Feedback</button></a></li>					
				</ul>
				<ul class="list-unstyled "> Add
					<li><a href="addpatient.jsp" target="_parent"><button class="btn btn-block">Add Patient</button></a></li>
					<li><a href="adddoctor.jsp" target="_parent"><button class="btn btn-block">Add Doctor</button></a></li>
					<li><a href="addappointment.jsp" target="_parent"><button class="btn btn-block">Add Appointment</button></a></li>					
				</ul>
				<ul class="list-unstyled "> Update/Delete
					<li><a href="editpatient.jsp" target="_parent"><button class="btn btn-block">Update/Delete Patient</button></a></li>
					<li><a href="editdoctor.jsp" target="_parent"><button class="btn btn-block">Update/Delete Doctor</button></a></li>
				</ul>
				
			</div>
		</section>
		<!-----------sidebar end---------------------->

		<!----------main content start---------------->
		