package com.bikerental.user.controller;

import com.bikerental.user.model.User;
import com.bikerental.user.util.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        String filePath = getServletContext().getRealPath("/WEB-INF/users.txt");
        userService = new UserService(filePath);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String fullName = req.getParameter("fullName");
        User user = new User(username, password, email, fullName);
        try {
            userService.createUser(user);
            resp.sendRedirect(req.getContextPath() + "/login");
        } catch (IOException e) {
            req.setAttribute("error", "Username already exists");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}
