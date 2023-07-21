/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAL.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;

/**
 *
 * @author tienh
 */
public class loginControl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user = req.getParameter("user");
        String pass = req.getParameter("pass");
        UserDao dao = new UserDao();
        User a = dao.getAccountByUsernameAndPassword(user, pass);
        HttpSession session = req.getSession();
        if (a != null) // login successfully!
        {
            if (a.getRoles() == 1) {
                session.setAttribute("account", a);
                session.setMaxInactiveInterval(60 * 600);
                resp.sendRedirect("admin");
                return;
            }else if(a.getRoles() == 3){
                session.setAttribute("account", a);
                session.setMaxInactiveInterval(60 * 600);
                resp.sendRedirect("writer");
                return;
            }
            String remember = req.getParameter("remember");
            if (remember != null) {
                Cookie c_user = new Cookie("user", user);
                Cookie c_pass = new Cookie("pass", pass);
                c_user.setMaxAge(3600 * 24 * 30);
                c_pass.setMaxAge(3600 * 24 * 30);
                resp.addCookie(c_user);
                resp.addCookie(c_pass);

            }

            session.setAttribute("account", a);
            session.setMaxInactiveInterval(60 * 600);
            resp.sendRedirect("newslist");
        } else //login fail
        {

            req.setAttribute("mess", "Wrong username or password");
            req.setAttribute("user", user);
            req.setAttribute("pass", pass);
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
    }

}
