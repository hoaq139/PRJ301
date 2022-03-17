/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import DAL.BookingDAO;
import DAL.RoomDAO;
import DAL.ServicesDAO;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Room;
import model.Services;

/**
 *
 * @author win
 */
public class bookingControl extends HttpServlet {

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
        String checkin = (String) request.getSession().getAttribute("checkin");
        String checkout = (String) request.getSession().getAttribute("checkin");
        String adult = (String) request.getSession().getAttribute("adult");
        String child = (String) request.getSession().getAttribute("child");
        int id = Integer.parseInt( request.getParameter("id"));
        RoomDAO dao = new RoomDAO();
        Room room = dao.getRoom(id);
        String roomName = room.getName();
        request.setAttribute("roomName", roomName);
        int price = room.getPrice();
        int totalServie =0;
        //service
        ServicesDAO daos = new ServicesDAO();
        List<Services> list2 = daos.getAllService();
        request.setAttribute("listService", list2);
       
        
        
       //insert bookingroomId
//        BookingDAO b = new BookingDAO();
//       
//        b.insertBookingroomID(id);
        ///
//        HttpSession session = request.getSession();
//        request.getSession().setAttribute("room", room);
        request.setAttribute("price", price);
        request.setAttribute("adult", adult);
        request.setAttribute("child", child);
        request.setAttribute("checkin", checkin);
        request.setAttribute("checkout", checkout);
       request.getRequestDispatcher("booking.jsp").forward(request, response);
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
//        int id = Integer.parseInt(request.getParameter("id"));
//        ServicesDAO dao = new ServicesDAO();
//        Services service = dao.getService(id);
//        int price = service.getPrice();
//        int totalSmoney=0;
//        String[] services = request.getParameterValues("services");
//        for (int i = 0; i < services.length; i++) {
//            if(services[i] != null){
//                totalSmoney = totalSmoney+price*
//            }
//        }
        
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
        processRequest(request, response);
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
