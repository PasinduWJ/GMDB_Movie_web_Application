
package com.uoc.ead.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Target;


@Entity
public class Movie implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) 
    private int movieId;
    private String movieName, runTime;
    private double price;

    @OneToMany(mappedBy = "movie", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Collection<Directors> director = new ArrayList();
    
    @ManyToMany(fetch = FetchType.EAGER)
    private Collection<Genres> genre = new ArrayList();
    
    @OneToMany(mappedBy = "movie", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Collection<Actors> actor = new ArrayList();

    @OneToMany(mappedBy = "movie",cascade = CascadeType.ALL)
    private Collection<Purchas> pruchas = new ArrayList();
    
    @OneToOne(mappedBy = "movie",fetch = FetchType.EAGER,cascade = CascadeType.REMOVE)
    private Rate rate;
    
    public Movie() {
    }

    
    public Movie(String movieName, String runTime) {
        this.movieName = movieName;
        this.runTime = runTime;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getRunTime() {
        return runTime;
    }

    public void setRunTime(String runTime) {
        this.runTime = runTime;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Collection<Directors> getDirector() {
        return director;
    }

    public void setDirector(Collection<Directors> director) {
        this.director = director;
    }

    public Collection<Genres> getGenre() {
        return genre;
    }

    public void setGenre(Collection<Genres> genre) {
        this.genre = genre;
    }

    public Collection<Actors> getActor() {
        return actor;
    }

    public void setActor(Collection<Actors> actor) {
        this.actor = actor;
    }

    public Collection<Purchas> getPruchas() {
        return pruchas;
    }

    public void setPruchas(Collection<Purchas> pruchas) {
        this.pruchas = pruchas;
    }

    public Rate getRate() {
        return rate;
    }

    public void setRate(Rate rate) {
        this.rate = rate;
    }

   
}
