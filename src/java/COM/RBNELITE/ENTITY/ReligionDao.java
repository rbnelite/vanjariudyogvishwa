/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package COM.RBNELITE.ENTITY;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author RBNElite
 */
@Entity
public class ReligionDao 
{
    @Id
    private Long Id;
    private String religion;
    private String cast;
    private String mthr_tng;
    private String native_place;
    private String user_mail;

    public String getUser_mail() {
        return user_mail;
    }

    public void setUser_mail(String user_mail) {
        this.user_mail = user_mail;
    }
    
    public Long getId() {
        return Id;
    }

    public void setId(Long Id) {
        this.Id = Id;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getCast() {
        return cast;
    }

    public void setCast(String cast) {
        this.cast = cast;
    }

  

    public String getMthr_tng() {
        return mthr_tng;
    }

    public void setMthr_tng(String mthr_tng) {
        this.mthr_tng = mthr_tng;
    }

    public String getNative_place() {
        return native_place;
    }

    public void setNative_place(String native_place) {
        this.native_place = native_place;
    }

}