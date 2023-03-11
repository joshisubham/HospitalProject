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

import com.bean.DeptDoctors;
import com.dao.EditDao;

/**
 * Servlet implementation class UpdateInDoctors
 */
@WebServlet("/UpdateInDoctors")
public class UpdateInDoctors extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInDoctors() {
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
            int did=Integer.parseInt(request.getParameter("did"));
            DeptDoctors doctor=new DeptDoctors();
            doctor.setName(request.getParameter("name"));
            doctor.setPhone(request.getParameter("phone"));
            doctor.setEmail(request.getParameter("email"));
            doctor.setPassword(request.getParameter("password"));
            doctor.setDeptid(Integer.parseInt(request.getParameter("deptid")));
            out.println(doctor);
            EditDao daos=new EditDao();
            String url="/HospitalRecode/authentication/doctor/doctordashboard.jsp?id="+did;
	        int status=daos.updatedoctor(doctor, did);
	        if(status>0){
	          	HttpSession session=request.getSession(false);
	          	if((session==null) | session.getAttribute("d")==null){
	        		url="/HospitalRecode/authentication/doctorlogin.jsp";
	        		System.out.println("you are not logged in");
	        	}else{
	        		System.out.println("you are logged in");
	        		String str4="Updated Doctor";
		           	session.setAttribute("str4", str4 );
	        	}
	           	
	        }
            response.sendRedirect(url);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UpdateInDoctors.class.getName()).log(Level.SEVERE, null, ex);
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
