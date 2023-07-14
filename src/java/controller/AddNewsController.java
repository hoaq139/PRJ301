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
import java.time.LocalDate;
import java.util.List;
import model.Category;
import model.News;
import model.User;

/**
 *
 * @author tienh
 */
public class AddNewsController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String image = req.getParameter("image");
        String shortdes = req.getParameter("shortdes");
        String category = req.getParameter("category");
        String description = req.getParameter("description");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");
        NewsDao dao = new NewsDao();
        dao.insertNews(new News(title, description, image, user.getId(), String.valueOf(LocalDate.now()), shortdes, Integer.parseInt(category)));
        resp.sendRedirect("admin");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryDao cdao = new CategoryDao();
        List<Category> listC = cdao.getAllCategorys();
        req.setAttribute("listC", listC);
        req.getRequestDispatcher("add.jsp").forward(req, resp);
    }

}
