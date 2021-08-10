
package com.uoc.ead.entity;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Directors implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int directorId;
    private String directorName;
    
    @ManyToOne
    @JoinColumn(name = "movieId")
    private Movie movie;

    public Directors() {
    }

    
    public int getDirectorId() {
        return directorId;
    }

    public void setDirectorId(int directorId) {
        this.directorId = directorId;
    }

    public String getDirectorName() {
        return directorName;
    }

    public void setDirectorName(String directorName) {
        this.directorName = directorName;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

  

}
