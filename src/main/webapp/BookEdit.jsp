<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="PKG1.ProcessManager" %>
<%@ page import="PKG1.AddBooks" %>
<%
    String isbnParam = request.getParameter("isbn");
    AddBooks book = null;

    if (isbnParam != null && !isbnParam.trim().isEmpty()) {
        try {
            int isbn = Integer.parseInt(isbnParam);
            book = new ProcessManager().fetchBookData(isbn);
        } catch (NumberFormatException e) {
            // Handle the case where the ISBN is not a valid integer
            out.println("<p>Invalid ISBN number.</p>");
        }
    } else {
        // Handle the case where the ISBN parameter is missing or empty
        out.println("<p>No ISBN provided.</p>");
    }
%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Book Edit</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #ff0000 0%, #000000 100%);
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 0;
        }

        .form-container {
            background-color: #ffffff;
            border-radius: 20px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            max-width: 450px;
            width: 100%;
            transform: scale(1);
            transition: transform 0.3s ease;
        }

        .form-container:hover {
            transform: scale(1.05);
        }

        input, select {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0;
            border-radius: 10px;
            border: 2px solid #ff0000;
            background: #ffffff;
            font-size: 14px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input:focus, select:focus {
            border-color: #cc0000;
            box-shadow: 0 0 8px rgba(204, 0, 0, 0.2);
            outline: none;
        }

        button {
            width: 100%;
            padding: 12px;
            text-align: center;
            border-radius: 10px;
            background-color: #cc0000;
            color: white;
            font-weight: 500;
            border: none;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            margin-top: 20px;
            position: relative;
            overflow: hidden;
        }

        button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 200%;
            height: 100%;
            background: rgba(255, 255, 255, 0.2);
            transform: skewX(-30deg);
            transition: left 0.5s ease;
        }

        button:hover::before {
            left: 100%;
        }

        button:hover {
            background-color: #b30000;
            box-shadow: 0 8px 16px rgba(179, 0, 0, 0.3);
        }

        h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 30px;
            color: #cc0000;
            margin-bottom: 30px;
            position: relative;
            animation: slideIn 0.6s ease-out forwards;
            opacity: 0;
        }

        @keyframes slideIn {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Edit Book Details</h1>
        <form action='BookEdit' method='post'>
            <p><input type='number' name='isbn' value='<%= (book != null ? book.getISBN() : "") %>' placeholder='ISBN' required></p>
            <p><input type='text' name='name' value='<%= (book != null ? book.getName() : "") %>' placeholder='Book Name' required></p>
            <p>
                <select name='type' required>
                    <option value='' disabled selected hidden>Select Book Genre</option>
                    <option value='Fiction'<%= (book != null && "Fiction".equals(book.getType())) ? "selected" : "" %>>Fiction</option>
                    <option value='Non-Fiction'<%= (book != null && "Non-Fiction".equals(book.getType())) ? "selected" : "" %>>Non-Fiction</option>
                    <option value='Science Fiction'<%= (book != null && "Science Fiction".equals(book.getType())) ? "selected" : "" %>>Science Fiction</option>
                    <option value='Fantasy'<%= (book != null && "Fantasy".equals(book.getType())) ? "selected" : "" %>>Fantasy</option>
                    <option value='Mystery'<%= (book != null && "Mystery".equals(book.getType())) ? "selected" : "" %>>Mystery</option>
                    <option value='Biography'<%= (book != null && "Biography".equals(book.getType())) ? "selected" : "" %>>Biography</option>
                    <option value='History'<%= (book != null && "History".equals(book.getType())) ? "selected" : "" %>>History</option>
                    <option value='Self-Help'<%= (book != null && "Self-Help".equals(book.getType())) ? "selected" : "" %>>Self-Help</option>
                </select>
            </p>
            <p><input type='text' name='author' value='<%= (book != null ? book.getAuthor() : "") %>' placeholder='Author' required></p>
            <p><input type='text' name='publication' value='<%= (book != null ? book.getPublication() : "") %>' placeholder='Publication' required></p>
            <p><input type='number' name='quantity' value='<%= (book != null ? book.getQuantity() : "") %>' placeholder='Quantity' required></p>
            <button type='submit'>Save Changes</button>
        </form>
    </div>
</body>
</html>