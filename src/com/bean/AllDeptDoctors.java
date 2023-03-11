/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import java.util.List;

/**
 *
 * @author user
 */
public class AllDeptDoctors {
    private String  deptname;
    private int deptid,count;
    private List<DeptDoctors> deptDoctors;

    public AllDeptDoctors() {
    }

    public AllDeptDoctors(String deptname, int deptid, int count, List<DeptDoctors> deptDoctors) {
        this.deptname = deptname;
        this.deptid = deptid;
        this.count = count;
        this.deptDoctors = deptDoctors;
    }

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname;
    }

    public int getDeptid() {
        return deptid;
    }

    public void setDeptid(int deptid) {
        this.deptid = deptid;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<DeptDoctors> getDeptDoctors() {
        return deptDoctors;
    }

    public void setDeptDoctors(List<DeptDoctors> deptDoctors) {
        this.deptDoctors = deptDoctors;
    }

    @Override
    public String toString() {
        return "AllDeptDoctors{" + "deptname=" + deptname + ", deptid=" + deptid + ", count=" + count + ", deptDoctors=" + deptDoctors + '}';
    }
    
    
}
