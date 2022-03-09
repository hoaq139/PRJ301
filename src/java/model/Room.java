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
public class Room {
    private int id;
    private String name;
    private String image;
    private int price;
    private int guest;
    private int square;
    private String description;

    public Room() {
    }

    public Room(int id, String name, String image, int price, int guest, int square, String description) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.guest = guest;
        this.square = square;
        this.description = description;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getGuest() {
        return guest;
    }

    public void setGuest(int guest) {
        this.guest = guest;
    }

    public int getSquare() {
        return square;
    }

    public void setSquare(int square) {
        this.square = square;
    }

    @Override
    public String toString() {
        return "Room{" + "id=" + id + ", name=" + name + ", image=" + image + ", price=" + price + ", guest=" + guest + ", square=" + square + ", description=" + description + '}';
    }
    
    
   
    
}
