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
public class Admin {
    private String adminuser;
    private String adminpass;

    public Admin(String adminuser, String adminpass) {
        this.adminuser = adminuser;
        this.adminpass = adminpass;
    }

    public String getAdminuser() {
        return adminuser;
    }

    public void setAdminuser(String adminuser) {
        this.adminuser = adminuser;
    }

    public String getAdminpass() {
        return adminpass;
    }

    public void setAdminpass(String adminpass) {
        this.adminpass = adminpass;
    }

    @Override
    public String toString() {
        return "Admin{" + "adminuser=" + adminuser + ", adminpass=" + adminpass + '}';
    }
    
}
