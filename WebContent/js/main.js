
		$(document).ready(function(){
			$("#closeicon").click(function(){
				$("#sidebar").hide(1000);
			});
		});

		$(document).ready(function(){
			$("#toggleicon").click(function(e){
				e.preventDefault();
				$("#sidebar").animate({
					width:'toggle'
				});
				
				
			});
		});
		
		$(document).ready(function(){
			$("#logoutdemo").click(function(e){
				e.preventDefault();
				$("#logoutdiv").toggle();
				
				
			});
		});
		
		$(document).ready(function(){
			$("#mobicon").click(function(e){
				e.preventDefault();
				$("#mobile").animate({
					width:'toggle'
				});
				
				
			});
		});
	//---------sidebar above------------------------>
	    
	   
    	    