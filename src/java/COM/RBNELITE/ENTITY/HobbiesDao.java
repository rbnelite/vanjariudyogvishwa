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
public class HobbiesDao {
    @Id
    private Long Id;
    private String hobbies;
    private String music;
    private String books;
    private String dress;
    private String tv;
    private String pref_movies;
    private String fav_movies;
    private String sports;
   // private String cusine;
    private String food;
    private String vacation;
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

    public String getHobbies() {
        return hobbies;
    }

    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }

    public String getMusic() {
        return music;
    }

    public void setMusic(String music) {
        this.music = music;
    }

    public String getBooks() {
        return books;
    }

    public void setBooks(String books) {
        this.books = books;
    }

    public String getDress() {
        return dress;
    }

    public void setDress(String dress) {
        this.dress = dress;
    }

    public String getTv() {
        return tv;
    }

    public void setTv(String tv) {
        this.tv = tv;
    }

    public String getPref_movies() {
        return pref_movies;
    }

    public void setPref_movies(String pref_movies) {
        this.pref_movies = pref_movies;
    }

    public String getFav_movies() {
        return fav_movies;
    }

    public void setFav_movies(String fav_movies) {
        this.fav_movies = fav_movies;
    }

    public String getSports() {
        return sports;
    }

    public void setSports(String sports) {
        this.sports = sports;
    }

   

    public String getFood() {
        return food;
    }

    public void setFood(String food) {
        this.food = food;
    }

    public String getVacation() {
        return vacation;
    }

    public void setVacation(String vacation) {
        this.vacation = vacation;
    }
    
}
