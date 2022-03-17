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
public class bookingDetail {
    private int id;
    private int account;
    private int room;
    private String checkin;
    private String checkout;
    private int guest;
    private String custName;
    private String email;
    private String phone;
    private String address;
    private String city;
    private String country;
    private String zip;
    private String requested;
    private int total;

    public bookingDetail() {
    }

    public bookingDetail(int id, int account, int room, String checkin, String checkout, int guest, String custName, String email, String phone, String address, String city, String country, String zip, String requested, int total) {
        this.id = id;
        this.account = account;
        this.room = room;
        this.checkin = checkin;
        this.checkout = checkout;
        this.guest = guest;
        this.custName = custName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.city = city;
        this.country = country;
        this.zip = zip;
        this.requested = requested;
        this.total = total;
    }

    public bookingDetail(int account, int room, String checkin, String checkout, int guest, String custName, String email, String phone, String address, String city, String country, String zip, int total, String requested) {
        this.account = account;
        this.room = room;
        this.checkin = checkin;
        this.checkout = checkout;
        this.guest = guest;
        this.custName = custName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.city = city;
        this.country = country;
        this.zip = zip;
        this.requested = requested;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccount() {
        return account;
    }

    public void setAccount(int account) {
        this.account = account;
    }

    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
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

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getRequested() {
        return requested;
    }

    public void setRequested(String requested) {
        this.requested = requested;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "bookingDetail{" + "id=" + id + ", account=" + account + ", room=" + room + ", checkin=" + checkin + ", checkout=" + checkout + ", guest=" + guest + ", custName=" + custName + ", email=" + email + ", phone=" + phone + ", address=" + address + ", city=" + city + ", country=" + country + ", zip=" + zip + ", requested=" + requested + ", total=" + total + '}';
    }

    
   
}

