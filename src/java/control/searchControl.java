/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import DAL.RoomDAO;
import DAL.ServicesDAO;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Room;
import model.Services;

/**
 *
 * @author win
 */
public class searchControl extends HttpServlet {

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
        RoomDAO daor = new RoomDAO();
        List<Room> list1 = daor.getAllRoom();
        ServicesDAO daos = new ServicesDAO();
        List<Services> list2 = daos.getAllService();

        request.setAttribute("listRoom", list1);
        request.setAttribute("listService", list2);
        request.getRequestDispatcher("search.jsp").forward(request, response);
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
        SimpleDateFormat format = new SimpleDateFormat("MM-dd-yy");
        String checkin = request.getParameter("checkin");
        java.util.Date date = null;
        try {
            date = format.parse(checkin);
        } catch (ParseException ex) {
        }
        java.sql.Date in = new java.sql.Date(date.getTime());
        String checkout = request.getParameter("checkout");
        java.util.Date date1 = null;
        try {
            date1 = format.parse(checkout);
        } catch (ParseException ex) {
        }
        java.sql.Date out = new java.sql.Date(date1.getTime());
        int adult = Integer.parseInt(request.getParameter("adult"));
        int child = Integer.parseInt(request.getParameter("child"));
        request.setAttribute("checkin", in);
        request.setAttribute("checkout", out);
        request.getRequestDispatcher("home.jsp").forward(request, response);
        
        
        
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
