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
        @charset "UTF-8";
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #333 0%, #111 100%);
            color: #f0f0f0;
        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(0, 0, 0, 0.8);
            padding: 15px 30px;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            z-index: 1000;
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
            margin: 0 10px;
            position: relative;
        }

        .nav ul li a {
            color: #f0f0f0;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav ul li a:hover {
            color: #ff6347;
        }

        .nav .dropdown-content {
            display: none;
            position: absolute;
            background-color: #333;
            min-width: 160px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            z-index: 1;
            border-radius: 5px;
        }

        .nav .dropdown-content a {
            color: #f0f0f0;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .nav .dropdown-content a:hover {
            background-color: #575757;
        }

        .nav .dropdown:hover .dropdown-content {
            display: block;
        }

        .helpbox {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 80px); /* Adjust height based on the nav height */
            padding: 20px;
        }

        .box {
            background: #fff;
            color: #333;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center;
            max-width: 600px;
            width: 100%;
        }

        .box p {
            margin: 15px 0;
            font-size: 18px;
        }

        .box .link {
            color: #ff6347;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .box .link:hover {
            color: #cc3300;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .nav ul {
                flex-direction: column;
                align-items: flex-start;
            }

            .nav ul li {
                margin: 5px 0;
            }

            .nav .dropdown-content {
                position: static;
                box-shadow: none;
            }

            .helpbox {
                height: auto;
                padding: 15px;
            }

            .box {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

    <div class="nav">
        <div class="flexleft">
            <a href="ClientSite.jsp"><img src="Logo.png" width="190" height="60" class="img"></a>
            <ul>
                <li><a href="ClientSite.jsp">Home</a></li>
                <li class="dropdown">
                    <a href="#">Book</a>
                    <ul class="dropdown-content">
                        <li><a href="#">Fiction</a></li>
                        <li><a href="#">Non-Fiction</a></li>
                        <li><a href="#">Sci-Fi</a></li>
                    </ul>
                </li>
                <li><a href="LibraryStatus.jsp">Library Status</a></li>
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

    <div class='helpbox'>
        <div class='box'>
            <p>Mail: <a class='link' href='https://mail.google.com/mail/u/0/#inbox?compose=DmwnWrRlRZMKCnXjJxlbqGBHdgnfXpWpdxKQhlRdlxsJndCbdlChpKtNtsHRrGGgZhpfQwcqjwtb'> connect@patancollege.org</a></p>
            <p>Phone: 01-5181033</p>
            <p>Address: <a class='link' href='https://www.google.com/maps/place/Patan+College+For+Professional+Studies/@27.6844649,85.3144361,17z/data=!3m1!4b1!4m6!3m5!1s0x39eb19b5ad9b8dff:0x12a4b82675e789a3!8m2!3d27.6844602!4d85.317011!16s%2Fg%2F11dxkz07qw?entry=ttu'>Kupondole Rd 162, Patan 44700, Lalitpur 44700</a></p>
        </div>
    </div>

    <script>
        function confirmLogout() {
            return confirm("Are you sure you want to log out?");
        }
    </script>
</body>
</html>