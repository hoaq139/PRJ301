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
public class Services {

  
    
    private int id;
    private String name;
    private int price;
    private String time;

    public Services() {
    }

    public Services(int id, String name, int price, String time) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.time = time;
    }

    public Services(String name, int price, String time) {
        this.name = name;
        this.price = price;
        this.time = time;
    }

    

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Services{" + "id=" + id + ", name=" + name + ", price=" + price + ", time=" + time + '}';
    }
    
}
