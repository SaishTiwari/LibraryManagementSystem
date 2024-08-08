<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/8a6f1db44c.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="LiberianDashboard.css">
    <title>Library Management System</title>
   <link rel="icon" href="Company.png" type="image/png">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
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
            position: relative;
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
            top: 100%;
            left: 0;
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

        .image {
            background-color: #ddd;
            padding: 20px;
            text-align: center;
        }

        .content {
            padding: 20px;
        }

        .search {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .search input[type="text"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 300px;
        }

        .search button {
            background-color: #4a90e2;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            margin-left: 10px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        .search button:hover {
            background-color: #357ABD;
            transform: scale(1.05);
        }

        .links {
            text-align: center;
            padding: 20px;
        }

        .links a {
            display: block;
            color: #4a90e2;
            text-decoration: none;
            font-size: 18px;
            margin: 10px 0;
            transition: color 0.3s;
        }

        .links a:hover {
            color: #357ABD;
        }
    </style>
</head>
<body>
    <div class="nav">
        <div class="flexleft">
            <a href="LiberianDashboard.jsp"><img src="greatgatsby.jpeg" width="190" height="60" class="img"></a>
            <ul>
                <li><a href="LiberianDashboard.jsp">Home</a></li>
                <li class="dropdown">
                    <a href="#">Books</a>
                    <ul class="dropdown-content">
                        <li><a href="AllBooks.jsp">All Books</a></li>
                    
                        <li><a href="#">Fiction</a></li>
                        <li><a href="#">Educational</a></li>
                        <li><a href="#">Sci-Fi</a></li>
                        <li><a href="#">Biography</a></li>
                        <li><a href="#">History</a></li>
                        <li><a href="#">Fantasy</a></li>
                    </ul>
                </li>
                <li><a href="UserStatus.jsp">User Status</a></li>
                <li><a href="AddBooks.jsp">Add Books</a></li>
                <li><a href="IssueBook.jsp">Issue Book</a></li>
                <li><a href="ViewRequestData.jsp">User Requests</a></li>
            </ul>
        </div>
        <div class="flexright">
            <ul>
                <li><a href="Login.jsp" onclick="return confirmLogout();"><i class="fa-solid fa-arrow-right-from-bracket"></i> Log Out</a></li>
            </ul>
        </div>
    </div>

    <div class="image">
        <div class="imageslider">
            <!-- Add slider images or content here -->
        </div>
    </div>

    <div class="content">
        <div class="search">
            <form action="#" method="post">
                <input type="text" name="book" placeholder="Search Books" required>
                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
    </div>

    <div class="links">
        <a href='AddBooks.jsp'>Add Books</a>
        <a href='ViewRequestData'>Borrow Requests</a>
        <a href='SearchData'>User List Edit</a>
        <a href='SearchBookData'>Book Status</a>
        <a href='FineSearch'>Fine Tracking</a>
    </div>

    <script>
        function confirmLogout() {
            return confirm("Are you sure you want to log out?");
        }
    </script>
</body>
</html>