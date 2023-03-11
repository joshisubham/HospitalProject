package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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

import com.bean.AllAppointments;
import com.dao.EditDao;

/**
 * Servlet implementation class PatientUpAppointments
 */
@WebServlet("/PatientUpAppointments")
public class PatientUpAppointments extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientUpAppointments() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int id=Integer.parseInt(request.getParameter("pid"));
            AllAppointments appoint=new AllAppointments();
            appoint.setDate(Date.valueOf(request.getParameter("appdate")));
            appoint.setDeptid(Integer.parseInt(request.getParameter("deptid")));
            int appid=Integer.parseInt(request.getParameter("appid"));
            EditDao dao=new EditDao();
            int status=dao.updateAppoint(appoint,appid);
            out.println("appointment updated:"+status);
            String url="/HospitalRecode/authentication/patient/patientdashboard.jsp?pid="+id;
            if(status>0){
	          	HttpSession session=request.getSession(false);
	          	if((session==null) | session.getAttribute("p")==null){
	        		url="/HospitalRecode/authentication/patientlogin.jsp";
	        		System.out.println("you are not logged in");
	        	}else{
	        		System.out.println("you are logged in");
	        		String str3="Updated appointment";
		           	session.setAttribute("str3", str3 );
	        	}
	           	
	        }
            response.sendRedirect(url);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AddAppointments.class.getName()).log(Level.SEVERE, null, ex);
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
