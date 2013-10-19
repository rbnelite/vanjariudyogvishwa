/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package COM.RBNELITE.ENTITY;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author RBNelite
 */
@Entity
public class I_needDao {
    @Id
    private int id;
    private String need;
    private String description;
    private String mno;
    private String user_mail;
    
    public String getUser_mail() {
        return user_mail;
    }

    public void setUser_mail(String user_mail) {
        this.user_mail = user_mail;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNeed() {
        return need;
    }

    public void setNeed(String need) {
        this.need = need;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMno() {
        return mno;
    }

    public void setMno(String mno) {
        this.mno = mno;
    }
    
    
}
