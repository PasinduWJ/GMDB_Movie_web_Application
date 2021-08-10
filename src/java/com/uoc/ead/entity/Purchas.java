
package com.uoc.ead.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author PASINDU-PC
 */
@Entity
public class Purchas implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) 
    private int purId;
    
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date purchDate;
    
    @ManyToOne(fetch = FetchType.EAGER)                                                  //eager
    @JoinColumn(name = "movieId")
    private Movie movie;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userName" )
    private UserDetails userDetails;

    @OneToMany(mappedBy = "purchas",cascade = CascadeType.REMOVE)
    private Collection<UserRate> userRate = new ArrayList();
    
    public Purchas() {
    }

    public Purchas(Movie movie, UserDetails userDetails) {
        this.movie = movie;
        this.userDetails = userDetails;
    }

    
    public int getPurId() {
        return purId;
    }

    public void setPurId(int purId) {
        this.purId = purId;
    }

    public Date getPurchDate() {
        return purchDate;
    }

    public void setPurchDate(Date purchDate) {
        this.purchDate = purchDate;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public UserDetails getUserDetails() {
        return userDetails;
    }

    public void setUserDetails(UserDetails userDetails) {
        this.userDetails = userDetails;
    }

    public Collection<UserRate> getUserRate() {
        return userRate;
    }

    public void setUserRate(Collection<UserRate> userRate) {
        this.userRate = userRate;
    }

}
