package com.rbnelite.udyogvishwa.dao;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Intrest_areasDao {
    @Id
    private Integer g_id;
    private String user_mail;
    private String group_name;

    public Integer getG_id() {
        return g_id;
    }

    public void setG_id(Integer g_id) {
        this.g_id = g_id;
    }

    public String getUser_mail() {
        return user_mail;
    }

    public void setUser_mail(String user_mail) {
        this.user_mail = user_mail;
    }

    public String getGroup_name() {
        return group_name;
    }

    public void setGroup_name(String group_name) {
        this.group_name = group_name;
    }
    
   
}
