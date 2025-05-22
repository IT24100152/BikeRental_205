<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Submit Feedback</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        body {
            color: #333;
        }

        form {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            padding: 30px 40px;
            max-width: 420px;
            width: 100%;
            box-sizing: border-box;
            transition: box-shadow 0.3s ease;
        }

        form:hover {
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            color: #004aad;
            margin-bottom: 25px;
            font-weight: 700;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            font-size: 1rem;
            color: #004aad;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 10px 12px;
            font-size: 1rem;
            border: 1.8px solid #004aad;
            border-radius: 6px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
            resize: vertical;
            font-family: inherit;
            color: #333;
        }

        input[type="text"]:focus, textarea:focus {
            outline: none;
            border-color: #ffcc00;
            box-shadow: 0 0 5px #ffcc00;
        }

        textarea {
            min-height: 100px;
        }

        .stars {
            margin-top: 5px;
            margin-bottom: 20px;
            font-size: 2.4rem;
            user-select: none;
        }

        .stars span {
            cursor: pointer;
            color: #ccc;
            margin-right: 7px;
            transition: color 0.3s ease;
        }

        .stars span.selected,
        .stars span:hover,
        .stars span:hover ~ span {
            color: #ffcc00;
        }

        .stars span:hover,
        .stars span:hover ~ span {
            color: #ccc;
        }
        .stars span:hover {
            color: #ffcc00;
        }

        .submit-btn {
            display: block;
            width: 100%;
            padding: 12px 0;
            font-size: 1.1rem;
            font-weight: 600;
            background-color: #004aad;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-shadow: 0 3px 10px rgba(0, 74, 173, 0.4);
        }

        .submit-btn:hover {
            background-color: #003380;
            box-shadow: 0 4px 14px rgba(0, 51, 128, 0.6);
        }

        p.error-message {
            color: #dc3545;
            font-weight: 600;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
    <script>
        window.onload = function() {
            const stars = document.querySelectorAll('.stars span');
            const ratingInput = document.getElementById('ratingInput');

            stars.forEach((star, index) => {
                star.addEventListener('click', () => {
                    ratingInput.value = index + 1;
                    stars.forEach((s, i) => {
                        s.classList.toggle('selected', i <= index);
                    });
                });

                star.addEventListener('mouseover', () => {
                    stars.forEach((s, i) => {
                        s.classList.toggle('selected', i <= index);
                    });
                });
                star.addEventListener('mouseout', () => {
                    const rating = parseInt(ratingInput.value) || 0;
                    stars.forEach((s, i) => {
                        s.classList.toggle('selected', i < rating);
                    });
                });
            });
        };
    </script>
</head>
<body>
<% if (request.getAttribute("error") != null) { %>
<p class="error-message"><%= request.getAttribute("error") %></p>
<% } %>
<form action="<%= request.getContextPath() %>/submitFeedback" method="post" novalidate>
    <h2>Submit Feedback</h2>

    <label for="user">User:</label>
    <input type="text" id="user" name="user" required placeholder="Your name">

    <label for="comments">Comments:</label>
    <textarea id="comments" name="comments" required placeholder="Write your comments here..."></textarea>

    <label>Rating:</label>
    <div class="stars" aria-label="Rating stars" role="radiogroup">
        <span role="radio" aria-checked="false" tabindex="0">&#9733;</span>
        <span role="radio" aria-checked="false" tabindex="-1">&#9733;</span>
        <span role="radio" aria-checked="false" tabindex="-1">&#9733;</span>
        <span role="radio" aria-checked="false" tabindex="-1">&#9733;</span>
        <span role="radio" aria-checked="false" tabindex="-1">&#9733;</span>
    </div>
    <input type="hidden" id="ratingInput" name="rating" required>

    <button type="submit" class="submit-btn">Submit Feedback</button>
</form>
</body>
</html>