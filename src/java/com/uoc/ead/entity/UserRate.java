
package com.uoc.ead.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author PASINDU-PC
 */
@Entity
public class UserRate implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) 
    private int id;
    
    private int rate;
    
    @ManyToOne
    @JoinColumn(name = "purId")
    private Purchas purchas;
    
    
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date rateDate;
    private String title, discription;

    public UserRate() {
    }

    public UserRate(int rate, String title, String discription) {
        this.rate = rate;
        this.title = title;
        this.discription = discription;
    }

    
   

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public Date getRateDate() {
        return rateDate;
    }

    public void setRateDate(Date rateDate) {
        this.rateDate = rateDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Purchas getPurchas() {
        return purchas;
    }

    public void setPurchas(Purchas purchas) {
        this.purchas = purchas;
    }

}
