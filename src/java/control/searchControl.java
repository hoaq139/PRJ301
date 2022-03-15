/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import DAL.RoomDAO;
import DAL.ServicesDAO;
import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        // List<Room> list1 = daor.getAllRoom();
        ServicesDAO daos = new ServicesDAO();
        List<Services> list2 = daos.getAllService();
        int pageSize = 4;
        String page = request.getParameter("page");
        if (page == null || page.trim().length() == 0) {
            page = "1";
        }
        int pageIndex = Integer.parseInt(page);
        int totalRecord = daor.getCount();
        int totalPage = (totalRecord % pageSize == 0) ? totalRecord / pageSize : (totalRecord / pageSize + 1);
        ArrayList<Room> list = daor.getAllRoomPage(pageIndex, pageSize);
        // request.setAttribute("listRoom", list1);
        
        request.setAttribute("totalpage", totalPage);
        request.setAttribute("pageindex", pageIndex);
        request.setAttribute("listService", list2);
        //book
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");
        String adult = request.getParameter("adult");
        String child = request.getParameter("child");
        //search follow total guest
        int Total = 0;
        if (child != null) {
            int adultNum = Integer.parseInt(adult);
            int childNum = Integer.parseInt(child);

            Total = Total + adultNum + childNum;
            list = (ArrayList<Room>) daor.getAllRoomByGuest(pageIndex, pageSize, Total);
        }
        request.setAttribute("listRoom", list);
        request.setAttribute("adult", adult);
        request.setAttribute("child", child);
        request.setAttribute("checkin", checkin);
        request.setAttribute("checkout", checkout);
        HttpSession session = request.getSession();
        session.setAttribute("checkin", checkin);
        session.setAttribute("checkout", checkout);
        session.setAttribute("adult", adult);
        session.setAttribute("child", child);
        
        //service
//        String[] services = request.getParameterValues("service");
//        int totalMoney = 0;
//        int price = 0;
//        for (Services services1 : list2) {
//            price = services1.getPrice();
//        }
//
//        for (int i = 0; i < services.length; i++) {
//            String[] checkValue = request.getParameterValues(services[i]);
//            if (checkValue != null) {
//                totalMoney = totalMoney + price * Total;
//            }
//        }
//        request.setAttribute("TotalMoney", totalMoney);
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
