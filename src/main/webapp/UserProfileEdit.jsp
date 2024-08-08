<%@page import="PKG1.EncryptAndDecrypt"%>
<%@page import="PKG1.ProcessManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="PKG1.ProcessManager" %>
<%@ page import="PKG1.Register" %>
<%
    int currentID = Integer.parseInt(request.getParameter("uid"));
    
    Register rg = new ProcessManager().fetchData(currentID);
    String decryptedPassword = "";
    try {
        if (rg.getPassword() != null) {
            decryptedPassword = new EncryptAndDecrypt().decrypt_data(rg.getPassword());
        }
    } catch (Exception e) {
        decryptedPassword = "ErrorDecrypting";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        p {
            margin-bottom: 15px;
        }

        input[type='text'], input[type='date'], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        button {
            padding: 10px 15px;
            background-color: #5cb85c;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #4cae4c;
        }

        .textbox-n {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        #studentField {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>Edit Profile</h1>
    <form action='UserProfileData' method='post'>
        <p>University ID: <input type='text' name='uid' placeholder='UID' value='<%= rg.getUID() %>' required></p>
        <p>Name: <input type='text' name='name' placeholder='Name' value='<%= rg.getName() %>' required></p>
        
        <input type='hidden' name='role' id='roleSelect' value='<%= rg.getRole() %>'>
        
        <p id='studentField' style='<%= "Student".equals(rg.getRole()) ? "display:block;" : "display:none;" %>'>
            Level:
            <select name='level'>
                <option value='' disabled hidden>Select Level</option>
                <option value='L4' <%= "L4".equals(rg.getLevel()) ? "selected" : "" %>>L4</option>
                <option value='L5' <%= "L5".equals(rg.getLevel()) ? "selected" : "" %>>L5</option>
                <option value='L6' <%= "L6".equals(rg.getLevel()) ? "selected" : "" %>>L6</option>
            </select>
        </p>
        
        <p>Phone: <input type='text' name='phone' placeholder='Phone' 
                  pattern="\d{10}" 
                  title="Please enter exactly 10 digits" 
                  value='<%= rg.getPhone() %>'
                  required></p>
        <p>Date of Birth: <input placeholder='Date of Birth' class='textbox-n' type='text' onfocus="(this.type='date')" onblur="(this.type='text')" name='date' value='<%= rg.getDOB() %>' required></p>
        <p>Address: <input type='text' name='address' placeholder='Address' value='<%= rg.getAddress() %>' required></p>
        
        <button type='submit'>Save Changes</button>
    </form>
</body>
</html>