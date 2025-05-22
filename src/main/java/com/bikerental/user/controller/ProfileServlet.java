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

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        String filePath = getServletContext().getRealPath("/WEB-INF/users.txt");
        userService = new UserService(filePath);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        req.setAttribute("user", user);
        req.getRequestDispatcher("profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");

        if (currentUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String email = req.getParameter("email");
        String fullName = req.getParameter("fullName");

        // ✅ Keep username and password as-is
        String username = currentUser.getUsername();
        String password = currentUser.getPassword();

        // ✅ Create updated User object with full details
        User updatedUser = new User(username, password, email, fullName);

        try {
            userService.updateUser(updatedUser);

            // ✅ Replace session value and forward back to profile.jsp
            session.setAttribute("loggedInUser", updatedUser);
            req.setAttribute("user", updatedUser);
            req.setAttribute("message", "Profile updated successfully");
            req.getRequestDispatcher("profile.jsp").forward(req, resp);

        } catch (IOException e) {
            req.setAttribute("user", currentUser);
            req.setAttribute("error", "Failed to update profile");
            req.getRequestDispatcher("profile.jsp").forward(req, resp);
        }
    }
}
