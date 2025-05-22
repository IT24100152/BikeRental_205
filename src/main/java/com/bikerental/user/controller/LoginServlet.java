package com.bikerental.user.controller;

import com.bikerental.user.model.User;
import com.bikerental.user.util.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        String filePath = getServletContext().getRealPath("/WEB-INF/users.txt");
        userService = new UserService(filePath);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        try {
            User user = userService.getUserByUsername(username);
            if (user != null && user.getPassword().equals(password)) {
                HttpSession session = req.getSession();
                session.setAttribute("loggedInUser", user);
                resp.sendRedirect(req.getContextPath() + "/profile");
            } else {
                req.setAttribute("error", "Invalid username or password");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } catch (IOException e) {
            req.setAttribute("error", "Error during login");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
