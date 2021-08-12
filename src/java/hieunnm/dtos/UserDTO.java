/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunnm.dtos;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author PC
 */
public class UserDTO implements Serializable {

    private String id;
    private String password;
    private String fullName;
    private Date createDate;
    private RoleDTO role;
    private String status;
    private int roleID;
    private String image;
    private String gender;

    public UserDTO() {
    }

    public UserDTO(String id, String password, String fullName, Date createDate, RoleDTO role, String status, int roleID, String image, String gender) {
        this.id = id;
        this.password = password;
        this.fullName = fullName;
        this.createDate = createDate;
        this.role = role;
        this.status = status;
        this.roleID = roleID;
        this.image = image;
        this.gender = gender;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public RoleDTO getRole() {
        return role;
    }

    public void setRole(RoleDTO role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "id=" + id + ", password=" + password + ", fullName=" + fullName + ", createDate=" + createDate + ", role=" + role + ", status=" + status + ", roleID=" + roleID + ", image=" + image + ", gender=" + gender + '}';
    }

    





    
    

    

}
