package com.bean;
import java.util.Date;

public class AllPatientWithApp {
	private String name, email, bloodgroup, sex, deptname, password;
	private Date date=null;
	private int id, appid, ages;
	private AllAppointments app;
	
	public AllPatientWithApp() {
		super();
	}
	public AllPatientWithApp(int id,String name, String email, String bloodgroup, String sex, int ages, String deptname,
			Date date) {
		super();
		this.id=id;
		this.name = name;
		this.email = email;
		this.bloodgroup = bloodgroup;
		this.sex = sex;
		this.ages = ages;
		this.deptname = deptname;
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBloodgroup() {
		return bloodgroup;
	}
	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAges() {
		return ages;
	}
	public void setAges(int ages) {
		this.ages = ages;
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
		return "AllPatientWithApp [name=" + name + ", email=" + email + ", bloodgroup=" + bloodgroup + ", sex=" + sex
				+ ", ages=" + ages + ", deptname=" + deptname + ", date=" + date + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAppid() {
		return appid;
	}
	public void setAppid(int appid) {
		this.appid = appid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public AllAppointments getApp() {
		return app;
	}
	public void setApp(AllAppointments app) {
		this.app = app;
	}
	
}
