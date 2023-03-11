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
public class Feedback {
    private String name, comment;
    private int id;

    public Feedback() {
    }

    public Feedback(int id,String name, String comment) {
    	this.setId(id);
        this.name = name;
        this.comment = comment;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Feedback [name=" + name + ", comment=" + comment + ", id=" + id + "]";
	}
    
}
