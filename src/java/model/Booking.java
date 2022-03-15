/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author win
 */
public class Booking {
    private int id;
    private String checkin;
    private String checkout;
    private int guest;
    private Room nameRoom;
    private Services nameServices;

    public Booking() {
    }

    public Booking(int id, String checkin, String checkout, int guest, Room nameRoom, Services nameServices) {
        this.id = id;
        this.checkin = checkin;
        this.checkout = checkout;
        this.guest = guest;
        this.nameRoom = nameRoom;
        this.nameServices = nameServices;
    }

    public Booking(String checkin, String checkout, int guest, Room nameRoom, Services nameServices) {
        this.checkin = checkin;
        this.checkout = checkout;
        this.guest = guest;
        this.nameRoom = nameRoom;
        this.nameServices = nameServices;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCheckin() {
        return checkin;
    }

    public void setCheckin(String checkin) {
        this.checkin = checkin;
    }

    public String getCheckout() {
        return checkout;
    }

    public void setCheckout(String checkout) {
        this.checkout = checkout;
    }

    public int getGuest() {
        return guest;
    }

    public void setGuest(int guest) {
        this.guest = guest;
    }

    

    public Room getNameRoom() {
        return nameRoom;
    }

    public void setNameRoom(Room nameRoom) {
        this.nameRoom = nameRoom;
    }

    public Services getNameServices() {
        return nameServices;
    }

    public void setNameServices(Services nameServices) {
        this.nameServices = nameServices;
    }
    
}
