/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.bean.Admin;
import com.dao.AdminDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */

public class AdminLoginServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Admin admin=new Admin(request.getParameter("adminuser"),request.getParameter("adminpass"));
            AdminDao admindao=new AdminDao();
            out.println(admin);
            String url="/HospitalRecode/authentication/adminlogin.jsp";
            try {
                boolean status=admindao.checkAdmin(admin);
                out.println("verification of admin:"+ status);
                if(status){
                	url="/HospitalRecode/authentication/admin/admindashboard.jsp";
                	HttpSession session=request.getSession();
	                if(session!=null){
		                session=request.getSession();
		                System.out.println("new session creating, id: "+session.getId());
		                session.setAttribute("a", admin);
		                System.out.println("id:"+session.getAttribute("did")+", patient:"+ session.getAttribute("d"));
	                }
                }
            } catch (ClassNotFoundException | SQLException ex) {
                out.println("<h5>Exception occurred: "+ex+"</h5>");
            } catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
            System.out.println("hello, "+admin);
            response.sendRedirect(url);
        }
    }

   

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
