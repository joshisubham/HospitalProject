package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.bean.AllAppointments;
import com.bean.AllDeptDoctors;
import com.bean.AllPatientWithApp;
import com.bean.DeptDoctors;

public class EditDao {
	private String qry;
    Connection getConnect() throws ClassNotFoundException, SQLException, NamingException{
    	InitialContext ic=new InitialContext();
    	Context ctx=(Context)ic.lookup("java:comp/env");
    	DataSource ds=(DataSource)ctx.lookup("hr");
    	Connection con=ds.getConnection();
    
    	return con;
    }
    
    public int updatepatient(AllPatientWithApp patient,int id) throws ClassNotFoundException, SQLException, NamingException{
    	int status=0;
    	try(Connection con=getConnect()){
            qry="update patient set pname=?, pemail=?, ppassword=?, pbloodgroup=?, psex=?, pages=? where pid=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setString(1,patient.getName());
                ps.setString(2,patient.getEmail());
                ps.setString(3,patient.getPassword());
                ps.setString(4,patient.getBloodgroup());
                ps.setString(5,patient.getSex());
                ps.setInt(6,patient.getAges());
                ps.setInt(7, id);
                status=ps.executeUpdate();
                System.out.println("Inserting Patient:"+status);
            }
        }
    	
    	return status;
    }
    public int updateAppoint(AllAppointments  appoint,int id) throws ClassNotFoundException, SQLException, NamingException{
    	int status=0;
    	try(Connection con=getConnect()){
            qry="update app set appdate=?, deptid=? where appid=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setDate(1,new java.sql.Date(appoint.getDate().getTime()));
                ps.setInt(2,appoint.getDeptid());
                ps.setInt(3,id);
                status=ps.executeUpdate();
                System.out.println("Updating Appoint:"+status);
            }
        }
    	
    	return status;
    }
    
    public int updatedoctor(DeptDoctors d,int id) throws ClassNotFoundException, SQLException, NamingException{
    	int status=0;
    	try(Connection con=getConnect()){
            qry="update doctor set dname=?, dphone=?, demail=?, dpassword=?, deptid=? where did=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setString(1,d.getName());
                ps.setString(2,d.getPhone());
                ps.setString(3,d.getEmail());
                ps.setString(4,d.getPassword());
                ps.setInt(5,d.getDeptid());
                ps.setInt(6, id);
                status=ps.executeUpdate();
                System.out.println("Updating Doctor:"+status);
            }
        }
    	
    	return status;
    }
    public int updateDept(AllDeptDoctors dept,int id) throws ClassNotFoundException, SQLException, NamingException{
    	int status=0;
    	try(Connection con=getConnect()){
            String qry="update dept set deptname=? where deptid=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setString(1,dept.getDeptname());
                ps.setInt(2,id);
                status=ps.executeUpdate();
                System.out.println("Updating dept:"+status);
            }
        }
    	
    	return status;
    }
    
    public int deleteAppoint(int id) throws ClassNotFoundException, SQLException, NamingException{
    	int status=0;
    	try(Connection con=getConnect()){
            qry="update patient p set p.appid=null  where p.pid=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setInt(1, id);
                int flag=ps.executeUpdate();
                if(flag>0){
                	String qry2="delete from app where pid=?";
                	try(PreparedStatement ps2 = con.prepareStatement(qry2)){
                		ps2.setInt(1,id);
                		status=ps2.executeUpdate();
                		System.out.println("Deleting Patient:"+status);
                	}
                }
                
            }
        }
    	
    	return status;
    }
    public int deletePatient(int id) throws ClassNotFoundException, SQLException, NamingException{
    	int status=0;
    	try(Connection con=getConnect()){
    		String qry3="delete from patient where pid=?";
        	try(PreparedStatement ps3 = con.prepareStatement(qry3)){
        		ps3.setInt(1,id);
        		status=ps3.executeUpdate();
        		System.out.println("Deleting Patient:"+status);
        	}//closing delete patient
            qry="select * from app where pid=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setInt(1, id);
                ResultSet rs=ps.executeQuery();
                if(rs.next())
                {   
	                	String qry2="delete from app where pid=?";
	                	try(PreparedStatement ps2 = con.prepareStatement(qry2)){
	                		ps2.setInt(1,id);
	                		int flag=ps2.executeUpdate();
	                		System.out.println("Deleting Appointment:"+flag);
	                }
                }//closing if resultset
                
            }//closing select of appointment
            
    	}
    	return status;
    	
    }
    public int deleteDoctor(int id) throws ClassNotFoundException, SQLException, NamingException{
    	int status=0;
    	try(Connection con=getConnect()){
            qry="delete from doctor where did=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setInt(1,id);
                status=ps.executeUpdate();
                System.out.println("Deleting doctor:"+status);
            }
        }
    	
    	return status;
    }
    
    

}
