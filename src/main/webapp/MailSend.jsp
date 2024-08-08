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
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .MailBlock {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        .MailBlock h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .MailBlock form {
            display: flex;
            flex-direction: column;
        }

        .MailBlock input[type="email"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 16px;
        }

        .MailBlock button {
            background-color: #4a90e2;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .MailBlock button:hover {
            background-color: #357ABD;
            transform: scale(1.05);
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