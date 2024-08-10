<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/8a6f1db44c.js" crossorigin="anonymous"></script>
    <title>Library Management System</title>
    <link rel="icon" href="Company.png" type="image/png">
    <style>
        @charset "ISO-8859-1";
        body {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            scroll-behavior: smooth;
            font-family: 'Poppins', sans-serif;
            background-color: #b3e5fc; /* Light blue background */
            color: #000000; /* Black text */
        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #0288d1; /* Strong blue background */
            border-bottom: 2px solid #ffffff; /* White border */
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
        }

        .flexleft, .flexright {
            display: flex;
            align-items: center;
        }

        .flexright ul {
            display: flex;
            gap: 15px;
            list-style: none;
        }

        ul {
            display: flex;
            gap: 20px;
            padding: 10px;
            list-style: none;
            align-items: center;
        }

        ul li {
            position: relative;
        }

        ul li a {
            text-decoration: none;
            color: #ffffff; /* White text */
            text-transform: uppercase;
            font-weight: 500;
            padding: 8px 12px;
            transition: background 0.3s ease;
        }

        ul li a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 5px;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #0288d1; /* Strong blue background */
            border-radius: 5px;
            min-width: 160px;
            z-index: 1;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .dropdown-content li {
            display: block;
        }

        .dropdown-content li a {
            padding: 10px 15px;
            text-align: left;
            display: block;
        }

        .dropdown-content li a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 5px;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .image {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            gap: 20px;
        }

        .image img {
            width: 200px;
            height: 300px;
            border-radius: 15px;
            overflow: hidden;
            border: 2px solid #ffffff; /* White border */
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            transition: transform 0.5s ease;
        }

        .image img:hover {
            transform: scale(1.3);
        }

        .content {
            display: flex;
            justify-content: center;
            margin: 35px 0;
        }

        .search {
            display: flex;
            align-items: center;
            background-color: #ffffff; /* White background */
            border-radius: 50px;
            padding: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .search input {
            outline: none;
            padding: 10px 20px;
            width: 18em;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            color: #000000; /* Black text */
            background: #b3e5fc; /* Light blue background */
            margin-right: 10px;
        }

        .search button {
            border: none;
            background: none;
            color: #0288d1; /* Strong blue color */
            font-size: 20px;
            cursor: pointer;
        }

        .card {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .card a {
            display: block;
            background: #0288d1; /* Strong blue background */
            padding: 15px 30px;
            margin: 0 10px;
            border-radius: 10px;
            text-transform: uppercase;
            text-align: center;
            transition: background 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            color: #ffffff; /* White text */
        }

        .card a:hover {
            background: #01579b; /* Darker blue */
        }

        @media (max-width: 768px) {
            .nav {
                flex-direction: column;
                align-items: flex-start;
                padding: 15px;
            }

            .flexleft ul, .flexright ul {
                flex-direction: column;
                align-items: flex-start;
            }

            .image {
                flex-direction: column;
                align-items: center;
            }

            .search input {
                width: 100%;
            }

            .card {
                flex-direction: column;
            }

            .card a {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="nav">
        <div class="flexleft">
            <a href="ClientSite.jsp"><img src="Logo.png" width="150" height="50" class="img"></a>
            <ul>
                <li><a href="ClientSite.jsp">Home</a></li>
                <li class="dropdown">
                    <a href="AllBooks.jsp">Book</a>
                    <ul class="dropdown-content">
                        <li><a href="#">Fiction</a></li>
                        <li><a href="#">Non-Fiction</a></li>
                        <li><a href="#">Sci-Fi</a></li>
                    </ul>
                </li>
                <li><a href="RequestBook">Request Book</a></li>
                <li><a href="Contact.jsp">Contact</a></li>
            </ul>
        </div>
        <div class="flexright">
            <ul>
                <li><a href="EditProfile.jsp"><i class="fa-solid fa-user"></i>Profile</a></li>
                <li><a href="Login.jsp" onclick="return confirmLogout();"><i class="fa-solid fa-arrow-right-from-bracket"></i>LogOut</a></li>
            </ul>
        </div>
    </div>

    <div class="image">
        <img src="harry.jpeg" alt="Harry Potter">
        <img src="lord.jpeg" alt="Lord of the Rings">
        <img src="silent.jpeg" alt="The Silent Patient">
        <img src="murakami.jpeg" alt="Another Book">
    </div>

    <div class="content">
        <div class="search">
            <form action="SearchBookData" method="post">
                <input type="text" name="search" placeholder="Search Books" required>
                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
    </div>

    <div class="card">
        <a href='RequestBook'>Request Book</a>
        <a href='BookStatus'>Request Status</a>
    </div>

    <script>
        function confirmLogout() {
            return confirm("Are you sure you want to log out?");
        }
    </script>
</body>
</html>