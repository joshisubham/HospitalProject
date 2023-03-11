package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bean.AllPatientWithApp;
import com.dao.AdminDao;
import com.google.gson.Gson;

/**
 * Servlet implementation class RegisterPatients
 */
@WebServlet("/RegisterPatients")
public class RegisterPatients extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterPatients() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		response.addHeader("Access-Control-Allow-Origin", "*");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            AllPatientWithApp patient=new AllPatientWithApp();
            patient.setName(request.getParameter("name"));
            patient.setEmail(request.getParameter("email"));
            patient.setPassword(request.getParameter("password"));
            patient.setBloodgroup(request.getParameter("bloodgroup"));
            patient.setSex(request.getParameter("sex"));
            patient.setAges(Integer.parseInt(request.getParameter("ages")));
            AdminDao dao=new AdminDao();
            
            int status=0;
            boolean flag=dao.checkPatient(patient);
            Map<String, String> datatags = new LinkedHashMap<>();
            if(!flag){
            	status=dao.insertPatient(patient);
            	if(status>0){
            		 datatags.put("result", "done");
                }
            }else{
            	datatags.put("result", "Unable to Register, Email Exists");
            	System.out.println("already present");
            }
            String json = new Gson().toJson(datatags);
            out.println(json);
            
        
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AddPatients.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
