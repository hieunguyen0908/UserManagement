/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hieunnm.servlets;

import hieunnm.daos.RoleDAO;
import hieunnm.daos.UserDAO;
import hieunnm.dtos.RoleDTO;
import hieunnm.dtos.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author PC
 */
@WebServlet(name = "SearchUserServlet", urlPatterns = {"/SearchUserServlet"})
public class SearchUserServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(SearchServlet.class);
    private static final String ERROR_PAGE = "error.jsp";
    private static final String SEARCH_PAGE = "search.jsp";

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
            throws ServletException, IOException, SQLException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR_PAGE;
        try {

            // get ALL Role
            List<RoleDTO> roles = getAllRole();
            request.setAttribute("ROLE_LIST", roles);

            // data
            String nameUser = request.getParameter("txtNameUser");

            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER");
            RoleDTO roleID = user.getRole();
            String yourName = user.getId();

            if (roleID.getName().equals("admin")) {
                UserDAO userDao = new UserDAO();
                // get user
                if (nameUser == null) {
                    List<UserDTO> listUser = userDao.searchUser("");
                    if (listUser != null) {
                        request.setAttribute("SEARCH_RESULT_USER", listUser);
                    }
                } else {
                    List<UserDTO> listUser = userDao.searchUser(nameUser);
                    if (listUser != null) {
                        request.setAttribute("SEARCH_RESULT_USER", listUser);
                    }
                }
            } else {

                if (nameUser == null) {
                    UserDAO userDao = new UserDAO();
                    List<UserDTO> listUser = userDao.searchUser(yourName);
                    if (listUser != null) {
                        request.setAttribute("SEARCH_RESULT_USER", listUser);
                    }
                } else {
                    UserDAO userDao = new UserDAO();
                    List<UserDTO> listUser = userDao.searchUser(yourName);
                    if (listUser != null) {
                        request.setAttribute("SEARCH_RESULT_USER", listUser);
                    }
                }
            }

            url = SEARCH_PAGE;
        } catch (NullPointerException ex) {
            LOGGER.error(ex.getMessage());
            request.setAttribute("ERROR", "Something was wrong here");

        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    private List<RoleDTO> getAllRole() throws SQLException, NamingException {
        RoleDAO roleDao = new RoleDAO();
        return roleDao.getAllRole();
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
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(SearchUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            java.util.logging.Logger.getLogger(SearchUserServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(SearchUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            java.util.logging.Logger.getLogger(SearchUserServlet.class.getName()).log(Level.SEVERE, null, ex);
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
