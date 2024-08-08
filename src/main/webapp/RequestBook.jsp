<%@page import="PKG1.GlobalVar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="PKG1.AddBooks" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Books</title>
    <link rel="stylesheet" href="SearchBooks.css">
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

        .control-link {
            color: #4a90e2;
            text-decoration: none;
        }

        .control-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Search Books</h1>

    <div class="search-form">
        <form action='RequestBook' method='post'>
            <input type='text' name='search' placeholder='Search for books...' value='<%= (request.getAttribute("value") != null) ? request.getAttribute("value") : "" %>' required>
            <button type='submit'>Search</button>
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>ISBN</th>
                <th>Book Name</th>
                <th>Publication</th>
                <th>Genre</th>
                <th>Control</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<AddBooks> books = (List) request.getAttribute("users");
                if (books != null) {
                    for (AddBooks book : books) {
                        out.println("<tr>" +
                            "<td>" + book.getISBN() + "</td>" +
                            "<td>" + book.getName() + "</td>" +
                            "<td>" + book.getPublication() + "</td>" +
                            "<td>" + book.getType() + "</td>" +
                            "<td><a href='UserRequestBook?isbn=" + book.getISBN() + "&uid=" + GlobalVar.userid + 
                            "' class='control-link' onclick='return confirmRequest(\"" + book.getISBN() + "\")'>Request</a></td>" +
                            "</tr>");
                    }
                } else {
                    out.println("<tr><td colspan='5'>No books found</td></tr>");
                }
            %>
        </tbody>
    </table>

    <script>
        function confirmRequest(isbn) {
            return confirm('Are you sure you want to request the book with ISBN ' + isbn + '?');
        }
    </script>
</body>
</html>