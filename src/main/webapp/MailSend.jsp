<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="MailSend.css">
    <title>Library Management System</title>
    <link rel="icon" href="/MainLibaryProject/Company.png" type="image/png">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('background-image.jpg'); /* Add your background image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .MailBlock {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            padding: 40px;
            max-width: 450px;
            width: 90%;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .MailBlock:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        }

        .MailBlock h1 {
            color: #4a90e2;
            margin-bottom: 25px;
            font-size: 28px;
            letter-spacing: 1px;
        }

        .MailBlock form {
            display: flex;
            flex-direction: column;
        }

        .MailBlock input[type="email"] {
            padding: 12px;
            border: 2px solid #4a90e2;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 18px;
            outline: none;
            transition: border-color 0.3s;
        }

        .MailBlock input[type="email"]:focus {
            border-color: #357ABD;
        }

        .MailBlock button {
            background-color: #4a90e2;
            color: #ffffff;
            border: none;
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .MailBlock button:hover {
            background-color: #357ABD;
            transform: translateY(-3px);
        }

        /* Responsive adjustments */
        @media (max-width: 600px) {
            .MailBlock {
                padding: 30px;
                max-width: 100%;
            }

            .MailBlock h1 {
                font-size: 24px;
            }

            .MailBlock input[type="email"], .MailBlock button {
                font-size: 16px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="MailBlock">
        <h1>Mail Verification</h1>
        <form action="Verification" method="post">
            <p><input type="email" name="email" placeholder="Enter your email" required></p>
            <button type="submit">Verify</button>
        </form>
    </div>
</body>
</html>