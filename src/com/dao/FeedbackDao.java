/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.bean.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author user
 */
public class FeedbackDao {
    Connection getConnect()throws ClassNotFoundException, SQLException, NamingException{
    	InitialContext ic=new InitialContext();
    	Context ctx=(Context)ic.lookup("java:comp/env");
    	DataSource ds=(DataSource)ctx.lookup("hr");
    	Connection con=ds.getConnection();
    
    	return con;
    }
    public int insertFeedback(Feedback fb) throws ClassNotFoundException, SQLException, NamingException{
       int status=0;
       String qry="insert into feedback(fname,ftext) values(?,?)";
       try(Connection con=getConnect()){
           PreparedStatement ps=con.prepareStatement(qry);
           ps.setString(1, fb.getName());
           ps.setString(2, fb.getComment());
           status=ps.executeUpdate();
           ps.close();
       }
       
       return status;
    }
    public List<Feedback> getFeedbacks() throws ClassNotFoundException, SQLException, NamingException{
        List<Feedback> list=new ArrayList<Feedback>();
        String qry="select fname, ftext from feedback";
        try(Connection con=getConnect()){
            try(PreparedStatement ps=con.prepareStatement(qry)){
	            ResultSet rs=ps.executeQuery();
	            while(rs.next()){
	            	Feedback f=new Feedback();
	            	f.setName(rs.getString(1));
	            	f.setComment(rs.getString(2));
	            	list.add(f);
	            }
            }
        }
        
        return list;
     }
}
