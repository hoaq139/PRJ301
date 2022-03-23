/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author win
 */
public class Account {
    private int id;
    private String user;
    private String pass;
    private String email;

    public Account() {
    }

    public Account(int id, String user, String pass, String email) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.email = email;
    }

    public Account(String user, String pass, String email) {
        this.user = user;
        this.pass = pass;
        this.email = email;
    }

    public Account(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", user=" + user + ", pass=" + pass + ", email=" + email + '}';
    }
    
}
