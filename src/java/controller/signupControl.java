/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAL.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.User;

/**
 *
 * @author tienh
 */
public class signupControl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String user = req.getParameter("user");
        String pass = req.getParameter("pass");
        String repass = req.getParameter("repass");
        String fullname = req.getParameter("fullname");
        if (pass.equals(repass)) {
            UserDao dao = new UserDao();
            User a = dao.checkAccountExist(user);
            User account = new User(user, pass, fullname, 2);
            if (a == null) {
                dao.insertAccount(account);
                resp.sendRedirect("home.jsp");
            } else {
                req.setAttribute("a", 1);
                req.setAttribute("user2", user);
                req.setAttribute("pass2", pass);
                req.setAttribute("repass", repass);
                req.setAttribute("email", fullname);
                req.setAttribute("mess2", "Account already exist!");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("a", 1);
            req.setAttribute("user2", user);
            req.setAttribute("pass2", pass);
            req.setAttribute("repass", repass);
            req.setAttribute("email", fullname);
            req.setAttribute("mess2", "Wrong repass. Please enter again!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       resp.setContentType("text/html;charset=UTF-8");
        String user = req.getParameter("user");
        String pass = req.getParameter("pass");
        String repass = req.getParameter("repass");
        String fullname = req.getParameter("fullname");
        if (pass.equals(repass)) {
            UserDao dao = new UserDao();
            User a = dao.checkAccountExist(user);
            User account = new User(user, pass, fullname, 2);
            if (a == null) {
                dao.insertAccount(account);
                resp.sendRedirect("home.jsp");
            } else {
                req.setAttribute("a", 1);
                req.setAttribute("user2", user);
                req.setAttribute("pass2", pass);
                req.setAttribute("repass", repass);
                req.setAttribute("email", fullname);
                req.setAttribute("mess2", "Account already exist!");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("a", 1);
            req.setAttribute("user2", user);
            req.setAttribute("pass2", pass);
            req.setAttribute("repass", repass);
            req.setAttribute("email", fullname);
            req.setAttribute("mess2", "Wrong repass. Please enter again!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

}
