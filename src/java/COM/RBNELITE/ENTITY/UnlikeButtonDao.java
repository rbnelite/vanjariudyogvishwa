/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package COM.RBNELITE.ENTITY;

/**
 *
 * @author RBNelite
 */
public class UnlikeButtonDao {
    
    private int unlike_id;
    private int count;
    private String names;
    private String Status_id;

    public int getUnlike_id() {
        return unlike_id;
    }

    public void setUnlike_id(int unlike_id) {
        this.unlike_id = unlike_id;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public String getStatus_id() {
        return Status_id;
    }

    public void setStatus_id(String Status_id) {
        this.Status_id = Status_id;
    }
    
}
