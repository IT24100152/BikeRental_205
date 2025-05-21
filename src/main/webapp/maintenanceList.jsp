<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.bikerental.maintenance.model.Maintenance" %>
<%
    List<Maintenance> records = (List<Maintenance>) request.getAttribute("records");
    String msg = request.getParameter("msg");
%>
<html>
<head>
    <title>Maintenance Records</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f8fb;
        }

        .navbar {
            background-color: #000;
            padding: 16px 40px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .navbar h1 {
            margin: 0;
            font-size: 22px;
        }

        .nav-btn {
            padding: 10px 18px;
            background-color: #64b5f6;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .nav-btn:hover {
            background-color: #42a5f5;
        }

        .container {
            padding: 40px 20px;
        }

        h2 {
            color: #1f3b73;
        }

        .search-box {
            margin-bottom: 20px;
        }

        .search-box input {
            width: 100%;
            max-width: 400px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
        }

        th, td {
            padding: 14px 18px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4a90e2;
            color: white;
        }

        tr:hover {
            background-color: #f2f9ff;
        }

        .btn {
            padding: 6px 10px;
            border-radius: 6px;
            color: white;
            font-size: 13px;
            font-weight: bold;
            text-decoration: none;
            margin-right: 4px;
            display: inline-flex;
            align-items: center;
        }

        .btn i {
            margin-right: 5px;
        }

        .btn-edit {
            background-color: #4CAF50; /* Green */
        }

        .btn-edit:hover {
            background-color: #45a049;
        }

        .btn-delete {
            background-color: #F44336; /* Red */
        }

        .btn-delete:hover {
            background-color: #e53935;
        }

        p {
            font-weight: bold;
            color: green;
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
            }

            .navbar h1 {
                margin-bottom: 10px;
            }

            .search-box input {
                width: 100%;
            }

            table, thead, tbody, th, td, tr {
                display: block;
            }

            tr {
                margin-bottom: 15px;
                background: #fff;
                border-radius: 8px;
                padding: 10px;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
            }

            th {
                display: none;
            }

            td {
                border: none;
                padding: 10px;
                text-align: right;
                position: relative;
            }

            td::before {
                content: attr(data-label);
                position: absolute;
                left: 10px;
                font-weight: bold;
                text-align: left;
            }
        }
    </style>

    <script>
        function searchRecords() {
            const input = document.getElementById("searchInput").value.toLowerCase();
            const rows = document.querySelectorAll("tbody tr");

            rows.forEach(row => {
                const bikeId = row.cells[1].innerText.toLowerCase();
                const desc = row.cells[2].innerText.toLowerCase();

                if (bikeId.includes(input) || desc.includes(input)) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        }
    </script>
</head>
<body>

<div class="navbar">
    <h1>Bike Maintenance System</h1>
    <a href="addMaintenance.jsp" class="nav-btn">Add New Maintenance</a>
</div>

<div class="container">
    <h2>Maintenance List</h2>

    <% if (msg != null) { %>
    <p><%= msg %></p>
    <% } %>

    <div class="search-box">
        <input type="text" id="searchInput" placeholder="Search by Bike ID or Description..." onkeyup="searchRecords()">
    </div>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Bike ID</th>
            <th>Description</th>
            <th>Date</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (records != null && !records.isEmpty()) {
                for (Maintenance m : records) {
        %>
        <tr>
            <td data-label="ID"><%= m.getId() %></td>
            <td data-label="Bike ID"><%= m.getBikeId() %></td>
            <td data-label="Description"><%= m.getDescription() %></td>
            <td data-label="Date"><%= m.getDate() %></td>
            <td data-label="Status"><%= m.getStatus() %></td>
            <td data-label="Actions">
                <a href="updateMaintenance?id=<%= m.getId() %>" class="btn btn-edit">
                    <i class="fas fa-edit"></i>Edit
                </a>
                <a href="deleteMaintenance?id=<%= m.getId() %>" class="btn btn-delete" onclick="return confirm('Are you sure?')">
                    <i class="fas fa-trash-alt"></i>Delete
                </a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No maintenance records found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>







