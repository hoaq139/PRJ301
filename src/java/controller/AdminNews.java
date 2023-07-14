/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAL.CategoryDao;
import DAL.NewsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Category;
import model.News;
import model.User;

/**
 *
 * @author tienh
 */
public class AdminNews extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user =(User) session.getAttribute("account");
        if(user!=null){
            if (user.getRoles() == 1 || user.getRoles() == 3) {
                NewsDao dao = new NewsDao();
        List<News> newslist = dao.getAllNews();
        CategoryDao cdao = new CategoryDao();
        List<Category> listC = cdao.getAllCategorys();
        req.setAttribute("newslist", newslist);
        req.setAttribute("listC", listC);
        req.getRequestDispatcher("admin2.jsp").forward(req, resp);
            }else{
                PrintWriter out = resp.getWriter();
            out.println("access denied");
            }
        }else{
            PrintWriter out = resp.getWriter();
            out.println("access denied");
        }
        
    }
    
}
