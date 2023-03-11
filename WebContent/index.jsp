<%@page errorPage="error.jsp"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.Feedback"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.FeedbackDao"%>

<!DOCTYPE html>
<html>
<head>
	<title>Hospital Management System</title>
	<link rel="shortcut icon" type="image/png" href="images/icon.png">  
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://ABCcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/istyle.css">
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/fontawesome.min.css"/>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/main.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Patrick+Hand&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<body>

<header>
	<nav class="bg-dark navbar py-4">
		<div>
		<h3><a href="index.jsp" class="navbar-brand text-uppercase text-white">Hospital Management System</a></h3>
		<h5 style="color:red;" id="mobicon">OOO</h5>
		<br>
		
	</div>
	<div id="laptop">
		<ul class="ml-auto nav d-flex">
			<li class="nav-item active"><a class="nav-link text-white active" href="#section1">Home</a></li>
			<li class="nav-item"><a class="nav-link text-white" href="#section2">About us</a></li>
			<li class="nav-item"><a class="nav-link text-white" href="#section3">Services</a></li>
			<li class="nav-item"><a class="nav-link text-white" href="#section4">Facilities</a></li>
			<li class="nav-item"><a class="nav-link text-white" href="#section5">Feedbacks</a></li>
			<li class="nav-item"><a class="nav-link text-white" href="#footer">Contact Us</a></li>
		</ul>
	</div>	
	</nav>
	
	<span id="demo"></span>
	<div id="mobile" style="background-color:rgba(184,177,250,0.9); ">
		<div class="bg-primary m-1"><br><h3 class="text-center">MENU</h3><br></div>
		<ul class="list-unstyled mx-2 my-2 ">
			<li class="nav-item active p-1 mt-3"><a class="nav-link active" href="#section1">Home</a></li>
			<li class="nav-item p-1 mt-3 "><a class="nav-link" href="#section2">About us</a></li>
			<li class="nav-item p-1 mt-3 "><a class="nav-link" href="#section3">Services</a></li>
			<li class="nav-item p-1 mt-3 "><a class="nav-link" href="#section4">Facilities</a></li>
			<li class="nav-item p-1 mt-3 "><a class="nav-link" href="#section4">Feedbacks</a></li>
			<li class="nav-item p-1 mt-3 "><a class="nav-link" href="#footer">Contact Us</a></li>
		</ul>
	</div>
	
</header>
<section id="section1" class="mt-3">
	<div>
		<div class="p-3">
			<div id="demo" class="carousel slide" data-ride="carousel">
		
			  <!-- Indicators -->
			  <ul class="carousel-indicators">
			    <li data-target="#demo" data-slide-to="0" class="active"></li>
			    <li data-target="#demo" data-slide-to="1"></li>
			    <li data-target="#demo" data-slide-to="2"></li>
			  </ul>
		
			  <!-- The slideshow -->
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="images/f5.jpg"  class="carouselimage">
			    </div>
			    <div class="carousel-item">
			      <img src="images/heart-6.jpg"  class="carouselimage">
			    </div>
			    <div class="carousel-item">
			      <img src="images/d3.jpg" class="carouselimage">
			    </div>
			    <div class="carousel-item">
			      <img src="images/f1.jpg" class="carouselimage">
			    </div>
			  </div>
		
			  <!-- Left and right controls -->
			  <a class="carousel-control-prev" href="#demo" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
		
			</div>
		</div>
	</div>
</section>
<section id="section2">
	
	<div>
		<div class="row mx-auto py-4">
			<div class="col-lg-7  col-md-12 pt-5">
				<p class="text-center pl-4">The 200+ bed ABC Hospital, Dehradun has always been at the forefront of providing quality healthcare.
					 It has already done so for over 3 lakh patients.
					An ultra-modern facility, ABC Hospital, Dehradun is equipped with 63 ICU beds, 67 critical care beds,
					 and 24 HDU beds. Furthermore, it offers integrated medical services in 25 specialist fields such as
					  Neurosciences, Cardiac Sciences, Orthopaedics, Urology, Nephrology, Mental Health, and Behavioural
					   Sciences, among several others.<br>
					One such example is The Neurosciences Centre Of Excellence, which is equipped with Neuro Navigation,
					 Stereotaxy, Microscopic Surgery, an advanced brain tumour centre, Endoscopic surgery, and special 
					 clinics for Epileptic, Neuromuscular and movement disorders.Apart from a team of 130 expert 
					 doctors, 278 nurses and a highly trained medical staff, ABC Hospital, Dehradun also uses 
					 state-of-the-art infrastructure to meet patient challenges even better. ABC Hospital, Dehradun is today known to
					  provide well-rounded and holistic care to every patient who walks in. 
				 </p>
			</div>
			<div class="col-lg-5  col-md-12">
				<div class="w-75 d-flex flex-column mx-auto bg-light p-3" style="margin-top: 12%; border-radius:20px;" id="logindiv">
					<div><h4 class="text-center pb-2"><u>Book Appointment</u></h4></div>
	
					<div class="d-flex justify-content-center">
						<table>
							<form method="post" action="${pageContext.request.contextPath}/PatientLoginServlet">
								<tr>
									<td>Email: </td>
									<td><input type="text" name="patientemail" class="form-control" placeholder="Enter Username" pattern="[^\s@]+@[^\s@]+\.[^\s@]+" required autofocus>
										<span id="adminusererror"></span></td>
								</tr>
								<tr>
									<td>Password: </td>
									<td><input type="password" name="patientpass"  class="form-control" placeholder="Enter Password" pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}" required autofocus>
										<span id="adminpasserror"></span></td>
								</tr>
								<tr>
									<td colspan="2" class="text-center"><input type="submit" name="login"  class="form-control btn-primary"></td>
								</tr>
							</form>
						</table>
					</div>
					<div><h6 class="text-center"><a href="authentication/patientregister.jsp">New User ?  Register</a></h6></div>
				</div>
			</div>
		</div>
	</div>
	
</section>
<section id="section3">
	<div>
	
		<div class="d-flex justify-content-center pt-2" id="servflex">
			
				<div id="servflex">
					
					
					<div class="my-5 p-1 ">
						<div class="d-flex flex-column mx-auto bg-light p-3" style="border-radius:20px;" id="logindiv">
							<div><h4 class="text-center text-uppercase pb-3"><u>Feedback</u></h4></div>
			
							<div class="d-flex justify-content-center">
								<table>
									<form method="post" action="${pageContext.request.contextPath}/InsertFeedback">
										<tr>
											<td>Name: </td>
											<td><input type="text" name="name" class="form-control" autocomplete="off" placeholder="Enter Username" pattern="[a-zA-Z ]*" required ></td>
										</tr>
										<tr>
											<td>Comment: </td>
											<td><textarea name="comment" class="form-control" placeholder="Enter Comment" rows="3" cols="40"   pattern="[a-zA-Z0-9 ]+" required ></textarea></td>
										</tr>
										<tr>
											<td colspan="2" class="text-center"><input type="submit" name="Give Feedback" value="Give Feedback"  class="form-control btn-primary"></td>
										</tr>
									</form>
								</table>
							</div>
							
							
						</div>
						
					</div>
					<div class="my-5 p-1 ">
						<div><h4 class="text-center text-uppercase pb-3"><u>Services</u></h4></div>
						<p class="text-center p-4">Our immediate agenda is to set up more such dedicated centers for providing wholesome treatment 
							 to the patients from all over the country and abroad. We are committed in continually serving the humanity at every
							  needful hour with our state of the art facilities and world's best professionals. We are motivated by the immense 
							  faith that our patients have kept in us, we will stand by our principles and policies and will pursue the same with full 
							  dedication in future as well.</p>
					</div>
				</div>
		</div>
	</div>
</section>
<section id="section4">
	<div>
	<h4 class="text-center pt-2">Facilities</h4>
	<div class="d-flex justify-content-center" id="servflex">
		
		<div class="d-flex justify-content-center flex-wrap" id="servflex">
		
			<div class="mx-1 my-5 p-3 d-flex justify-content-center flex-column" id="serv">
				<div class=" d-flex justify-content-center"><img src="images/f7.jpg" id="faci"></div><h6 class="text-center">OPD available</h6>
			</div>
			<div class="mx-1 my-5 p-3 d-flex justify-content-center flex-column" id="serv">
				<div class=" d-flex justify-content-center"><img src="images/f9.jpg" id="faci"></div><h6 class="text-center">OPD available</h6>
			</div>
			<div class="mx-1 my-5 p-3 d-flex justify-content-center flex-column" id="serv">
				<div class=" d-flex justify-content-center"><img src="images/steth.jpg" id="faci"></div><h6 class="text-center">OPD available</h6>
			</div>
			<div class="mx-1 my-5 p-3 d-flex justify-content-center flex-column" id="serv">
				<div class=" d-flex justify-content-center"><img src="images/bed.jpg" id="faci"></div><h6 class="text-center">OPD available</h6>
			</div>
			<div class="mx-1 my-5 p-3 d-flex justify-content-center flex-column" id="serv">
				<div class=" d-flex justify-content-center"><img src="images/a2.jpg" id="faci"></div><h6 class="text-center">Book Appointment</h6>
			</div>
		</div>
	</div>
	</div>
</section>
<section id="section5">
	<div>
	<h4 class="text-center pt-2">All feedbacks</h4>
	<div class="d-flex flex-column align-items-center" id="servflex">
		
		<%
			FeedbackDao dao=new FeedbackDao();
			List<Feedback> list=dao.getFeedbacks();
			Iterator<Feedback> itr=list.iterator();
			while(itr.hasNext()){
				Feedback f=(Feedback)itr.next();
				%>
				<div class="px-3 mb-2 mx-3 rounded" style="border:1px solid #cfc9c9; width: 80%;">
					<h6><span class="fa fa-user pt-1 pr-2" style="font-size: 30px;"></span><u><%=f.getName()%></u> :</h6>
					<p>Comment    :<%=f.getComment()%></p>
				</div>
				<%
			}
		%>
		
	</div>
	</div>
</section>
<footer class="bg-dark" id="footer">
	<div>
		<ul class="list-inline d-flex justify-content-center py-5">
		<li style="border-right:2px solid black;"><a href="authentication/adminlogin.jsp" class="p-2 text-white">Admin</a></li>
		<li style="border-right:2px solid black;"><a href="authentication/doctorlogin.jsp"class="p-2 text-white">Doctor</a></li>
		<li><a href="authentication/patientlogin.jsp"class="p-2 text-white">Patient</a></li>
		</ul>
		<div>
</footer>

</body>
</html>