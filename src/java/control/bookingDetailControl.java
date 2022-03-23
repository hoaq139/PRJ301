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
import java.io.PrintWriter;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Room;
import model.bookingDetail;

/**
 *
 * @author win
 */
public class bookingDetailControl extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String fname = request.getParameter("fname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String country = request.getParameter("country");
        String surname = request.getParameter("surname");
        String phone = request.getParameter("phone");
        String city = request.getParameter("city");
        String zip = request.getParameter("zip");
        String requested = request.getParameter("requested");
        String nameCust = fname + surname;
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");
        String[] service = request.getParameterValues("service");
        int price = Integer.parseInt( request.getParameter("price"));
        String adult = request.getParameter("adult");
        String child = request.getParameter("child");
        ServicesDAO dao3 = new ServicesDAO();
        int guest = Integer.parseInt(child) + Integer.parseInt(adult);
        Integer[] numbers = new Integer[service.length];
        int sum=0;
        int total = 0;
        int price3 = 0;
        for (String se : service) {
            price3 = dao3.getPriceById(se);
            total += price3*guest;
        }
        
//        for (int i = 0; i < service.length; i++) {
//            try {
//                
//                numbers[i] = Integer.parseInt(service[i]);
//                total += (numbers[i])*guest;
//            } catch (NumberFormatException nfe) {
//                numbers[i] = null;
//                
//            }
//        }
        HttpSession session=request.getSession(true);  
        Account account = (Account) session.getAttribute("account");
        String name = request.getParameter("name");
        BookingDAO dao = new BookingDAO();
        Room room = dao.getRoom(name);
        sum = total + price;
        request.setAttribute("sum", sum);
        request.setAttribute("price", price);
        request.setAttribute("total", total);
        bookingDetail detail = new bookingDetail();
        if(account != null){
            for (String s : service) {
               detail = new bookingDetail(account.getId(),room.getId(), checkin, checkout, guest, nameCust, email, phone, address, city, country, zip, sum, requested, s);
                 dao.insertBookingDetail(detail);
                // response.getWriter().print(detail);
            }
        }else{
            for (String s : service) {
               detail = new bookingDetail(-1,room.getId(), checkin, checkout, guest, nameCust, email, phone, address, city, country, zip, sum, requested, s);
                 dao.insertBookingDetail(detail);
                // response.getWriter().print(detail);
            }
        }
//    response.getWriter().print(detail);
      
        request.getRequestDispatcher("thankyou.jsp").forward(request, response);
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
