<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="PKG1.UserRequest" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Book Status</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        input[type='text'] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            padding: 10px 15px;
            background-color: #5cb85c;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        button:hover {
            background-color: #4cae4c;
        }

        table {
            width: 95%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Search Request Data</h1>
    
    <form action='ViewRequestData' method='post'>
        <input type='text' name='search' placeholder='Search Request Data' value='<%= (request.getAttribute("value") != null) ? request.getAttribute("value") : "" %>' required>
        <button type='submit'>Search</button>
    </form>
    <br><br>

    <table>
        <tr>
            <th>RequestID</th>
            <th>ISBN</th>
            <th>RequestBook</th>
            <th>Genre</th>
            <th>UserID</th>
            <th>UserName</th>
            <th>Phone</th>
            <th>RequestDate</th>
            <th>Status</th>
            <th>CONTROL</th>
        </tr>
        <%
            List<UserRequest> userRequests = (List<UserRequest>) request.getAttribute("req");
            if (userRequests != null) {
                for (UserRequest userRequest : userRequests) {
                    out.println("<tr>" +
                        "<td>" + userRequest.getRid() + "</td>" +
                        "<td>" + userRequest.getIsbn() + "</td>" +
                        "<td>" + userRequest.getBookname() + "</td>" +
                        "<td>" + userRequest.getGenre() + "</td>" +
                        "<td>" + userRequest.getUid() + "</td>" +
                        "<td>" + userRequest.getUsername() + "</td>" +
                        "<td>" + userRequest.getPhone() + "</td>" +
                        "<td>" + userRequest.getRequestDate() + "</td>" +
                        "<td>" + userRequest.getStatus() + "</td>" +
                        "<td><a href='Accept_CheckOut?rid=" + userRequest.getRid() + "&status=Accepted'>Accept</a> | " +
                        "<a href='Accept_CheckOut?rid=" + userRequest.getRid() + "&status=CheckedOut'>Checked Out</a></td>" +
                    	"</tr>");
                }
            } else {
                out.println("<tr><td colspan='10'>No Data found</td></tr>");
            }
        %>
    </table>
</body>
</html>