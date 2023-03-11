package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.AllPatientWithApp;
import com.dao.EditDao;

/**
 * Servlet implementation class UpdatePatients
 */
@WebServlet("/UpdatePatients")
public class UpdatePatients extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePatients() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            AllPatientWithApp patient=new AllPatientWithApp();
            out.println(request.getParameter("pid"));
            Integer id=Integer.parseInt(request.getParameter("pid"));
            patient.setName(request.getParameter("name"));
            patient.setEmail(request.getParameter("email"));
            patient.setPassword(request.getParameter("password"));
            patient.setBloodgroup(request.getParameter("bloodgroup"));
            patient.setSex(request.getParameter("sex"));
            int age=Integer.parseInt(request.getParameter("age"));
            patient.setAges(age);
            out.println(patient);
            int status=0;
	        EditDao dao1=new EditDao();
	        out.println(patient +" :lovely");
	        status=dao1.updatepatient(patient, id);
	        String url="/HospitalRecode/authentication/admin/editpatient.jsp";
	        if(status>0){
		        HttpSession session=request.getSession(false);
	          	if((session==null) | session.getAttribute("a")==null){
	        		url="/HospitalRecode/authentication/adminlogin.jsp";
	        		System.out.println("you are not logged in");
	        	}else{
	        		System.out.println("you are logged in");
	        		String updatep="Updated Patient";
		           	session.setAttribute("updatep", updatep );
	        	}
	        }
            out.println("Patient insert:"+ status);
            request.setAttribute("status", status);

            response.sendRedirect(url);
        
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AddPatients.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
