<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/8a6f1db44c.js" crossorigin="anonymous"></script>
    <title>Library Management System</title>
    <link rel="icon" href="/MainLibaryProject/Company.png" type="image/png">

    <style>
        @charset "UTF-8";
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap');

        body {
            background: linear-gradient(135deg, red 0%, black 100%);
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 0;
        }

        .ChangePassword {
            background-color: #fff5e6;
            border-radius: 20px;
            padding: 50px;
            text-align: center;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            max-width: 450px;
            width: 100%;
            transform: scale(1);
            transition: transform 0.3s ease;
        }

        .ChangePassword:hover {
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
    </style>
</head>
<body>
    <div class="ChangePassword">
        <h1>Change Password</h1>
        <form action="UpdatePassword" method="post">
            <input type="hidden" name="email" value="<%= session.getAttribute("email")%>">
            <p class='password-container'><input type='password' name='pass1' placeholder='New Password' id='password1' class='textarea' required><i class='fa-regular fa-eye-slash' id='eyeicon1'></i></p>
            <p class='password-container'><input type='password' name='pass2' placeholder='Re-Type New Password' id='password2' class='textarea' required><i class='fa-regular fa-eye-slash' id='eyeicon2'></i></p>
            <button type="submit">Reset Password</button>
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let eyeicon1 = document.getElementById('eyeicon1');
            let password1 = document.getElementById('password1');
            eyeicon1.addEventListener('click', () => {
                if (password1.type === 'password') {
                    password1.type = 'text';
                    eyeicon1.classList.remove('fa-eye-slash');
                    eyeicon1.classList.add('fa-eye');
                } else {
                    password1.type = 'password';
                    eyeicon1.classList.remove('fa-eye');
                    eyeicon1.classList.add('fa-eye-slash');
                }
            });

            let eyeicon2 = document.getElementById('eyeicon2');
            let password2 = document.getElementById('password2');
            eyeicon2.addEventListener('click', () => {
                if (password2.type === 'password') {
                    password2.type = 'text';
                    eyeicon2.classList.remove('fa-eye-slash');
                    eyeicon2.classList.add('fa-eye');
                } else {
                    password2.type = 'password';
                    eyeicon2.classList.remove('fa-eye');
                    eyeicon2.classList.add('fa-eye-slash');
                }
            });
        });
    </script>
</body>
</html>