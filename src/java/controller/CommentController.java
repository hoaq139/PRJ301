/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAL.CommentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import model.Comment;
import model.News;
import model.User;

/**
 *
 * @author tienh
 */
public class CommentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String commentString = req.getParameter("comment");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");
        CommentDao dao = new CommentDao();
        LocalDate time = LocalDate.now();
        News news = (News) session.getAttribute("new");
        dao.insertComment(new Comment(user.getId(), commentString, String.valueOf(time), news.getId()));
        resp.sendRedirect("detail?id=" + news.getId());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }
    
}
