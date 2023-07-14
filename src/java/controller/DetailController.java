/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAL.CommentDao;
import DAL.NewsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Comment;
import model.News;

/**
 *
 * @author tienh
 */
public class DetailController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        NewsDao dao = new NewsDao();
        News news = dao.getNewsById(id);
        HttpSession session = req.getSession();
        session.setAttribute("new", news);
        CommentDao cdao = new CommentDao();
        List<Comment> list = cdao.getAllCommentByNewId(id);
        int count = cdao.countCommentByNewId(id);
        req.setAttribute("count", count);
        req.setAttribute("list", list);
        req.setAttribute("news", news);
        req.getRequestDispatcher("detail.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    
}
