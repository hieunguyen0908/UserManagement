/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunnm.daos;

import hieunnm.dtos.RoleDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import hieunnm.util.MyConnection;

/**
 *
 * @author PC
 */
public class RoleDAO implements Serializable {

    private Connection conn = null;
    private PreparedStatement prStm = null;
    private ResultSet rs = null;

    private void closeConn() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (prStm != null) {
            prStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
    public List<RoleDTO> getAllRole() throws SQLException, NamingException{
        List<RoleDTO> listRole = new ArrayList<>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "SELECT roleID, roleName FROM tblRoles";
            prStm = conn.prepareStatement(sql);
            rs = prStm.executeQuery();
            while(rs.next()){
                RoleDTO role = new RoleDTO();
                role.setId(rs.getInt("roleID"));
                role.setName(rs.getString("roleName"));
                listRole.add(role);
            }
        } finally {
            closeConn();
        }
        return listRole;
    }
}
