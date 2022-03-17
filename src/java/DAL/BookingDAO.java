/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Room;
import model.bookingDetail;

/**
 *
 * @author win
 */
public class BookingDAO extends BaseDAO<bookingDetail> {

    public void insertBookingDetail(bookingDetail s) {
        try {
            String sql = "INSERT INTO [dbo].[Booking_Detail]\n"
                    + "           ([custID]\n"
                    + "           ,[roomID]\n"
                    + "           ,[checkin]\n"
                    + "           ,[checkout]\n"
                    + "           ,[guest]\n"
                    + "           ,[Custormer Name]\n"
                    + "           ,[Email]\n"
                    + "           ,[Telephone]\n"
                    + "           ,[Address]\n"
                    + "           ,[City]\n"
                    + "           ,[Country]\n"
                    + "           ,[Zip]\n"
                    + "           ,[total]\n"
                    + "           ,[Request])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, s.getAccount());
            statement.setInt(2, s.getRoom());
            statement.setString(3, s.getCheckin());
            statement.setString(4, s.getCheckout());
            statement.setInt(5, s.getGuest());
            statement.setString(6, s.getCustName());
            statement.setString(7, s.getEmail());
            statement.setString(8, s.getPhone());
            statement.setString(9, s.getAddress());
            statement.setString(10, s.getCity());
            statement.setString(11, s.getCountry());
            statement.setString(12, s.getZip());
            statement.setInt(13, s.getTotal());
            statement.setString(14, s.getRequested());
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List<bookingDetail> getAllDetail() {
        List<bookingDetail> list = new ArrayList<>();
        try {
            String sql = "SELECT *FROM Booking_Detail";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                bookingDetail r = new bookingDetail();
                r.setId(rs.getInt(1));
                r.setAccount(rs.getInt(2));
                r.setRoom(rs.getInt(3));
                r.setCheckin(rs.getString(4));
                r.setCheckout(rs.getString(5));
                r.setGuest(rs.getInt(6));
                r.setCustName(rs.getString(7));
                r.setEmail(rs.getString(8));
                r.setPhone(rs.getString(9));
                r.setAddress(rs.getString(10));
                r.setCity(rs.getString(11));
                r.setCountry(rs.getString(12));
                r.setZip(rs.getString(13));
                r.setTotal(rs.getInt(14));
                r.setRequested(rs.getString(15));
                
                list.add(r);
            }
        } catch (SQLException e) {
        }
        return list;

    }
    public Room getRoom(String name) {
        try {
            String sql = "SELECT  id, image, price, guest, square, description FROM Room WHERE name = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Room s = new Room();
                s.setId(rs.getInt("id"));
                s.setImage(rs.getString("image"));
                s.setPrice(rs.getInt("price"));
                s.setGuest(rs.getInt("guest"));
                s.setSquare(rs.getInt("square"));
                s.setDescription(rs.getString("description"));
                s.setName(name);
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void deleteDetail(int id) {
        try {
            String sql = "DELETE Booking_Detail WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        BookingDAO dao = new BookingDAO();
        bookingDetail a = new bookingDetail(1, 2, "1222", "111", 0, "11111111", "11", "11", "11", "11", "11", "1", 0, "11");
        dao.insertBookingDetail(a);
        List<bookingDetail> list = new ArrayList<>();
        list = dao.getAllDetail();
        for (bookingDetail detail : list) {
            System.out.println(detail);
        }
        
    }

}
