/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editou.
 */
package hieunnm.daos;

import hieunnm.dtos.AdminDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import hieunnm.dtos.RoleDTO;
import hieunnm.dtos.UserDTO;
import hieunnm.util.MyConnection;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.sql.Types;

/**
 *
 * @author PC
 */
public class UserDAO implements Serializable {

    private Connection conn = null;
    private PreparedStatement prStm = null;
    private ResultSet rs = null;

    private void closeConn() {
        try {

            if (rs != null) {
                rs.close();
            }
            if (prStm != null) {
                prStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
        }
    }

    public UserDTO checkLogin(String id, String password) throws NamingException, SQLException, NoSuchAlgorithmException {
        UserDTO user = null;
        try {
            conn = MyConnection.getMyConnection();
            if (conn != null) {
                String sql = "SELECT u.userID, u.fullName, r.roleName AS roleName FROM dbo.tblUsers AS u JOIN dbo.tblRoles AS r ON r.roleID = u.roleID "
                        + "WHERE u.userID = ? AND u.password = ? AND u.status = 'active'";
                prStm = conn.prepareStatement(sql);
                prStm.setString(1, id);
                prStm.setNString(2, password);
                rs = prStm.executeQuery();
                if (rs.next()) {
                    user = new UserDTO();
                    user.setId(rs.getString("userID"));
                    user.setFullName(rs.getString("fullName"));
                    user.setRole(new RoleDTO(rs.getString("roleName")));
                }
            }
        } finally {
            closeConn();
        }
        return user;
    }

    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            if (conn != null) {
                String sql = "Select userID "
                        + " FROM tblUsers "
                        + " Where userID=?";
                prStm = conn.prepareStatement(sql);
                prStm.setString(1, userID.toLowerCase());
                rs = prStm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {

        } finally {
            closeConn();
        }
        return check;
    }

    public boolean insertNew(UserDTO user) throws SQLException, ClassNotFoundException, NamingException, NoSuchAlgorithmException {
        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblUsers(userID, fullName, password, roleID, "
                        + "createDate, status, image, gender) "
                        + " VALUES(?,?,?,?,?,?,?,?)"; // Default roleID = 2 <--> User
                prStm = conn.prepareStatement(sql);
                prStm.setString(1, user.getId().toLowerCase());
                prStm.setNString(2, user.getFullName());

                // SHA-256 hashing password
                String passwordToHash = user.getPassword(); // default password
                String generatedPassword = null; // password before hashing
                generatedPassword = toHexString(getSHA(passwordToHash));
                prStm.setNString(3, generatedPassword);
                // SHA-256 hashing password

                prStm.setInt(4, user.getRoleID());
                prStm.setDate(5, (Date) user.getCreateDate());
                prStm.setString(6, user.getStatus());
//                if (user.getImage() == "NULL") {
//                    prStm.setNull(7, Types.NULL);
//                } else {
//                    prStm.setString(7, user.getImage());
//                }
                prStm.setString(7, user.getImage());
                prStm.setString(8, user.getGender());

                prStm.executeUpdate();
            }
        } finally {
            closeConn();
        }
        return check;
    }

    public List<AdminDTO> searchAdmin(String name) throws SQLException, NamingException { // Search admin
        List<AdminDTO> listAdmin = new ArrayList<>();
        try {
            conn = MyConnection.getMyConnection();
            //search user by name
            String sql = "SELECT u.userID, u.password, u.fullName ,u.roleID ,u.createDate, u.status, u.image, u.gender, r.roleName AS roleName FROM dbo.tblUsers AS u JOIN dbo.tblRoles AS r ON r.roleID = u.roleID "
                    + "WHERE (u.fullName LIKE ? COLLATE Latin1_General_CI_AI) AND u.image IS NOT NULL AND u.roleID = 1 " // Dang test image = NULL
                    + "ORDER BY u.fullName";
            prStm = conn.prepareStatement(sql);
            prStm.setNString(1, "%" + name + "%");
            rs = prStm.executeQuery();
            while (rs.next()) {
                AdminDTO user = new AdminDTO();
                user.setId(rs.getString("userID"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getNString("fullName"));
                user.setRole(new RoleDTO(rs.getString("roleName")));
                user.setCreateDate(rs.getDate("createDate"));
                user.setStatus(rs.getString("status"));
                user.setImage(rs.getString("image"));
                user.setGender(rs.getString("gender"));
                listAdmin.add(user);
            }
        } finally {
            closeConn();
        }
        return listAdmin;
    }

    public List<UserDTO> searchAll(String name) throws SQLException, NamingException { // Search all 
        List<UserDTO> listAllUser = new ArrayList<>();
        try {
            conn = MyConnection.getMyConnection();
            //search user by name
            String sql = "SELECT u.userID, u.password, u.fullName ,u.roleID ,u.createDate, u.status, u.image, u.gender, r.roleName AS roleName FROM dbo.tblUsers AS u JOIN dbo.tblRoles AS r ON r.roleID = u.roleID "
                    + "WHERE (u.fullName LIKE ? COLLATE Latin1_General_CI_AI) AND u.image IS NOT NULL AND u.roleID IS NOT NULL " // Dang test image = NULL
                    + "ORDER BY u.fullName";
            prStm = conn.prepareStatement(sql);
            prStm.setNString(1, "%" + name + "%");
            rs = prStm.executeQuery();
            while (rs.next()) {
                UserDTO user = new UserDTO();
                user.setId(rs.getString("userID"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getNString("fullName"));
                user.setRole(new RoleDTO(rs.getString("roleName")));
                user.setCreateDate(rs.getDate("createDate"));
                user.setStatus(rs.getString("status"));
                user.setImage(rs.getString("image"));
                user.setGender(rs.getString("gender"));
                listAllUser.add(user);
            }
        } finally {
            closeConn();
        }
        return listAllUser;
    }

    public List<UserDTO> searchUser(String name) throws SQLException, NamingException { // Search user
        List<UserDTO> listUser = new ArrayList<>();
        try {
            conn = MyConnection.getMyConnection();
            //search user by name
            String sql = "SELECT u.userID, u.password, u.fullName ,u.roleID ,u.createDate, u.status, u.image, u.gender, r.roleName AS roleName FROM dbo.tblUsers AS u JOIN dbo.tblRoles AS r ON r.roleID = u.roleID "
                    + "WHERE (u.fullName LIKE ? COLLATE Latin1_General_CI_AI) AND u.image IS NOT NULL AND u.roleID = 2 " // Dang test image = NULL
                    + "ORDER BY u.fullName";
            prStm = conn.prepareStatement(sql);
            prStm.setNString(1, "%" + name + "%");
            rs = prStm.executeQuery();
            while (rs.next()) {
                UserDTO user = new UserDTO();
                user.setId(rs.getString("userID"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getNString("fullName"));
                user.setRole(new RoleDTO(rs.getString("roleName")));
                user.setCreateDate(rs.getDate("createDate"));
                user.setStatus(rs.getString("status"));
                user.setImage(rs.getString("image"));
                user.setGender(rs.getString("gender"));
                listUser.add(user);
            }
        } finally {
            closeConn();
        }
        return listUser;
    }

    public boolean setAccountInactive(String userID) throws SQLException {
        try {
            conn = MyConnection.getMyConnection();
            if (conn != null) {
                String sql = "update tblUsers set status = ? where userID = ? AND status = 'active'";
                prStm = conn.prepareStatement(sql);
                prStm.setString(1, "inactive");
                prStm.setString(2, userID);
                int rowEffect = prStm.executeUpdate();
                if (rowEffect > 0) {
                    return true;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConn();
        }
        return false;
    }

    public boolean setAccountActive(String userID) throws SQLException {
        try {
            conn = MyConnection.getMyConnection();
            if (conn != null) {
                String sql = "update tblUsers set status = ? where userID = ? AND status = 'inactive'";
                prStm = conn.prepareStatement(sql);
                prStm.setString(1, "active");
                prStm.setString(2, userID);
                int rowEffect = prStm.executeUpdate();
                System.out.println(rowEffect);
                if (rowEffect > 0) {
                    return true;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConn();
        }
        return false;
    }

    public boolean checkAccountStatus(String userID) throws SQLException {
        try {
            conn = MyConnection.getMyConnection();
            if (conn != null) {
                String sql = "select userID, status from tblUsers where userID = ? AND status = 'active'";
                prStm = conn.prepareStatement(sql);
                prStm.setString(1, userID);
                rs = prStm.executeQuery();
                if (rs.next()) {
                    return true;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConn();
        }
        return false;
    }

    public static byte[] getSHA(String input) throws NoSuchAlgorithmException {
        // Static getInstance method is called with hashing SHA 
        MessageDigest md = MessageDigest.getInstance("SHA-256");

        // digest() method called 
        // to calculate message digest of an input 
        // and return array of byte
        return md.digest(input.getBytes(StandardCharsets.UTF_8));
    }

    public static String toHexString(byte[] hash) {
        // Convert byte array into signum representation 
        BigInteger number = new BigInteger(1, hash);

        // Convert message digest into hex value 
        StringBuilder hexString = new StringBuilder(number.toString(16));

        // Pad with leading zeros
        while (hexString.length() < 32) {
            hexString.insert(0, '0');
        }

        return hexString.toString();
    }

    public boolean update(UserDTO user) throws SQLException, NamingException {
        try {
            conn = MyConnection.getMyConnection();
            String sql = "UPDATE dbo.tblUsers SET fullName = ?, gender = ?, roleID = ?, status = ?, image = ? WHERE userID = ?";
            prStm = conn.prepareStatement(sql);
            prStm.setNString(1, user.getFullName());
            prStm.setString(2, user.getGender());
            prStm.setInt(3, user.getRoleID());
            prStm.setString(4, user.getStatus());
            prStm.setString(5, user.getImage());
            prStm.setString(6, user.getId());

            int rowEffect = prStm.executeUpdate();
            if (rowEffect > 0) {
                return true;
            }
        } finally {
            closeConn();
        }
        return false;
    }

}
