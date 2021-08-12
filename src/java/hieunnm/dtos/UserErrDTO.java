/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunnm.dtos;

/**
 *
 * @author PC
 */
public class UserErrDTO {

    private String userIDError;
    private String passwordError;
    private String confirmPasswordError;
    private String fullNameError;
    private String imageError;

    public UserErrDTO() {
    }

    public UserErrDTO(String userIDError) {
        this.userIDError = userIDError;
    }

    public UserErrDTO(String userIDError, String passwordError, String confirmPasswordError, String fullNameError, String imageError) {
        this.userIDError = userIDError;
        this.passwordError = passwordError;
        this.confirmPasswordError = confirmPasswordError;
        this.fullNameError = fullNameError;
        this.imageError = imageError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmPasswordError() {
        return confirmPasswordError;
    }

    public void setConfirmPasswordError(String confirmPasswordError) {
        this.confirmPasswordError = confirmPasswordError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    
}
