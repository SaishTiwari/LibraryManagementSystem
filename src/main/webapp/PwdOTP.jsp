<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="PwdOTP.css">
    <title>Library Management System</title>
    <link rel="icon" href="/MainLibaryProject/Company.png" type="image/png">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .OTPBLock {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        .OTPBLock h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .OTPBLock form {
            display: flex;
            flex-direction: column;
        }

        .OTPBLock input[type="number"],
        .OTPBLock input[type="hidden"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 16px;
        }

        .OTPBLock button {
            background-color: #4a90e2;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .OTPBLock button:hover {
            background-color: #357ABD;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="OTPBLock">
        <h1>OTP Verification</h1>
        <form action="checkOTP" method="post">
            <p><input type="number" name="otp" placeholder="Enter OTP" required></p>
            <p><input type="hidden" name="genOTP" value="<%= session.getAttribute("generatedOTP") %>" required></p>
            <p><input type="hidden" name="email" value="<%= session.getAttribute("email") %>" required></p>
            <button type="submit">Verify</button>
        </form>
    </div>
</body>
</html>