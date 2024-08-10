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
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            align-items: center;
            background-image: url('liberainDash.avif');
            background-size: cover;
            background-position: center;
            color: #fff;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6); 
            z-index: 1;
        }

        .nav, .main-content, .image {
            position: relative;
            z-index: 2;        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: rgba(74, 144, 226, 0.8); 
            color: #fff;
            padding: 10px 20px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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

        .main-content {
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.8); 
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            width: 90%;
            margin-top: 20px;
            color: #333;
        }

        .main-content h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
            text-align: center;
        }

        .cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .card {
            background-color: rgba(74, 144, 226, 0.9); 
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: calc(33.333% - 40px);
            text-align: center;
            transition: background-color 0.3s, transform 0.2s;
            color: #fff;
        }

        .card:hover {
            background-color: rgba(53, 122, 189, 0.9); 
            transform: scale(1.05);
        }

        .card a {
            color: #fff;
            text-decoration: none;
            display: block;
            font-size: 20px;
        }

        .card h3 {
            margin-bottom: 10px;
            font-size: 22px;
            color: #fff;
        }

        .card p {
            color: #fff;
            font-size: 18px;
        }

        .image {
            background-color: rgba(221, 221, 221, 0.8); /* Semi-transparent image background */
            padding: 20px;
            text-align: center;
            margin: 40px 0;
            border-radius: 10px;
        }

        .image img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="overlay"></div> <!-- Overlay for darkening the background -->

    <div class="nav">
        <div class="flexleft">
            <a href="LiberianDashboard.jsp"><img src="Logo.png" width="190" height="60" class="img"></a>
            <ul>
                <li><a href="LiberianDashboard.jsp">Home</a></li>
                <li><a href="AllBooks.jsp">All Books</a></li>
                <li><a href="SearchData">User Status</a></li>
                <li><a href="AddBooks.jsp">Add Books</a></li>
                <li><a href="ViewRequestData">User Requests</a></li>
            </ul>
        </div>
        <div class="flexright">
            <ul>
                <li><a href="Login.jsp" onclick="return confirmLogout();"><i class="fa-solid fa-arrow-right-from-bracket"></i> Log Out</a></li>
            </ul>
        </div>
    </div>

    <div class="main-content">
        <h2>Welcome to the Library Management Dashboard</h2>

        <div class="cards">
            <div class="card">
                <a href="AllBooks.jsp">
                    <h3>Total Books</h3>
                    <p>10,000+</p>
                </a>
            </div>
            <div class="card">
                <a href="SearchData">
                    <h3>Active Users</h3>
                    <p>1,200+</p>
                </a>
            </div>
            <div class="card">
                <a href="ViewRequestData">
                    <h3>Pending Requests</h3>
                    <p>45</p>
                </a>
            </div>
        </div>

        <div class="image">
            <img src="liberainDash.avif" alt="Library Image">
        </div>
    </div>

    <script>
        function confirmLogout() {
            return confirm("Are you sure you want to log out?");
        }
    </script>
</body>
</html>