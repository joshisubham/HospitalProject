/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.bean.Admin;
import com.bean.AllAppointments;
import com.bean.AllDeptDoctors;
import com.bean.AllPatientWithApp;
import com.bean.DeptDoctors;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.TreeMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author user
 */
public class AdminDao {
    private String qry;
    Connection getConnect() throws ClassNotFoundException, SQLException, NamingException{
    	InitialContext ic=new InitialContext();
    	Context ctx=(Context)ic.lookup("java:comp/env");
    	DataSource ds=(DataSource)ctx.lookup("hr");
    	Connection con=ds.getConnection();
    
    	return con;
    }
    
    public boolean checkAdmin(Admin admin) throws ClassNotFoundException, SQLException, NamingException{
        boolean status;
        try(Connection con = getConnect())
        {
            qry="SELECT adminuser, adminpass FROM admintable WHERE adminuser=? and adminpass=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setString(1,admin.getAdminuser());
                ps.setString(2,admin.getAdminpass());
                ResultSet rs=ps.executeQuery();
                if(rs.next()){
                    status=true;
                }else{
                    status=false;
                }
            }
        }
        return status;               
    }
    
    
    public int insertDept(AllDeptDoctors dept) throws ClassNotFoundException, SQLException, NamingException{
        int status=0;
        try(Connection con=getConnect()){
            String qry="insert into dept(deptname) values(?)";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setString(1,dept.getDeptname());
                status=ps.executeUpdate();
                System.out.println("Inserting dept:"+status);
            }
        }
        return status;
    }
    public boolean checkDept(AllDeptDoctors dept) throws ClassNotFoundException, SQLException, NamingException{
    	boolean status=false;
        try(Connection con=getConnect()){
            String qry="select * from dept where deptname=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setString(1,dept.getDeptname());
                ResultSet rs=ps.executeQuery();
                if(rs.next()){
                	status=true;
                	System.out.println("Inserting dept:"+status);
                }
            }
        }
        return status;
    }
    public int insertPatient(AllPatientWithApp patient) throws ClassNotFoundException, SQLException, NamingException{
        int status=0;
        try(Connection con=getConnect()){
            String qry="insert into patient(pname, pemail, ppassword, pbloodgroup, psex, pages) values(?,?,?,?,?,?)";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setString(1,patient.getName());
                ps.setString(2,patient.getEmail());
                ps.setString(3,patient.getPassword());
                ps.setString(4,patient.getBloodgroup());
                ps.setString(5,patient.getSex());
                ps.setInt(6,patient.getAges());
                status=ps.executeUpdate();
                System.out.println("Inserting Patient:"+status);
            }
        }
        return status;
    }
    public boolean checkPatient(AllPatientWithApp patient) throws ClassNotFoundException, SQLException, NamingException{
    	boolean status=false;
        try(Connection con=getConnect()){
            String qry="select pemail from patient where pemail=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setString(1,patient.getEmail());
                ResultSet rs=ps.executeQuery();
                if(rs.next()){
                	status=true;
                	System.out.println("Checking Patient:"+status);
                }
            }
        }
        return status;
    }
    public Map<Integer, AllDeptDoctors> getAllDept() throws ClassNotFoundException, SQLException, NamingException{
        Map<Integer,AllDeptDoctors> map=new TreeMap<Integer,AllDeptDoctors>();
        try(Connection con=getConnect()){
            String qry="select * from dept";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                	AllDeptDoctors dept=new AllDeptDoctors();
                    dept.setDeptname(rs.getString("deptname"));
                    map.put(rs.getInt(1),dept);
                    System.out.println("retrieving dept:"+rs.getString("deptname"));
                }
            }
        }
        return map;
    }
    public Map<Integer, AllDeptDoctors> getAllappDept() throws ClassNotFoundException, SQLException, NamingException{
        Map<Integer,AllDeptDoctors> map=new TreeMap<Integer,AllDeptDoctors>();
        try(Connection con=getConnect()){
            String qry="select dept.deptid, dept.deptname from dept inner join app on dept.deptid=app.deptid group by dept.deptname";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                	AllDeptDoctors dept=new AllDeptDoctors();
                	dept.setDeptname(rs.getString("deptname"));
                    map.put(rs.getInt(1),dept);
                    System.out.println("retrieving dept:"+rs.getString("deptname"));
                }
            }
        }
        return map;
    }
    public int insertDoctor(DeptDoctors doctor) throws ClassNotFoundException, SQLException, NamingException{
        int status=0;
        String qry="insert into doctor(dname, dphone, demail, dpassword, deptid) values(?,?,?,?,?)";
        try(Connection con=getConnect(); PreparedStatement ps = con.prepareStatement(qry)){
            ps.setString(1, doctor.getName());
            ps.setString(2, doctor.getPhone());
            ps.setString(3, doctor.getEmail());
            ps.setString(4, doctor.getPassword());
            ps.setInt(5, doctor.getDeptid());
            status=ps.executeUpdate();
            System.out.println("inserted doctor:"+doctor.getName());
        }
        return status;
    }
    public boolean checkDoctor(DeptDoctors doctor) throws ClassNotFoundException, SQLException, NamingException{
    	boolean status=false;
        String qry="select * from doctor where demail=?";
        try(Connection con=getConnect(); PreparedStatement ps = con.prepareStatement(qry)){
            ps.setString(1, doctor.getEmail());
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
            	status=true;
            	System.out.println("Checking Doctor:"+status);
            }
        }
        return status;
    }
    public Map<Integer, String> getAllPatient() throws ClassNotFoundException, SQLException, NamingException{
        Map<Integer,String> map=new TreeMap<Integer,String>();
        try(Connection con=getConnect()){
            String qry="select * from patient";
            PreparedStatement ps=con.prepareStatement(qry);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                map.put(rs.getInt(1),rs.getString("pemail"));
                System.out.println("retrieving person:"+rs.getString("pemail"));
            }
            ps.close();
        }
        return map;
    }
    public Map<Integer, String> getAllappPatient() throws ClassNotFoundException, SQLException, NamingException{
        Map<Integer,String> map=new TreeMap<Integer,String>();
        try(Connection con=getConnect()){
            String qry="select * from patient p where p.appid IS NOT NULL";
            PreparedStatement ps=con.prepareStatement(qry);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                map.put(rs.getInt(1),rs.getString("pemail"));
                System.out.println("retrieving person: id-"+rs.getInt(1)+", "+rs.getString("pname"));
            }
            ps.close();
        }
        return map;
    }
    public int insertApp(AllAppointments appoint) throws ClassNotFoundException, SQLException, NamingException{
        int status=0;
        try(Connection con=getConnect()){
            String qry1="select p.appid from patient p where p.pid=?";
            String qry="insert into app(appdate,pid,deptid) values(?,?,?)";
            String qry2="update patient p set p.appid=? where p.pid=?";
            try(PreparedStatement ps1 = con.prepareStatement(qry1)){
            	ps1.setInt(1,appoint.getPid());
            	ResultSet rs=ps1.executeQuery();
            	while(rs.next()){
            		System.out.println("p.appid is "+rs.getString(1));
            		
                    try (PreparedStatement ps = con.prepareStatement(qry,Statement.RETURN_GENERATED_KEYS)) {
                        ps.setDate(1, new java.sql.Date(appoint.getDate().getTime()));
                        ps.setInt(2, appoint.getPid());
                        ps.setInt(3, appoint.getDeptid());
                        int flag=ps.executeUpdate();
                        System.out.println("Insert appointment:"+status);
                        ResultSet rs2=ps.getGeneratedKeys();
                        
                        if(flag>0){
                        	int lastId=1;
                        	while(rs2.next()){
	                    		if(rs2.last()){
	                    			lastId=rs2.getInt(1);
	                    			System.out.println("Last AutoGenerated key:"+ rs2.getInt(1));
	                    		}
                    		}
                        	try(PreparedStatement ps2 = con.prepareStatement(qry2)){
                        		ps2.setInt(1, lastId);
                        		ps2.setInt(2, appoint.getPid());
                        		status=ps2.executeUpdate();
                        		System.out.println("Patient update status:"+status);
                        		
                        	}
                        	
                           
                    	}
                    	
                    }//try of app closed
            	}
            	
            }

        }
        return status;
    }
    
}
