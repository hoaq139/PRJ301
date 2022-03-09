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

/**
 *
 * @author win
 */
public class RoomDAO extends BaseDAO<Room>{
    public List<Room> getAllRoom(){
        List<Room> list = new ArrayList<>();
        try {
            String sql ="SELECT *FROM Room";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt(1));
                r.setName(rs.getString(2));
                r.setImage(rs.getString(3));
                r.setPrice(rs.getInt(4));
                r.setGuest(rs.getInt(5));
                r.setSquare(rs.getInt(6));
                r.setDescription(rs.getString(7));
                list.add(r);
            }
        } catch (SQLException e) {
        }
        return list;
        
    }
    
}
