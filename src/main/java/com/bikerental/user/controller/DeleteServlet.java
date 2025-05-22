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

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        String filePath = getServletContext().getRealPath("/WEB-INF/data/users.txt");
        userService = new UserService(filePath);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        try {
            userService.deleteUser(user.getUsername());
            session.invalidate();
            resp.sendRedirect(req.getContextPath() + "/login");
        } catch (IOException e) {
            resp.sendRedirect("/profile?error=Failed to delete account");
        }
    }
}
