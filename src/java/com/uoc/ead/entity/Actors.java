
package com.uoc.ead.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Actors {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int actId;
    private String actorName;
    
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "movieId")
    private Movie movie;

    public int getActId() {
        return actId;
    }

    public void setActId(int actId) {
        this.actId = actId;
    }

    public String getActorName() {
        return actorName;
    }

    public void setActorName(String actorName) {
        this.actorName = actorName;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }
    
    
}
