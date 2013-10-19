/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package COM.RBNELITE.ENTITY;

/**
 *
 * @author RBNelite
 */
public class Frnd_requestDao {
    private Integer frnd_req_id;
    private String req_from;
    private String req_to;
    private String req_status;
    private String req_date;

    public Integer getFrnd_req_id() {
        return frnd_req_id;
    }

    public void setFrnd_req_id(Integer frnd_req_id) {
        this.frnd_req_id = frnd_req_id;
    }

    public String getReq_from() {
        return req_from;
    }

    public void setReq_from(String req_from) {
        this.req_from = req_from;
    }

    public String getReq_to() {
        return req_to;
    }

    public void setReq_to(String req_to) {
        this.req_to = req_to;
    }

    public String getReq_status() {
        return req_status;
    }

    public void setReq_status(String req_status) {
        this.req_status = req_status;
    }

    public String getReq_date() {
        return req_date;
    }

    public void setReq_date(String req_date) {
        this.req_date = req_date;
    }
    
}
