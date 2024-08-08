<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="PKG1.UserRequest" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Fine Track</title>
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
    <h1>Search Users</h1>
    
    <form action='FineSearch' method='post'>
        <input type='text' name='search' placeholder='Search Users' value='<%= (request.getAttribute("value") != null) ? request.getAttribute("value") : "" %>' required>
        <button type='submit'>Search</button>
    </form>
    <br><br>

    <table width='95%' border="1">
        <tr>
            <td>UserID</td>
            <td>UserName</td>
            <td>Phone</td>
            <td>Email</td>
            <td>Fine</td>
            <td>CONTROL</td>
        </tr>
        <%
            List<UserRequest> reqs = (List) request.getAttribute("reqs");
            if (reqs != null && !reqs.isEmpty()) {
                for (UserRequest req : reqs) {
                    out.println("<tr>" +
                        "<td>" + req.getUid() + "</td>" +
                        "<td>" + req.getUsername() + "</td>" +
                        "<td>" + req.getPhone() + "</td>" +
                        "<td>" + req.getEmail() + "</td>" +
                        "<td>" + req.getFine() + "</td>" +
                        "<td><a href='DueClear?rid=" + req.getRid() + "&status=PaidOut' onclick='return confirmRequest(\"" + req.getUid() + "\")'>Paid</a> | " +
                        "<a href='DueClear?rid=" + req.getRid() + "&status=BookReturn' onclick='return confirmRequest(\"" + req.getUid() + "\")'>BookReturn</a> | " +
                        "<a href='ExportFine?rid=" + req.getRid() + "'>Export</a></td>" +
                        "</tr>");
                }
            } else {
                out.println("<tr><td colspan='6'>No Users found</td></tr>");
            }
        %>
    </table>
    <p><a href='ExportAllFine'>Export All</a></p>
    <script>
        function confirmRequest(uid) {
            return confirm('Are you sure you want to clear dues for UserID ' + uid + '?');
        }
    </script>
</body>
</html>