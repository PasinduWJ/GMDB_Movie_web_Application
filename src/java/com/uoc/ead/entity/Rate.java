
package com.uoc.ead.entity;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

/**
 *
 * @author PASINDU-PC
 */
@Entity
public class Rate implements Serializable {
    
    @Id
    @OneToOne
    @JoinColumn(name = "movieId")
    private Movie movie;

    private double rate;
    private long userCount;

    public Rate() {
    }

    public Rate(Movie movie, double rate) {
        this.movie = movie;
        this.rate = rate;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public long getUserCount() {
        return userCount;
    }

    public void setUserCount(long userCount) {
        this.userCount = userCount;
    }
    
    
}
