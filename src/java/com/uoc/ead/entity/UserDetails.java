
package com.uoc.ead.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class UserDetails implements Serializable {

    @Id
    private String userName;
    private String email;
    private int age;
    
    @Column(nullable = false)
    private String password;

    @OneToMany(mappedBy = "userDetails", fetch = FetchType.EAGER)
    private Collection<Purchas> purchases = new ArrayList();

    public UserDetails() {
    }

    public UserDetails(String userName, String email, int age, String password) {
        this.email = email;
        this.age = age;
        this.password = password;
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Collection<Purchas> getPurchases() {
        return purchases;
    }

    public void setPurchases(Collection<Purchas> purchases) {
        this.purchases = purchases;
    }

    
}
