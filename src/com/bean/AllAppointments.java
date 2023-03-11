package com.bean;

import java.util.Date;

public class AllAppointments {
	
	private int id, pid, deptid;
	private String name, deptname;
	private Date date;
	public AllAppointments() {
		super();
	}
	public AllAppointments(int id, String name, String deptname, Date date) {
		super();
		this.id = id;
		this.name = name;
		this.deptname = deptname;
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "AllAppointments [id=" + id + ", name=" + name + ", deptname=" + deptname + ", date=" + date + "]";
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getDeptid() {
		return deptid;
	}
	public void setDeptid(int deptid) {
		this.deptid = deptid;
	}
	
}
