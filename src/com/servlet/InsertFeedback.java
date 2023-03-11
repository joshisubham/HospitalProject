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

import com.bean.Feedback;
import com.dao.FeedbackDao;

/**
 * Servlet implementation class InsertFeedback
 */
@WebServlet("/InsertFeedback")
public class InsertFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFeedback() {
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
		    String url="/HospitalRecode/index.jsp";
		    Feedback fb=new Feedback();
		    fb.setName(request.getParameter("name"));
		    fb.setComment(request.getParameter("comment"));
		    FeedbackDao dao=new FeedbackDao();
		    int status=dao.insertFeedback(fb);
		    System.out.println("feeback inserted:"+status);
		    response.sendRedirect(url);
		} catch (ClassNotFoundException ex) {
		    Logger.getLogger(InsertFeedback.class.getName()).log(Level.SEVERE, null, ex);
		} catch (SQLException ex) {
		    Logger.getLogger(InsertFeedback.class.getName()).log(Level.SEVERE, null, ex);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


}



///////////
