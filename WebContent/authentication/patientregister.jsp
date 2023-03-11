<jsp:include page="includes/loginhead.jsp"></jsp:include>
<%@page errorPage="error.jsp"%>
<%@page import="com.bean.AllPatientWithApp"%>
<%	
	if(session.getAttribute("p")!=null){
		int pid=(Integer)session.getAttribute("pid");
		response.sendRedirect("/HospitalRecode/authentication/patient/patientdashboard.jsp?pid="+pid);
	    
	}else{
		
	}

%>

<div class="w-50 d-flex flex-column mx-auto bg-light p-3" style="margin-top: 12%; border-radius:20px;" id="logindiv">
		<div><h3 class="text-center"><u>Welcome to Patient Registration Portal</u></h3></div>



		<div class="d-flex justify-content-center">
			<div class="d-flex justify-content-center">
            <form method="get" action="${pageContext.request.contextPath}/RegisterPatients" id="registerform">
                <table>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="name" id="name" class="form-control" placeholder="Enter Name" pattern="[a-zA-Z ]*" required></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" id="email" class="form-control" placeholder="Enter Email" pattern="[^\s@]+@[^\s@]+\.[^\s@]+" required></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" id="password" class="form-control" placeholder="Enter Password" pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}" required></td>
                    </tr>
                    <tr>
                        <td>bloodgroup</td>
                        <td><select name="bloodgroup" class="form-control" id="bloodgroup" required>
                        		<option value="A+" name="bloodgroup">A+</option>
                        		<option value="B+" name="bloodgroup">B+</option>
                        		<option value="O+" name="bloodgroup">O+</option>
                        		<option value="AB+" name="bloodgroup">AB+</option>
                        		<option value="O-" name="bloodgroup">O-</option>
                        		<option value="Other" name="bloodgroup">Other</option>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                        <td>sex</td>
                        <td><select name="sex" class="form-control" id="sex" required>
                        		<option value="male" name="sex">Male</option>
                        		<option value="female" name="sex">Female</option>
                        		<option value="other" name="sex">Other</option>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                        <td>ages</td>
                        <td><input type="number" name="ages" id="ages" min="15" max="120" class="form-control" required></td>
                    </tr>
                    <tr>
                         <td colspan="2" class="text-center"><input type="submit" name="Register Patient" value="Register Patient" class="form-control" id="register"></td>
                    </tr>
                </table>
               </form> 
            </div>
		</div>
		<hr>
	<div class="text-center"><a href="../index.jsp">Back to Index</a></div>
	<div class="text-center"><p id="status"></p></div>
	
	</div>
	
	<script>
	//-----------------------ajax code----------------
	$(document).ready(function(){
    	$("#register").click(function(e){
    		e.preventDefault();
    		
    		$.ajax({
	    		url : $("#registerform").attr("action"),
	    		type: $("#registerform").attr("method"),
	    		data : {	name:$("#name").val(),
	    					email:$("#email").val(),
	    					password:$("#password").val(),
	    					bloodgroup:$("#bloodgroup").val(),
	    					sex:$("#sex").val(),
	    					ages:$('#ages').val(),
	    				},
	    		contentType: "application/json; charset=utf-8",     
	    		dataType: "json",  
	    		success: function(data){
	    			alert(data.result);
	    		},
	    		error: function(data){
	    			alert(data.result);
	    		}
    		
    		});
    	});
    	
    });
	
	</script>
	
<jsp:include page="includes/loginfoot.jsp"></jsp:include>