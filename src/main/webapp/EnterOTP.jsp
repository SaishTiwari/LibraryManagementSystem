<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="PKG1.Register" %>
<%
	Register rg = (Register) session.getAttribute("rg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Library Management System</title>
    <link rel='stylesheet' href='EnterOTP.css'>
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

        .check {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        .check h1 {
            color: #4a90e2;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        .check p {
            margin: 10px 0;
        }

        .check input[type='number'],
        .check input[type='hidden'] {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            margin-bottom: 15px;
        }

        .check input[type='number'] {
            width: 100%;
            max-width: 200px;
            text-align: center;
        }

        .check button {
            background-color: #4a90e2;
            color: #fff;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        .check button:hover {
            background-color: #357ABD;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class='check'>
        <h1>OTP Verification</h1>
        <form action='Check' method='post'>
            <p><input type='number' name='EnterOTP' placeholder='Enter OTP' required></p>
            <p><input type='hidden' name='uid' value='<%= rg.getUID() %>'></p>
            <p><input type='hidden' name='name' value='<%= rg.getName() %>'></p>
            <p><input type='hidden' name='level' value='<%= rg.getLevel() %>'></p>
            <p><input type='hidden' name='dob' value='<%= rg.getDOB()%>'></p>
            <p><input type='hidden' name='address' value='<%= rg.getAddress() %>'></p>
            <p><input type='hidden' name='role' value='<%= rg.getRole() %>'></p>
            <p><input type='hidden' name='email' value='<%= rg.getEmail() %>'></p>
            <p><input type='hidden' name='password' value='<%= rg.getPassword() %>'></p>
            <p><input type='hidden' name='phone' value='<%= rg.getPhone() %>'></p>
            <p><input type='hidden' name='generatedOTP' value='<%= (Integer)(session.getAttribute("generatedOTP")) %>'></p>
            <button type='submit'>Submit</button>
        </form>
    </div>
</body>
</html>