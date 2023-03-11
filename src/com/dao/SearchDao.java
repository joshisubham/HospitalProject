/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.bean.AllAppointments;
import com.bean.AllDeptDoctors;
import com.bean.AllPatientWithApp;
import com.bean.DeptDoctors;
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
public class SearchDao {
    private String qry;
    Connection getConnect()throws ClassNotFoundException, SQLException, NamingException{
    	InitialContext ic=new InitialContext();
    	Context ctx=(Context)ic.lookup("java:comp/env");
    	DataSource ds=(DataSource)ctx.lookup("hr");
    	Connection con=ds.getConnection();
    
    	return con;
    }
    public List<AllDeptDoctors> getDeptDoctors() throws ClassNotFoundException, SQLException, NamingException{
        List<AllDeptDoctors> list=new ArrayList<>();
        qry="SELECT dept.deptid, dept.deptname, count(distinct d.dname) FROM dept LEFT JOIN doctor d ON dept.deptid=d.deptid GROUP BY dept.deptname";
        try(Connection con=getConnect()){
            PreparedStatement ps=con.prepareStatement(qry);
            ResultSet rs=ps.executeQuery();
            System.out.println("hello");
            while(rs.next()){
                AllDeptDoctors alldeptdoctors=new AllDeptDoctors();
                alldeptdoctors.setDeptid(rs.getInt(1));
                alldeptdoctors.setDeptname(rs.getString(2));
                alldeptdoctors.setCount(rs.getInt(3));
                alldeptdoctors.setDeptDoctors(getDoctorsByDept(rs.getInt(1)));
                list.add(alldeptdoctors);
            }
            ps.close();
        }
        return list;
    }
    public List<DeptDoctors> getDoctorsByDept(int id) throws ClassNotFoundException, SQLException, NamingException{
        //method which gives doctor all detail by id--used by getDeptDoctors()
    	List<DeptDoctors> list=new ArrayList<>();
        qry="SELECT did, dname,dphone, demail FROM doctor WHERE deptid=?";
        try(Connection con=getConnect()){
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                DeptDoctors alldoctors=new DeptDoctors();
                alldoctors.setId(rs.getInt(1));
                alldoctors.setName(rs.getString(2));
                alldoctors.setPhone(rs.getString(3));
                alldoctors.setEmail(rs.getString(4));
                list.add(alldoctors);        
            }
            ps.close();
        }
        return list;
    }
    public List<AllDeptDoctors> getDeptDoctors(String name) throws ClassNotFoundException, SQLException, NamingException{
    	//parameterized one getdepartmentDocters in which name of department is the parameter
        List<AllDeptDoctors> list=new ArrayList<>();
        qry="SELECT dept.deptid, dept.deptname, count(distinct d.dname) FROM dept LEFT JOIN doctor d ON dept.deptid=d.deptid WHERE dept.deptname=? GROUP BY dept.deptname";
        try(Connection con=getConnect()){
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setString(1, name);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                AllDeptDoctors alldeptdoctors=new AllDeptDoctors();
                alldeptdoctors.setDeptid(rs.getInt(1));
                alldeptdoctors.setDeptname(rs.getString(2));
                alldeptdoctors.setCount(rs.getInt(3));
                alldeptdoctors.setDeptDoctors(getDoctorsByDept(rs.getInt(1)));
                list.add(alldeptdoctors);
            }
            ps.close();
        }
        return list;
    }
    ////////////////////
    ///////////below patient
    public List<AllPatientWithApp> getAllPatients() throws ClassNotFoundException, SQLException, NamingException{
        List<AllPatientWithApp> list=new ArrayList<>();
        qry="SELECT p.pid, p.pname,p.pemail,p.pbloodgroup,p.psex, p.pages, app.appdate, dept.deptname FROM patient p LEFT JOIN app ON p.appid=app.appid LEFT JOIN dept ON app.deptid=dept.deptid";
        try(Connection con=getConnect()){
            PreparedStatement ps=con.prepareStatement(qry);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	AllPatientWithApp all=new AllPatientWithApp();
            	all.setId(rs.getInt(1));
            	all.setName(rs.getString(2));
            	all.setEmail(rs.getString(3));
            	all.setBloodgroup(rs.getString(4));
            	all.setSex(rs.getString(5));
            	all.setAges(rs.getInt(6));
            	if(rs.getDate(7)==null){
            		all.setDate(null);
            	}else{
            		all.setDate(new java.util.Date((rs.getDate(7).getTime()) ));
            	}

            	all.setDeptname(rs.getString(8));
                list.add(all);
            }
            ps.close();
        }
        return list;
    }
    
    public List<AllPatientWithApp> getAllPatients(String name) throws ClassNotFoundException, SQLException, NamingException{
    	//parameterized one getPatients in which their name is the parameter
    	List<AllPatientWithApp> list=new ArrayList<>();
        qry="SELECT p.pid, p.pname,p.pemail,p.pbloodgroup,p.psex, p.pages, app.appdate, dept.deptname FROM patient p LEFT JOIN app ON p.appid=app.appid LEFT JOIN dept ON app.deptid=dept.deptid WHERE p.pname=?";
        try(Connection con=getConnect()){
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setString(1, name);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	AllPatientWithApp all=new AllPatientWithApp();
            	all.setId(rs.getInt(1));
            	all.setName(rs.getString(2));
            	all.setEmail(rs.getString(3));
            	all.setBloodgroup(rs.getString(4));
            	all.setSex(rs.getString(5));
            	all.setAges(rs.getInt(6));
            	if(rs.getDate(7)==null){
            		all.setDate(null);
            	}else{
            		all.setDate(new java.util.Date((rs.getDate(7).getTime()) ));
            	}

            	all.setDeptname(rs.getString(8));
                list.add(all);
            }
            ps.close();
        }
        return list;
    }
    ////////////////////
    ///////////appointment
    public List<AllAppointments> getAllAppointments() throws ClassNotFoundException, SQLException, NamingException{
        List<AllAppointments> list=new ArrayList<>();
        qry="select app.appid,p.pname, app.appdate, dept.deptname FROM app LEFT JOIN dept ON app.deptid=dept.deptid LEFT JOIN patient p ON app.pid=p.pid";
        try(Connection con=getConnect()){
            PreparedStatement ps=con.prepareStatement(qry);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	AllAppointments all=new AllAppointments();
            	all.setId(rs.getInt(1));
            	all.setName(rs.getString(2));
            	if(rs.getDate(3)==null){
            		all.setDate(null);
            	}else{
            		all.setDate(new java.util.Date((rs.getDate(3).getTime()) ));
            	}
            	all.setDeptname(rs.getString(4));

                list.add(all);
            }
            ps.close();
        }
        return list;
    }
    public List<AllAppointments> getAllAppointmentsByid(int id) throws ClassNotFoundException, SQLException, NamingException{
        List<AllAppointments> list=new ArrayList<>();
        qry="select app.appid, p.pname, app.appdate, dept.deptname FROM app LEFT JOIN dept ON app.deptid=dept.deptid LEFT JOIN patient p ON app.pid=p.pid where p.pid=?";
        try(Connection con=getConnect()){
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	AllAppointments all=new AllAppointments();
            	all.setId(rs.getInt(1));
            	all.setName(rs.getString(2));
            	if(rs.getDate(3)==null){
            		all.setDate(null);
            	}else{
            		all.setDate(new java.util.Date((rs.getDate(3).getTime()) ));
            	}
            	all.setDeptname(rs.getString(4));

                list.add(all);
            }
            ps.close();
        }
        return list;
    }
    
    public List<AllAppointments> getAllAppointments(AllDeptDoctors dept) throws ClassNotFoundException, SQLException, NamingException{
    	//parameterized one getPatients in which their name is the parameter
    	List<AllAppointments> list=new ArrayList<>();
        qry="select app.appid,p.pname, app.appdate, dept.deptname FROM app LEFT JOIN dept on app.deptid=dept.deptid LEFT JOIN patient p on app.pid=p.pid  where dept.deptname=?";
        try(Connection con=getConnect()){
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setString(1, dept.getDeptname());
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	AllAppointments all=new AllAppointments();
            	all.setId(rs.getInt(1));
            	all.setName(rs.getString(2));
            	if(rs.getDate(3)==null){
            		all.setDate(null);
            	}else{
            		all.setDate(new java.util.Date((rs.getDate(3).getTime()) ));
            	}
            	all.setDeptname(rs.getString(4));
                list.add(all);
            }
            ps.close();
        }
        return list;
    }
    public List<AllAppointments> getAllAppointments(String name) throws ClassNotFoundException, SQLException, NamingException{
    	//parameterized one getPatients in which their name is the parameter
    	List<AllAppointments> list=new ArrayList<>();
        qry="select app.appid,p.pname, app.appdate, dept.deptname FROM app LEFT JOIN dept on app.deptid=dept.deptid LEFT JOIN patient p on app.pid=p.pid  where p.pemail=?";
        try(Connection con=getConnect()){
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setString(1, name);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	AllAppointments all=new AllAppointments();
            	all.setId(rs.getInt(1));
            	all.setName(rs.getString(2));
            	if(rs.getDate(3)==null){
            		all.setDate(null);
            	}else{
            		all.setDate(new java.util.Date((rs.getDate(3).getTime()) ));
            	}
            	all.setDeptname(rs.getString(4));
                list.add(all);
            }
            ps.close();
        }
        return list;
    }
    
    
    public List<AllPatientWithApp> getAllPatientsDept(String deptname) throws ClassNotFoundException, SQLException, NamingException{
        List<AllPatientWithApp> list=new ArrayList<>();
        qry="SELECT p.pid, p.pname,p.pemail,p.pbloodgroup,p.psex, p.pages, app.appdate, dept.deptname FROM patient p LEFT JOIN app ON p.appid=app.appid LEFT JOIN dept ON app.deptid=dept.deptid where dept.deptname=?";
        try(Connection con=getConnect()){
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setString(1, deptname);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	AllPatientWithApp all=new AllPatientWithApp();
            	all.setId(rs.getInt(1));
            	all.setName(rs.getString(2));
            	all.setEmail(rs.getString(3));
            	all.setBloodgroup(rs.getString(4));
            	all.setSex(rs.getString(5));
            	all.setAges(rs.getInt(6));
            	if(rs.getDate(7)==null){
            		all.setDate(null);
            	}else{
            		all.setDate(new java.util.Date((rs.getDate(7).getTime()) ));
            	}

            	all.setDeptname(rs.getString(8));
                list.add(all);
            }
            ps.close();
        }
        return list;
    }
   
}
