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
 * Servlet implementation class UpdateDoctors
 */
@WebServlet("/UpdateDoctors")
public class UpdateDoctors extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDoctors() {
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
            /* TODO output your page here. You may use following sample code. */
            out.println(request.getParameter("name")+", ph:"+request.getParameter("phone"));
            out.println(request.getParameter("email")+", pass:"+request.getParameter("password"));
            out.println(", deptid:"+Integer.parseInt(request.getParameter("deptid")));
            int did=Integer.parseInt(request.getParameter("did"));
            DeptDoctors doctor=new DeptDoctors();
            doctor.setName(request.getParameter("name"));
            doctor.setPhone(request.getParameter("phone"));
            doctor.setEmail(request.getParameter("email"));
            doctor.setPassword(request.getParameter("password"));
            doctor.setDeptid(Integer.parseInt(request.getParameter("deptid")));
            out.println(doctor);
            int status=0;
            EditDao daos=new EditDao();
	        status=daos.updatedoctor(doctor, did);
	        String url="/HospitalRecode/authentication/admin/editdoctor.jsp";
	        if(status>0){
		        HttpSession session=request.getSession(false);
	          	if((session==null) | session.getAttribute("a")==null){
	        		url="/HospitalRecode/authentication/adminlogin.jsp";
	        		System.out.println("you are not logged in");
	        	}else{
	        		System.out.println("you are logged in");
	        		String updated="Updated Appointment";
		           	session.setAttribute("updated", updated );
	        	}
	        }
            System.out.println("doctor updated:"+ status);
            response.sendRedirect(url);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AddDoctors.class.getName()).log(Level.SEVERE, null, ex);
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
