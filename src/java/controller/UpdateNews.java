/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAL.CategoryDao;
import DAL.NewsDao;
import DAL.PublishDAO;
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
import model.Publish;
import model.User;

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
        String publish = req.getParameter("publish");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");
        NewsDao dao = new NewsDao();
        System.out.println("n");
        dao.updateNews(new News(title,description,image,shortdes,Integer.parseInt(category),Integer.parseInt(publish),Integer.parseInt(id)));
        System.out.println(category);
        System.out.println(publish);
        System.out.println(id);
        resp.sendRedirect("admin");
    }


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        NewsDao dao = new NewsDao();
        CategoryDao cdao = new CategoryDao();
        PublishDAO pdao = new PublishDAO();
        List<Category> list = cdao.getAllCategorys();
        req.setAttribute("listC", list);
        List<Publish> publish = pdao.getAllCategorys();
        req.setAttribute("listP", publish);
        News s = dao.getNewsById(id);
        req.setAttribute("s", s);
        req.getRequestDispatcher("updateNew.jsp").forward(req, resp);
    }

}
