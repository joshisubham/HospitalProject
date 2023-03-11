package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.AllPatientWithApp;
import com.dao.SelectDao;

/**
 * Servlet implementation class PatientLoginServlet
 */
@WebServlet("/PatientLoginServlet")
public class PatientLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPoet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            AllPatientWithApp patient=new AllPatientWithApp();
            patient.setEmail(request.getParameter("patientemail"));
            patient.setPassword(request.getParameter("patientpass"));
            SelectDao dao=new SelectDao();
            out.println(patient);
            String url="/HospitalRecode/authentication/patient/patientlogin.jsp";
            try {
                boolean status=dao.checkPatient(patient);
                System.out.println("verification of patient:"+ status);
                if(status){
	                AllPatientWithApp p=dao.getPatient(patient);
	                System.out.println(p.getId());
	                url="/HospitalRecode/authentication/patient/patientdashboard.jsp?pid="+p.getId();
	                
	                HttpSession session=request.getSession();
	                if(session!=null){
		                session=request.getSession();
		                session.setAttribute("p", p);
		                System.out.println("new session creating, id: "+session.getId());
		                System.out.println("id:"+session.getAttribute("pid")+", patient:"+ session.getAttribute("p"));
	                }
	                
	                               
                }
            } catch (ClassNotFoundException | SQLException ex) {
                out.println("<h5>Exception occurred: "+ex+"</h5>");
            } catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
          System.out.println("hello, "+patient);
          response.sendRedirect(url);

        }
	}

	

}
