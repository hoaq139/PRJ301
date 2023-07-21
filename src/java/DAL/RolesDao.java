/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Roles;


/**
 *
 * @author hoangdinh
 */
public class RolesDao extends BaseDAO<Roles>{
    public ArrayList<Roles> getAllRole(){
        try {
            String sql = "SELECT *  FROM Role  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Roles> list = new ArrayList<>();
            while(rs.next()){
                Roles roles= new Roles();
                roles.setId(rs.getInt("Id"));
                
                roles.setName(rs.getString("Name"));
                list.add(roles);
                
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(RolesDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
