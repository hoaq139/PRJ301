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
import model.Room;
import model.Services;

/**
 *
 * @author win
 */
public class ServicesDAO extends BaseDAO<Services> {
    public List<Services> getAllService(){
        List<Services> list = new ArrayList<>();
        try {
            String sql ="SELECT *FROM services";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Services s = new Services();
                s.setId(rs.getInt(1));
                s.setName(rs.getString(2));
                s.setPrice(rs.getInt(3));
                list.add(s);
            }
        } catch (SQLException e) {
        }
        return list;
        
    }
    public static void main(String[] args) {
        ServicesDAO dao = new ServicesDAO();
        List<Services> s = dao.getAllService();
        for (Services services : s) {
            System.out.println(services);
        }
        
    }
    
}
