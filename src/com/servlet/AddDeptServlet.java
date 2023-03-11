/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.bean.AllDeptDoctors;
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

/**
 *
 * @author user
 */
public class AddDeptServlet extends HttpServlet {

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
            AllDeptDoctors dept=new AllDeptDoctors();
            dept.setDeptname(request.getParameter("deptname"));
            AdminDao dao=new AdminDao();
            boolean flag=dao.checkDept(dept);
            System.out.println("present: "+flag);
            String url="/HospitalRecode/authentication/admin/admindashboard.jsp";
            int status=0;
            if(!flag){
            	status=dao.insertDept(dept);
            	if(status>0){
            		url="/HospitalRecode/authentication/admin/admindashboard.jsp";
            	}
            }else{
            	System.out.println("already present");
            }
            out.println("department insert:"+status);
            response.sendRedirect(url);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AddDeptServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    
}
