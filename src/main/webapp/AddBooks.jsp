<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Add Books</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, blue 0%, white 100%);
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #4a90e2;
            color: #fff;
            padding: 10px 20px;
        }

        .nav .flexleft {
            display: flex;
            align-items: center;
        }

        .nav .flexleft img {
            margin-right: 20px;
        }

        .nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        .nav ul li {
            margin-right: 20px;
        }

        .nav ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }

        .nav ul li a:hover {
            text-decoration: underline;
        }

        .nav .dropdown-content {
            display: none;
            position: absolute;
            background-color: #fff;
            color: #000;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            padding: 10px;
            list-style: none;
            margin: 0;
        }

        .nav .dropdown:hover .dropdown-content {
            display: block;
        }

        .nav .dropdown-content li a {
            color: #000;
            text-decoration: none;
        }

        .nav .dropdown-content li a:hover {
            text-decoration: underline;
        }

        .form-container {
            background-color: #fff5e6;
            border-radius: 20px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            max-width: 450px;
            width: 100%;
            margin: 20px auto;
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
            border: 2px solid #ff9966;
            background: #fff9f3;
            font-size: 14px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input:focus, select:focus {
            border-color: #ff6347;
            box-shadow: 0 0 8px rgba(255, 99, 71, 0.2);
            outline: none;
        }

        button {
            width: 100%;
            padding: 12px;
            text-align: center;
            border-radius: 10px;
            background-color: #ff4500;
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
            background-color: #cc3300;
            box-shadow: 0 8px 16px rgba(204, 51, 0, 0.3);
        }

        h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 30px;
            color: #ff4500;
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
    <div class="nav">
        <div class="flexleft">
            <a href="LiberianDashboard.jsp"><img src="Logo.png" width="190" height="60" class="img"></a>
            <ul>
                <li><a href="LiberianDashboard.jsp">Home</a></li>
                <li class="dropdown">
                    <a href="#">Books</a>
                    <ul class="dropdown-content">
                    	 <li><a href="AllBooks.jsp">All Books</a></li>
                        <li><a href="#">Fiction</a></li>
                        <li><a href="#">Non-Fiction</a></li>
                        <li><a href="#">Science Fiction</a></li>
                        <li><a href="#">Fantasy</a></li>
                        <li><a href="#">Mystery</a></li>
                        <li><a href="#">Biography</a></li>
                        <li><a href="#">History</a></li>
                        <li><a href="#">Self-Help</a></li>
                    </ul>
                </li>
                <li><a href="UserStatus.jsp">User Status</a></li>
                <li><a href="AddBooks.jsp">Add Books</a></li>
                <li><a href="IssueBook.jsp">Issue Book</a></li>
                <li><a href="UserRequests.jsp">User Requests</a></li>
                <li><a href="AllBooks.jsp">All Books</a></li>
            </ul>
        </div>
        <div class="flexright">
            <ul>
                <li><a href="Login.jsp" onclick="return confirmLogout();"><i class="fa-solid fa-arrow-right-from-bracket"></i> Log Out</a></li>
            </ul>
        </div>
    </div>

    <div class="form-container">
        <h1>Add a Book</h1>
        <form action='BookValidation' method='post'>
            <p><input type='number' name='isbn' placeholder='ISBN' required></p>
            <p><input type='text' name='name' placeholder='Book Name' required></p>
            <p>
                <select name='type' required>
                    <option value='' disabled selected hidden>Select Book Genre</option>
                    <option value='Fiction'>Fiction</option>
                    <option value='Non-Fiction'>Non-Fiction</option>
                    <option value='Science Fiction'>Science Fiction</option>
                    <option value='Fantasy'>Fantasy</option>
                    <option value='Mystery'>Mystery</option>
                    <option value='Biography'>Biography</option>
                    <option value='History'>History</option>
                    <option value='Self-Help'>Self-Help</option>
                </select>
            </p>
            <p><input type='text' name='authorname' placeholder='Author Name' required></p>
            <p><input type='text' name='publication' placeholder='Publication' required></p>
            <p><input type='number' name='quantity' placeholder='Quantity' required></p>
            
            <button type='submit'>Add Book</button>
        </form>
    </div>

    <script>
        function confirmLogout() {
            return confirm("Are you sure you want to log out?");
        }
    </script>
</body>
</html>