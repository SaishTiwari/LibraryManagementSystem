<%@page import="PKG1.Register"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Users</title>
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
            text-align: center;
            margin-bottom: 20px;
        }

        input[type='text'] {
            padding: 10px;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-right: 10px;
        }

        button {
            padding: 10px 15px;
            background-color: #5cb85c;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #4cae4c;
        }

        table {
            width: 95%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        p {
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Search User</h1>
    
    <form action='SearchData' method='post'>
        <input type='text' name='search' value='<%= (request.getAttribute("value") != null) ? request.getAttribute("value") : "" %>' required>
        <button type='submit'>Search</button>
    </form>
    <br><br>

    <table width='95%' border="1">
        <tr>
            <th>UID</th>
            <th>NAME</th>
            <th>Address</th>
            <th>LEVEL</th>
            <th>DOB</th>
            <th>ROLE</th>
            <th>EMAIL</th>
            <th>PHONE</th>
            <th>REGISTERDT</th>
            <th>UDATEDT</th>
            <th>CONTROL</th>
        </tr>
        <%
            List<Register> users = (List<Register>) request.getAttribute("users");
            if (users != null) {
                for (Register user : users) {
                    out.println("<tr>" +
                        "<td>" + user.getUID() + "</td>" +
                        "<td>" + user.getName() + "</td>" +
                        "<td>" + user.getAddress() + "</td>" +
                        "<td>" + user.getLevel() + "</td>" +
                        "<td>" + user.getDOB() + "</td>" +
                        "<td>" + user.getRole() + "</td>" +
                        "<td>" + user.getEmail() + "</td>" +
                        "<td>" + user.getPhone() + "</td>" +
                        "<td>" + user.getRegDateTime() + "</td>" +
                        "<td>" + user.getUpDateTime() + "</td>" +
                        "<td><a href='UserProfileEdit.jsp?uid=" + user.getUID() + "'>EDIT</a> | " +
                            "<a href='ExportIndu?uid=" + user.getUID() + "'>EXPORT</a></td>" +
                        "</tr>");
                }
            } else {
                out.println("<tr><td colspan='11'>No users found</td></tr>");
            }
        %>
    </table>
    <p><a href='ExportAllUser'>Export All</a></p>
</body>
</html>