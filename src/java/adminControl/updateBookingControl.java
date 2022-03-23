/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminControl;

import DAL.BookingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bookingDetail;

/**
 *
 * @author win
 */
public class updateBookingControl extends HttpServlet {

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
        // processRequest(request, response);
        int id = Integer.parseInt(request.getParameter("iddd"));
        BookingDAO dao = new BookingDAO();
        bookingDetail details = new bookingDetail();
        details = dao.getDetailById(id);
        request.setAttribute("s", details);
        request.getRequestDispatcher("/admin/room/update2.jsp").forward(request, response);
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
        int id = Integer.parseInt(request.getParameter("id")) ;
        int custid = Integer.parseInt(request.getParameter("custid"));
        int roomid = Integer.parseInt(request.getParameter("roomid"));
        String servicesid = request.getParameter("servicesid");
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");
        int guest = Integer.parseInt(request.getParameter("guest"));
         String custname = request.getParameter("custname");
        String email = request.getParameter("email");
         String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String country = request.getParameter("country");
        String zip = request.getParameter("zip");
        String requested = request.getParameter("requested");
        int total = Integer.parseInt(request.getParameter("total"));
        BookingDAO dao = new BookingDAO();
        bookingDetail details = new bookingDetail(id, custid, roomid, checkin, checkout, guest, custname, email, phone, address, city, country, zip, requested, total, servicesid);
        dao.updateBookingDetail(details);
         response.sendRedirect("../room/roomList");
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
