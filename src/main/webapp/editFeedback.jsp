<%@ page import="com.bikerental.feedback.model.Feedback" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Feedback</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8faff;
            color: #333;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding: 40px 20px;
        }

        h2 {
            color: #004aad;
            margin-bottom: 25px;
            font-weight: 700;
        }

        form {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            max-width: 450px;
            width: 100%;
            box-sizing: border-box;
        }

        label {
            font-weight: 600;
            color: #004aad;
            display: block;
            margin-bottom: 8px;
            margin-top: 15px;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px 12px;
            border: 2px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
            resize: vertical;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        textarea:focus {
            border-color: #004aad;
            outline: none;
        }

        textarea {
            min-height: 100px;
        }

        button {
            margin-top: 25px;
            background-color: #004aad;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0, 74, 173, 0.4);
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #00337a;
        }

        p.error-message {
            color: #dc3545;
            font-weight: 600;
            margin-bottom: 20px;
            max-width: 450px;
            text-align: center;
        }

        a.back-link {
            display: inline-block;
            margin-top: 20px;
            color: #004aad;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        a.back-link:hover {
            color: #002e5d;
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            form {
                padding: 20px 25px;
            }
            button {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<h2>Edit Feedback</h2>

<%
    Feedback feedback = (Feedback) request.getAttribute("feedback");
    if (feedback == null) {
%>
<p class="error-message">No feedback found to edit.</p>
<a href="viewFeedback" class="back-link">Back to View Feedback</a>
<%
} else {
%>
<form action="editFeedback" method="post">
    <input type="hidden" name="id" value="<%= feedback.getId() %>">

    <label for="user">Your Name:</label>
    <input type="text" id="user" name="user" value="<%= feedback.getUser() %>" required>

    <label for="comments">Comments:</label>
    <textarea id="comments" name="comments" required><%= feedback.getComments() %></textarea>

    <label for="rating">Rating (1-5):</label>
    <input type="number" id="rating" name="rating" min="1" max="5" value="<%= feedback.getRating() %>" required>

    <button type="submit">Update Feedback</button>
</form>

<a href="viewFeedback" class="back-link">Back to View Feedback</a>
<%
    }
%>

</body>
</html>
