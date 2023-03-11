/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.bean.DeptDoctors;
import com.dao.AdminDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */

public class AddDoctors extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
            DeptDoctors doctor=new DeptDoctors();
            doctor.setName(request.getParameter("name"));
            doctor.setPhone(request.getParameter("phone"));
            doctor.setEmail(request.getParameter("email"));
            doctor.setPassword(request.getParameter("password"));
            doctor.setDeptid(Integer.parseInt(request.getParameter("deptid")));
            int status=0;
            String url="/HospitalRecode/authentication/admin/adddoctor.jsp";
            AdminDao dao=new AdminDao();
            boolean flag=dao.checkDoctor(doctor);
            if(!flag){
            	status=dao.insertDoctor(doctor);
                if(status>0){
                	url="/HospitalRecode/authentication/admin/alldoctor.jsp";
                	HttpSession session=request.getSession(false);
    	            if((session==null) | session.getAttribute("a")==null){
    	        		url="/HospitalRecode/authentication/adminlogin.jsp";
    	        		System.out.println("you are not logged in");
    	        	}else{
    	        		System.out.println("you are logged in");
    	        	}
                }
            	out.println("Patient insert:"+ status);
            }else{
            	System.out.println("already present");
            	url="/HospitalRecode/authentication/admin/adddoctor.jsp";
            } 
            
            out.println("doctor inserted:"+ status);
            response.sendRedirect(url);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AddDoctors.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
