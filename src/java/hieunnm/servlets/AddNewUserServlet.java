/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunnm.servlets;

import hieunnm.daos.UserDAO;
import hieunnm.dtos.UserDTO;
import hieunnm.dtos.UserErrDTO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import javax.imageio.ImageIO;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author PC
 */
@WebServlet(name = "AddNewUserServlet", urlPatterns = {"/AddNewUserServlet"})
public class AddNewUserServlet extends HttpServlet {

//    Pattern idPattern = Pattern.compile("[A-Za-z0-9]{2,30}");
//    Pattern titlePattern = Pattern.compile("^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀẾỂưăạảấầẩẫậắằẳẵặẹẻẽềếểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s.]{1,100}$");
//    Pattern authorPattern = Pattern.compile("^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀẾỂưăạảấầẩẫậắằẳẵặẹẻẽềếểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s.]{3,50}$");
//    Pattern describePattern = Pattern.compile("^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀẾỂưăạảấầẩẫậắằẳẵặẹẻẽềếểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s.]{0,300}$");
//    Pattern numberPattern = Pattern.compile("[0-9]{0,20}");
    private static final String SEARCH_PAGE = "search.jsp";
    private static final String ERROR_PAGE = "error.jsp";
    private static final String DEFAULT_PROFILE_URL = "https://s3.thingpic.com/images/h1/JKjg4CXNhZt2t3v4QMFbRABP.png";
    private static final Logger LOGGER = Logger.getLogger(AddNewUserServlet.class);

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR_PAGE;
        UserErrDTO userError = new UserErrDTO("");
        try {
            String userID = request.getParameter("txtUserID");
            String password = request.getParameter("txtPassword");
            String confirmPassword = request.getParameter("txtConfirmPassword");
            String fullName = request.getParameter("txtFullName");
            String gender = request.getParameter("radioGenderOptions"); // Can be null, "Male" or "Female"
            if ("Male".equals(gender)) {
                // Male selected
                gender = "Male";
            } else if ("Female".equals(gender)) {
                // Female selected
                gender = "Female";
            }
            int defaultRoleID = 2;          // roleName = "user"
            String profileURL = request.getParameter("txtProfileURL");
            Date createDate = Date.valueOf(LocalDate.now());
            String defaultStatus = "active";
            if (profileURL.trim().isBlank()) {
//                profileURL = "NULL";
                profileURL = DEFAULT_PROFILE_URL;
            } else {
                if (!isImage(profileURL)) { // Neu anh khong hop le thi tra ve NULL
//                    profileURL = "NULL";
                    profileURL = DEFAULT_PROFILE_URL;

                } else { // Nguoc lai hop le thi luu vao database
                }
            }

            UserDAO userDao = new UserDAO();
            UserDTO user = new UserDTO();
            user.setId(userID);
            user.setPassword(password);
            user.setFullName(fullName);
            user.setGender(gender);
            user.setStatus(defaultStatus);
            user.setRoleID(defaultRoleID);
            user.setCreateDate(createDate);
            user.setImage(profileURL);
            boolean result = userDao.insertNew(user);
            if (result) {
                request.setAttribute("MSG_SUCCESS", "Add new user successfull");
            } else {
                request.setAttribute("MSG_ERROR", userError);
//                request.setAttribute("MSG_ERROR", "Add new user failed");
            }

            url = SEARCH_PAGE;

        } catch (SQLException | NamingException | NumberFormatException ex) {
            if (ex.toString().contains("duplicate")) {
                url = SEARCH_PAGE;
                userError.setUserIDError("UserID duplicate!");
                request.setAttribute("MSG_ERROR", userError);
            } else {
                LOGGER.error(ex.getMessage());
                request.setAttribute("ERROR", "Some thing was wrong");
                url = ERROR_PAGE;
            }
//            ex.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    private static boolean isImage(String url) {
        try {
            BufferedImage image = ImageIO.read(new URL(url));
            //BufferedImage image = ImageIO.read(new URL("http://someimage.jpg"));  
            if (image != null) {
                return true;
            } else {
                return false;
            }

        } catch (MalformedURLException e) {
//            System.err.println("URL error with image");
//            e.printStackTrace();
            return false;
        } catch (IOException e) {
//            System.err.println("IO error with image");
//            e.printStackTrace();
            return false;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(AddNewUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            java.util.logging.Logger.getLogger(AddNewUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(AddNewUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            java.util.logging.Logger.getLogger(AddNewUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
