<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/8a6f1db44c.js" crossorigin="anonymous"></script>

    <title>Pustak-A-Laya - Library Management System</title>
    <link rel="icon" href="/MainLibraryProject/Company.png" type="image/png">

    <style>
        @charset "UTF-8";
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap');

        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            background: #000;
            overflow: hidden;
            position: relative;
            color: white;
            text-align: center;
        }

        .video-background {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 100%;
            height: 100%;
            object-fit: cover;
            transform: translate(-50%, -50%);
            z-index: -1;
            filter: brightness(50%);
        }

        .header, .features, .cta {
            transition: opacity 0.5s ease-out, transform 0.5s ease-out;
        }

        .header {
            z-index: 1;
            margin-bottom: 20px;
        }

        .header h1 {
            font-size: 50px;
            color: #ff4500;
            margin: 0;
        }

        .header p {
            font-size: 20px;
            color: #ff9966;
            margin: 10px 0 30px;
        }

        .features {
            z-index: 1;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap; /* Ensures boxes wrap to the next line if necessary */
            width: 80%;
            margin-bottom: 40px;
            gap: 20px; /* Adds space between the feature boxes */
            padding: 10px;
        }

        .feature {
            background-color: rgba(255, 245, 230, 0.9);
            padding: 20px;
            border-radius: 15px;
            flex: 1 1 30%; /* Allows boxes to resize while maintaining 3-per-row layout */
            max-width: 30%; /* Prevents the boxes from growing too large */
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
        }

        @media (max-width: 768px) {
            .feature {
                flex: 1 1 45%; /* Reduces the box width on smaller screens */
                max-width: 45%;
            }
        }

        @media (max-width: 480px) {
            .feature {
                flex: 1 1 100%; /* Stacks the boxes vertically on very small screens */
                max-width: 100%;
            }
        }

        .feature h3 {
            font-size: 24px;
            color: #ff4500;
            margin-bottom: 10px;
        }

        .feature p {
            font-size: 16px;
            color: #333;
        }

        .cta {
            z-index: 1;
            margin-top: 20px;
        }

        .cta button {
            padding: 15px 30px;
            font-size: 18px;
            background-color: #ff4500;
            border: none;
            border-radius: 10px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .cta button:hover {
            background-color: #cc3300;
        }

        .login {
            background-color: rgba(255, 245, 230, 0.9);
            border-radius: 20px;
            padding: 50px;
            text-align: center;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            max-width: 450px;
            width: 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0);
            opacity: 0;
            transition: transform 0.5s ease-out, opacity 0.5s ease-out;
            z-index: 2;
        }

        .textarea {
            outline: none;
            padding: 12px 15px;
            border-radius: 10px;
            border: 2px solid #ff9966;
            background: #fff9f3;
            width: 100%;
            font-size: 14px;
            margin-bottom: 20px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .textarea:focus {
            border-color: #ff6347;
            box-shadow: 0 0 8px rgba(255, 99, 71, 0.2);
        }

        h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 30px;
            color: #ff4500;
            margin-bottom: 30px;
        }

        a {
            color: #ff6347;
            font-weight: 500;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #cc3300;
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
            margin-top: 10px;
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

        .password-container {
            position: relative;
            width: 95%;
        }

        .password-container input {
            padding-right: 40px;
        }

        .password-container i {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #ff9966;
            transition: color 0.3s ease;
        }

        .password-container i:hover {
            color: #ff4500;
        }

        .error {
            color: #ff4500;
            font-weight: 500;
            margin-top: 15px;
            animation: shake 0.3s ease;
        }

        .check {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .check label {
            font-size: 14px;
            color: #ff9966;
        }

        .check input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: #ff6347;
        }
    </style>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/8a6f1db44c.js" crossorigin="anonymous"></script>

    <title>Pustak-A-Laya - Library Management System</title>
    <link rel="icon" href="/MainLibraryProject/Company.png" type="image/png">

</head>

<body>
    <video class="video-background" autoplay muted loop>
        <source src="LibVideo.mp4" type="video/mp4">
    </video>

    <div class="header" id="header">
        <h1>Welcome to Pustak-A-Laya</h1>
        <p>Your Ultimate Library Management System</p>
    </div>

    <div class="features" id="features">
        <div class="feature">
            <h3>Manage Books</h3>
            <p>Easily add, remove, and categorize books in the library's inventory.</p>
        </div>
        <div class="feature">
            <h3>User Management</h3>
            <p>Track active users, their activities, and manage user data effortlessly.</p>
        </div>
        <div class="feature">
            <h3>Requests & Returns</h3>
            <p>Handle book requests and returns smoothly with an intuitive interface.</p>
        </div>
    </div>

    <div class="cta" id="cta">
        <button onclick="showLogin()">Get Started</button>
    </div>

    <div class="login">
        <h1>Library Login</h1>
        <form action='RecieveLoginData' method='post'>
            <p><input type='number' name='uid' placeholder='University ID' class='textarea' required></p>
            <p class='password-container'><input type='password' name='password' placeholder='Password' id='password' class='textarea' required><i class='fa-regular fa-eye-slash' id='eyeicon'></i></p>
            <p class='check'><span><input type="checkbox" name='addCookie' value='yes'>Remember me</span><a href='MailSend.jsp'>Forgot Password?</a></p>
            <button type='submit'>Login</button>
            <p><a href='RegisterUser.jsp'>Don't have an account? Sign up</a></p>

        <!-- Sign Up button that redirects to RegisterUser.jsp -->
        <button onclick="window.location.href='RegisterUser.jsp'" style="background-color: #ff9966; margin-top: 10px;">Sign Up</button>
    </div>

    <script>
    
    function showLogin() {
        const loginBox = document.querySelector('.login');
        const header = document.getElementById('header');
        const features = document.getElementById('features');
        const cta = document.getElementById('cta'); 
        
        loginBox.style.transform = 'translate(-50%, -50%) scale(1)';
        loginBox.style.opacity = '1';
        header.style.opacity = '0';
        header.style.transform = 'translateY(-30px)';
        features.style.opacity = '0';
        features.style.transform = 'translateY(-30px)';
        cta.style.opacity = '0';
        cta.style.transform = 'translateY(-30px)';
    }
        function togglePassword() {
            const passwordField = document.querySelector('.password-container input');
            const eyeIcon = document.querySelector('.password-container i');
            if (passwordField.type === "password") {
                passwordField.type = "text";
                eyeIcon.classList.replace('fa-eye', 'fa-eye-slash');
            } else {
                passwordField.type = "password";
                eyeIcon.classList.replace('fa-eye-slash', 'fa-eye');
            }
        }
    </script>
</body>

</html>