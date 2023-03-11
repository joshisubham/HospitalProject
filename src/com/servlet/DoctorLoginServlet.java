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

import com.bean.DeptDoctors;
import com.dao.SelectDao;

/**
 * Servlet implementation class DoctorLoginServlet
 */
@WebServlet("/DoctorLoginServlet")
public class DoctorLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DeptDoctors doctor=new DeptDoctors();
            doctor.setEmail(request.getParameter("doctoruser"));
            doctor.setPassword(request.getParameter("doctorpass"));
            SelectDao dao=new SelectDao();
            out.println(doctor);
            String url="/HospitalRecode/authentication/doctor/doctorlogin.jsp";
            try {
                boolean status=dao.checkDoctor(doctor);
                request.setAttribute("doctor",doctor);
                out.println("verification of doctor:"+ status);
                if(status){
	                DeptDoctors d=new DeptDoctors();
	                d=dao.getdoctor(doctor);
	                url="/HospitalRecode/authentication/doctor/doctordashboard.jsp?id="+d.getId();
	                HttpSession session=request.getSession();
	                if(session!=null){
		                session=request.getSession();
		                session.setAttribute("d", d);
		                System.out.println("new session creating, id: "+session.getId());
		                System.out.println("id:"+session.getAttribute("did")+", patient:"+ session.getAttribute("d"));
	                }
	                
	                System.out.println("Created id:"+session.getAttribute("did")+", patient:"+ session.getAttribute("d"));
	                
                }
            } catch (ClassNotFoundException | SQLException ex) {
                out.println("<h5>Exception occurred: "+ex+"</h5>");
            } catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
            response.sendRedirect(url);
        }
	}

	
}
