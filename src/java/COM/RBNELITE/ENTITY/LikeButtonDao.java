/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package COM.RBNELITE.ENTITY;

/**
 *
 * @author RBNelite
 */
public class LikeButtonDao {
    
    private Long like_id;
    private Integer like_count;
    private String Names;
    private String status_id;

    public Long getLike_id() {
        return like_id;
    }

    public void setLike_id(Long like_id) {
        this.like_id = like_id;
    }

    public Integer getLike_count() {
        return like_count;
    }

    public void setLike_count(Integer like_count) {
        this.like_count = like_count;
    }

    public String getNames() {
        return Names;
    }

    public void setNames(String Names) {
        this.Names = Names;
    }

    public String getStatus_id() {
        return status_id;
    }

    public void setStatus_id(String status_id) {
        this.status_id = status_id;
    }
    
}
