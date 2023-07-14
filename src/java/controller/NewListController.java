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
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.News;

/**
 *
 * @author tienh
 */
public class NewListController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        String from = req.getParameter("from");
        String to = req.getParameter("to");
        String category = req.getParameter("choices-single-default");
        NewsDao dao = new NewsDao();
        List<News> newslist = new ArrayList<>();

        CategoryDao cdao = new CategoryDao();
        List<Category> listC = cdao.getAllCategorys();
        if (category.equals("all")) {
            newslist = dao.getAllNews();
            req.setAttribute("listC", listC);
            req.setAttribute("data", newslist);
            req.setAttribute("search", search);
            req.setAttribute("from", from);
            req.setAttribute("to", to);
            req.getRequestDispatcher("home.jsp").forward(req, resp);
            return;
        }
        newslist = dao.getAllNewsBySearch(search, from, to, Integer.parseInt(category));

        req.setAttribute("listC", listC);
        req.setAttribute("data", newslist);
        req.setAttribute("search", search);
        req.setAttribute("from", from);
        req.setAttribute("to", to);
        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        NewsDao dao = new NewsDao();
        List<News> newslist = dao.getAllNews();
        req.setAttribute("data", newslist);
         CategoryDao cdao = new CategoryDao();
        List<Category> listC = cdao.getAllCategorys();
        req.setAttribute("listC", listC);
        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }

}
