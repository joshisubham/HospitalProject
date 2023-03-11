/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

/**
 *
 * @author user
 */
public class DeptDoctors {
    private String name, phone, email, password, deptname;
    private int id, deptid;

    public DeptDoctors() {
    }

    public DeptDoctors(String name, String phone, String email, int id) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.setId(id);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "DeptDoctors{" + "name=" + name + ", phone=" + phone + ", email=" + email + '}';
    }

	public int getId() {
		return id;
	}

	public void setId(int did) {
		this.id = did;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getDeptid() {
		return deptid;
	}

	public void setDeptid(int deptid) {
		this.deptid = deptid;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

    
    
}
