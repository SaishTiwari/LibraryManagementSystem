<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="PKG1.UserRequest" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Status</title>
    <link rel="stylesheet" href="BookStatus.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .search-form {
            text-align: center;
            margin-bottom: 30px;
        }

        .search-form input[type='text'] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            width: 80%;
            max-width: 600px;
        }

        .search-form button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #4a90e2;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-left: 10px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .search-form button:hover {
            background-color: #357ABD;
            transform: scale(1.05);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
            max-width: 1200px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #4a90e2;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .no-data {
            text-align: center;
            color: #666;
            font-style: italic;
        }
    </style>
</head>
<body>
    <h1>Search Request Data</h1>

    <div class="search-form">
        <form action='BookStatus' method='post'>
            <input type='text' name='search' placeholder='Search Request Data' value='<%= (request.getAttribute("searchValue") != null) ? request.getAttribute("searchValue") : "" %>' required>
            <button type='submit'>Search</button>
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>Request ID</th>
                <th>ISBN</th>
                <th>Requested Book</th>
                <th>Genre</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<UserRequest> userRequests = (List<UserRequest>) request.getAttribute("requestData");
                if (userRequests != null && !userRequests.isEmpty()) {
                    for (UserRequest userRequest : userRequests) {
                        out.println("<tr>" +
                            "<td>" + userRequest.getRid() + "</td>" +
                            "<td>" + userRequest.getIsbn() + "</td>" +
                            "<td>" + userRequest.getBookname() + "</td>" +
                            "<td>" + userRequest.getGenre() + "</td>" +
                            "<td>" + userRequest.getStatus() + "</td>" +
                            "</tr>");
                    }
                } else {
                    out.println("<tr><td colspan='5' class='no-data'>No data found</td></tr>");
                }
            %>
        </tbody>
    </table>
</body>
</html>