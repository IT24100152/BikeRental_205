<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.bikerental.feedback.model.Feedback" %>

<html>
<head>
    <title>All Feedback</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8faff;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        nav {
            background-color: #004aad;
            padding: 15px 40px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 74, 173, 0.2);
        }

        nav a.add-feedback {
            background-color: #ffcc00;
            color: #004aad;
            font-weight: 700;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            transition: background-color 0.3s ease;
            box-shadow: 0 3px 10px rgba(255, 204, 0, 0.4);
        }

        nav a.add-feedback:hover {
            background-color: #e6b800;
            box-shadow: 0 4px 14px rgba(230, 184, 0, 0.6);
        }

        .container {
            max-width: 900px;
            width: 100%;
            background: white;
            padding: 30px 40px;
            margin: 30px auto 50px;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            flex-grow: 1;
        }

        h2 {
            color: #004aad;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
        }

        p.message {
            color: green;
            font-weight: 600;
            text-align: center;
            margin-bottom: 20px;
        }

        p.error {
            color: red;
            font-weight: 600;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }

        table thead tr {
            background-color: #004aad;
            color: white;
            text-align: left;
        }

        table th, table td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
        }

        table tbody tr:nth-child(even) {
            background-color: #f4f7fc;
        }

        table tbody tr:hover {
            background-color: #dbe6fd;
        }

        .actions a {
            font-weight: 600;
            padding: 6px 12px;
            border-radius: 5px;
            text-decoration: none;
            margin-right: 8px;
            font-size: 0.9rem;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .actions a.edit {
            background-color: #28a745;
            color: white;
        }

        .actions a.edit:hover {
            background-color: #218838;
        }

        .actions a.delete {
            background-color: #dc3545;
            color: white;
        }

        .actions a.delete:hover {
            background-color: #bd2130;
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
                margin: 20px 10px;
            }
            nav {
                padding: 10px 20px;
                justify-content: center;
            }
        }
    </style>
</head>
<body>

<nav>
    <a href="submitFeedback.jsp" class="add-feedback">Add New Feedback</a>
</nav>

<div class="container">
    <h2>All Feedback</h2>

    <%
        String message = request.getParameter("message");
        String error = request.getParameter("error");

        if (message != null) {
    %>
    <p class="message"><%= message %></p>
    <%
        }
        if (error != null) {
    %>
    <p class="error"><%= error %></p>
    <%
        }

        List<Feedback> feedbacks = (List<Feedback>) request.getAttribute("feedbacks");
    %>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>User</th>
            <th>Comments</th>
            <th>Rating</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (feedbacks != null && !feedbacks.isEmpty()) {
                for (Feedback feedback : feedbacks) {
        %>
        <tr>
            <td><%= feedback.getId() %></td>
            <td><%= feedback.getUser() %></td>
            <td><%= feedback.getComments() %></td>
            <td><%= feedback.getRating() %></td>
            <td class="actions">
                <a href="editFeedback?id=<%= feedback.getId() %>" class="edit">Edit</a>
                <a href="deleteFeedback?id=<%= feedback.getId() %>" class="delete"
                   onclick="return confirm('Are you sure you want to delete this feedback?');">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5" style="text-align:center; font-style: italic;">No feedbacks available.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>





