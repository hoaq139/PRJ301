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
import java.io.IOException;
import java.util.List;
import model.Category;
import model.News;

/**
 *
 * @author tienh
 */
public class UpdateNews extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String title = req.getParameter("title");
        String image = req.getParameter("image");
        String shortdes = req.getParameter("shortdes");
        String category = req.getParameter("category");
        String description = req.getParameter("description");
        NewsDao dao = new NewsDao();
        dao.updateNews(new News(Integer.parseInt(id), title, description, image, shortdes, Integer.parseInt(category)));
        resp.sendRedirect("admin");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        NewsDao dao = new NewsDao();
        CategoryDao cdao = new CategoryDao();
        List<Category> list = cdao.getAllCategorys();
        req.setAttribute("listC", list);
        News s = dao.getNewsById(id);
        req.setAttribute("s", s);
        req.getRequestDispatcher("updateNew.jsp").forward(req, resp);
    }

}
