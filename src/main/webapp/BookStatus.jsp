<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="PKG1.AddBooks" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookStatus</title>
</head>
<body>
	<h1>Search Books</h1>
    
    <form action='SearchBookData' method='post'>
        <input type='text' name='search' value='<%= (request.getAttribute("value") != null) ? request.getAttribute("value") : "" %>' required>
        <button type='submit'>Search</button>
    </form>
    <br><br>

    <table width='95%' border="1">
        <tr>
            <td>ISBN</td>
            <td>BookName</td>
            <td>Publication</td>
            <td>Genre</td>
            <td>Quantity</td>
            <td>CONTROL</td>
        </tr>
        <%
            List<AddBooks> books = (List) request.getAttribute("users");
            if (books != null) {
                for (AddBooks book : books) {
                    out.println("<tr>" +
                        "<td>" + book.getISBN() + "</td>" +
                        "<td>" + book.getName() + "</td>" +
                        "<td>" + book.getPublication() + "</td>" +
                        "<td>" + book.getType() + "</td>" +
                        "<td>" + book.getQuantity() + "</td>" +
                        "<td><a href='BookEdit.jsp?isbn=" + book.getISBN() + "'>EDIT</a> | " +
                            "<a href='BookExportIndu?isbn=" + book.getISBN() + "'>EXPORT</a></td>" +
                        "</tr>");
                }
            } else {
                out.println("<tr><td colspan='11'>No Books found</td></tr>");
            }
        %>
    </table>
    <p><a href='ExportAllBooks'>Export All</a></p>
</body>
</html>