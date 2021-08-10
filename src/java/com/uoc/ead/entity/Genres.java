
package com.uoc.ead.entity;

import java.io.Serializable;
import javax.persistence.Entity;

import javax.persistence.Id;


@Entity
public class Genres implements Serializable {
    
    @Id
    private int genId;
    private String genre;

 
    public Genres(String genre) {
        this.genre = genre;
    }

    public Genres() {
    }

    public int getGenId() {
        return genId;
    }

    public void setGenId(int genId) {
        this.genId = genId;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

}
