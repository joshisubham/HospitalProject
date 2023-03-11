package com.dao;

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

import com.bean.AllAppointments;
import com.bean.AllDeptDoctors;
import com.bean.AllPatientWithApp;
import com.bean.DeptDoctors;

public class SelectDao {
	private String qry;
    Connection getConnect() throws ClassNotFoundException, SQLException, NamingException{
    	InitialContext ic=new InitialContext();
    	Context ctx=(Context)ic.lookup("java:comp/env");
    	DataSource ds=(DataSource)ctx.lookup("hr");
    	Connection con=ds.getConnection();
    
    	return con;
    }
    
    public AllPatientWithApp selectpatient(int id) throws ClassNotFoundException, SQLException, NamingException{
    	AllPatientWithApp p=null;
    	try(Connection con=getConnect()){
            qry="select pname, pemail, ppassword, pbloodgroup, psex, pages from patient where pid=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setInt(1,id);
                ResultSet rs=ps.executeQuery();
                if(rs.next()){
                	p=new AllPatientWithApp();
                	p.setName(rs.getString("pname"));
                	p.setEmail(rs.getString("pemail"));
                	p.setBloodgroup(rs.getString("pbloodgroup"));
                	p.setSex(rs.getString("psex"));
                	p.setPassword(rs.getString("ppassword"));
                	p.setAges(rs.getInt("pages"));
                }
                System.out.println("Selected Patient:"+p);
            }
        }
    	
    	return p;
    }
    public AllAppointments getAppointmentsByPid(int id) throws ClassNotFoundException, SQLException, NamingException{
    	AllAppointments appoint=new AllAppointments();
    	try(Connection con=getConnect()){
            qry="select appid, appdate, deptname from app inner join dept on app.deptid=dept.deptid where pid=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
//                ps.setDate(1,new java.sql.Date(appoint.getDate().getTime()));
//                ps.setInt(2,appoint.getDeptid());
                ps.setInt(1,id);
                ResultSet rs=ps.executeQuery();
                if(rs.next()){
                	appoint.setId(rs.getInt("appid"));
                	appoint.setDate(new java.util.Date((rs.getDate("appdate")).getTime()));
                	appoint.setDeptname(rs.getString("deptname"));
                }
                System.out.println("Updating Appoint:"+appoint);
            }
        }
    	
    	return appoint;
    }
    public AllDeptDoctors selectdoctor(int id) throws ClassNotFoundException, SQLException, NamingException{
    	AllDeptDoctors d=null;
    	try(Connection con=getConnect()){
            qry="select d.dname, d.dphone, d.demail, d.dpassword, d.deptid, dept.deptname, d.did from doctor d inner join dept on d.deptid=dept.deptid  where d.did=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setInt(1,id);
                ResultSet rs=ps.executeQuery();
                if(rs.next()){
                	d=new AllDeptDoctors();
                	DeptDoctors dd=new DeptDoctors();
                	dd.setName(rs.getString(1));
                    dd.setPhone(rs.getString(2));
                    dd.setEmail(rs.getString(3));
                    dd.setPassword(rs.getString(4));
                    dd.setId(rs.getInt(7));
                    List<DeptDoctors> list=new ArrayList<DeptDoctors>();
                    list.add(dd);
                    
                    d.setDeptDoctors(list);
                    d.setDeptid(rs.getInt(5));
                    d.setDeptname(rs.getString(6));
                   
                }
                System.out.println("Updating Doctor:"+d);
            }
        }
    	
    	return d;
    }
    
    public boolean checkDoctor(DeptDoctors doctor) throws ClassNotFoundException, SQLException, NamingException{
        boolean status;
        Connection con = getConnect();
            
            qry="SELECT dname, dpassword FROM doctor WHERE demail=? and dpassword=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setString(1,doctor.getEmail());
                ps.setString(2,doctor.getPassword());
                ResultSet rs=ps.executeQuery();
                if(rs.next()){
                    status=true;
                }else{
                	System.out.println("XXX :"+doctor);
                    status=false;
                }
            }
        con.close();
        return status;               
    }
    public boolean checkPatient(AllPatientWithApp patient) throws ClassNotFoundException, SQLException, NamingException{
        boolean status;
        try(Connection con = getConnect())
        { 
            qry="SELECT pname, ppassword FROM patient WHERE pemail=? and ppassword=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setString(1,patient.getEmail());
                ps.setString(2,patient.getPassword());
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
    public DeptDoctors getdoctor(DeptDoctors d) throws ClassNotFoundException, SQLException, NamingException{
    	DeptDoctors doctor=null;
    	try(Connection con=getConnect()){
            qry="select d.dname, d.dphone, d.demail, dept.deptname, d.did from doctor d inner join dept on d.deptid=dept.deptid where d.demail=? and d.dpassword=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setString(1,d.getEmail());
                ps.setString(2,d.getPassword());
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                	doctor=new DeptDoctors();
                	doctor.setName(rs.getString(1));
                	doctor.setPhone(rs.getString(2));
                	doctor.setEmail(rs.getString(3));
                	
                	doctor.setId(rs.getInt(5));
                	doctor.setDeptname(rs.getString(4));
                }
                System.out.println("Creating Doctor:"+doctor);
            }
        }
    	
    	return doctor;
    }
    public AllPatientWithApp getPatient(AllPatientWithApp p) throws ClassNotFoundException, SQLException, NamingException{
    	AllPatientWithApp patient=null;
    	try(Connection con=getConnect()){
            qry="select pid, pname, pemail, pbloodgroup, psex, pages from patient where pemail=? and ppassword=?";
            try (PreparedStatement ps = con.prepareStatement(qry)) {
                ps.setString(1,p.getEmail());
                ps.setString(2,p.getPassword());
                ResultSet rs=ps.executeQuery();
                if(rs.next()){
                	patient=new AllPatientWithApp();
                	patient.setId(rs.getInt(1));
                	patient.setName(rs.getString(2));
                	patient.setEmail(rs.getString(3));
                	patient.setBloodgroup(rs.getString(4));
                	patient.setSex(rs.getString(5));
                	patient.setAges(rs.getInt(6));
                }
                System.out.println("Creating Patient:"+patient);
            }
        }
    	
    	return patient;
    }
    
}
