/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
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
                    + "           ([CustomerId]\n"
                    + "           ,[Custormer Name]\n"
                    + "           ,[Email]\n"
                    + "           ,[Telephone]\n"
                    + "           ,[Address]\n"
                    + "           ,[City]\n"
                    + "           ,[Country]\n"
                    + "           ,[Zip]\n"
                    + "           ,[Request]\n"
                    + "           ,[Checkin]\n"
                    + "           ,[Checkout]\n"
                    + "           ,[Guest]\n"
                    + "           ,[Room] )\n"
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
                    + "           ,? )";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, s.getA().getId());
            statement.setString(2, s.getCustName());
            statement.setString(3, s.getEmail());
            statement.setString(4, s.getPhone());
            statement.setString(5, s.getAddress());
            statement.setString(6, s.getCity());
            statement.setString(7, s.getCountry());
            statement.setString(8, s.getZip());
            statement.setString(9, s.getRequested());
            statement.setString(10, s.getB().getCheckin());
            statement.setString(11, s.getB().getCheckout());
            statement.setInt(12, s.getB().getGuest());
            statement.setString(13, s.getB().getNameRoom().getName());
           
            
            

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
