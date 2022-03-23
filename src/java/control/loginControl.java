/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import DAL.AccountDAO;
import DAL.BookingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author win
 */
public class loginControl extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
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
        processRequest(request, response);
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
        //processRequest(request, response);
        String user =  request.getParameter("user");
        String pass = request.getParameter("pass");
        AccountDAO dao = new AccountDAO();
        Account a = dao.getAccountByUsernameAndPassword(user, pass);
        
        if (a != null) // login successfully!
        {
            if(user.equals("admin") && pass.equals("admin")){
                //request.getRequestDispatcher("../admin/room/roomList").forward(request, response);
                a= new Account("admin", "admin");
                HttpSession session = request.getSession();
            session.setAttribute("account", a);
                response.sendRedirect("../admin/room/roomList");
                return;
            }
            String remember = request.getParameter("remember");
            if (remember != null) {
                Cookie c_user = new Cookie("user", user);
                Cookie c_pass = new Cookie("pass", pass);
                c_user.setMaxAge(3600 * 24 * 30);
                c_pass.setMaxAge(3600 * 24 * 30);
                response.addCookie(c_user);
                response.addCookie(c_pass);
                
            }
            HttpSession session = request.getSession();
            session.setAttribute("account", a);
//            Account b = (Account) session.getAttribute("account");
//            response.getWriter().print(b);
            response.sendRedirect("home.jsp");
        } else //login fail
        { 
            
            request.setAttribute("mess", "Wrong username or password");
            request.setAttribute("user", user);
            request.setAttribute("pass", pass);
           request.getRequestDispatcher("login.jsp").forward(request, response);
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
