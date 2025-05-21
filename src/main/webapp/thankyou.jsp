<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thank You</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4faff;
            color: #004aad;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 40px;
        }

        .button-container {
            display: flex;
            gap: 20px;
        }

        .button {
            background-color: #004aad;
            color: white;
            padding: 14px 30px;
            font-size: 1.1rem;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
        }

        .button:hover {
            background-color: #00337a;
        }

        @media (max-width: 480px) {
            h1 {
                font-size: 2rem;
                text-align: center;
                padding: 0 20px;
            }

            .button-container {
                flex-direction: column;
                width: 100%;
                align-items: center;
            }

            .button {
                width: 80%;
                text-align: center;
            }
        }
    </style>
</head>
<body>

<h1>Thank You for your Feedback!</h1>

<div class="button-container">
    <a href="viewFeedback" class="button">View Feedbacks</a>
    <a href="submitFeedback.jsp" class="button">Submit Feedback</a>
</div>

</body>
</html>
