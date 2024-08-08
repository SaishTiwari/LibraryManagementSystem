<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/8a6f1db44c.js" crossorigin="anonymous"></script>
    
    <title>Library Management System</title>
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
            height: 100vh;
            background: #000;
            overflow: hidden;
            position: relative; /* Make sure the video is positioned relative to the body */
        }

        .video-background {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 100%; /* Set width to 100% of its container */
            height: auto; /* Maintain aspect ratio */
            max-width: 1200px; /* Limit maximum width */
            max-height: 100vh; /* Limit maximum height */
            transform: translate(-50%, -50%);
            object-fit: cover;
            z-index: -1;
            padding: 20px; /* Optional padding */
            box-sizing: border-box;
        }

        .login {
            background-color: rgba(255, 245, 230, 0.9); /* Semi-transparent background */
            border-radius: 20px;
            padding: 50px;
            text-align: center;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            max-width: 450px;
            width: 100%;
            position: relative;
            transform: scale(1);
            transition: transform 0.3s ease;
        }

        .login:hover {
            transform: scale(1.05);
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

        @keyframes shake {
            0% {
                transform: translateX(0);
            }
            25% {
                transform: translateX(-5px);
            }
            50% {
                transform: translateX(5px);
            }
            75% {
                transform: translateX(-5px);
            }
            100% {
                transform: translateX(0);
            }
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
</head>
<body>
    <video class="video-background" autoplay muted loop>
        <source src="LibVideo.mp4" type="video/mp4">

    </video>
    <div class="login">
        <h1>Library Login</h1>
        <form action='RecieveLoginData' method='post'>
            <p><input type='number' name='uid' placeholder='University ID' class='textarea' required></p>
            <p class='password-container'><input type='password' name='password' placeholder='Password' id='password' class='textarea' required><i class='fa-regular fa-eye-slash' id='eyeicon'></i></p>
            <p class='check'><span><input type="checkbox" name='addCookie' value='yes'>Remember me</span><a href='MailSend.jsp'>Forgot Password?</a></p>
            <button type='submit'>Login</button>
            <p><a href='RegisterUser.jsp'>Don't have an account? Sign up</a></p>
            
            <script>
    document.addEventListener('DOMContentLoaded', function() {
        let eyeicon = document.getElementById('eyeicon');
        let password = document.getElementById('password');
        eyeicon.addEventListener('click', () => {
            if (password.type === 'password') {
                password.type = 'text';
                eyeicon.classList.remove('fa-eye-slash');
                eyeicon.classList.add('fa-eye');
            } else {
                password.type = 'password';
                eyeicon.classList.remove('fa-eye');
                eyeicon.classList.add('fa-eye-slash');
            }
        });
    });
</script>
</body>
</html>

