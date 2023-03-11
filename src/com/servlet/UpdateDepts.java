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

import com.bean.AllDeptDoctors;
import com.dao.EditDao;

/**
 * Servlet implementation class UpdateDepts
 */
@WebServlet("/UpdateDepts")
public class UpdateDepts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDepts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            AllDeptDoctors dept=new AllDeptDoctors();
            out.println(request.getParameter("deptid"));
            Integer id=Integer.parseInt(request.getParameter("deptid"));
            dept.setDeptname(request.getParameter("deptname"));
            EditDao dao=new EditDao();
            out.println(dept +" :lovely");
            int status=dao.updateDept(dept, id);
            out.println("Patient insert:"+ status);
            String url="/HospitalRecode/authentication/admin/admindashboard.jsp";
            if(status>0){
            	HttpSession session=request.getSession(false);
	            if((session==null) | session.getAttribute("a")==null){
	        		url="/HospitalRecode/authentication/adminlogin.jsp";
	        		System.out.println("you are not logged in");
	        	}else{
	        		System.out.println("you are logged in");
	        	}
            }
            response.sendRedirect(url);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AddPatients.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	

}
