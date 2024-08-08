<%@page import="PKG1.EncryptAndDecrypt"%>
<%@page import="PKG1.ProcessManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="PKG1.GlobalVar" %>
<%@ page import="PKG1.ProcessManager" %>
<%@ page import="PKG1.Register" %>
<!--UserType Checking-->
<%
	int currentID = GlobalVar.userid;
	if(currentID == 0){
		currentID = (Integer)request.getAttribute("userid");
	}
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/8a6f1db44c.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="EditProfile.css">
    <title>Library Management System</title>
    <link rel="icon" href="Company.png" type="image/png">

    <style>
        @charset "UTF-8";
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f0f0f0, #e0e0e0);
            color: #333;
        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #333;
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

        .customeBody {
            margin-top: 80px; /* Adjust margin based on the nav height */
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
        }

        .edit {
            background: #fff;
            color: #333;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            max-width: 600px;
            width: 100%;
        }

        .edit form p {
            margin: 15px 0;
            font-size: 16px;
        }

        .edit form input[type='text'],
        .edit form input[type='email'],
        .edit form input[type='date'],
        .edit form select {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            margin: 5px 0;
        }

        .edit form input[type='text']::placeholder,
        .edit form input[type='email']::placeholder {
            color: #aaa;
        }

        .edit form button {
            background-color: #ff6347;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .edit form button:hover {
            background-color: #cc3300;
        }

        .textbox-n[type="date"] {
            -webkit-appearance: none;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
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

            .customeBody {
                padding: 15px;
            }

            .edit {
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
                <li><a href="LibaryStatus.jsp">Library Status</a></li>
                <li><a href="Contact.jsp">Contact</a></li>
            </ul>
        </div>
        <div class="flexright">
            <ul>
                <li><a href="#"><i class="fa-solid fa-user"></i>Profile</a></li>
                <li><a href="Login.jsp" onclick="return confirmLogout();"><i class="fa-solid fa-arrow-right-from-bracket"></i>LogOut</a></li>
            </ul>
        </div>
    </div>

    <div class='customeBody'>
        <div class="edit">
            <form action='ReceieveEditData' method='post'>
                <p>University ID: <input type='text' name='uid' placeholder='UID' value='<%= rg.getUID()%>' required></p>
                <p>Name: <input type='text' name='name' placeholder='Name' value='<%= rg.getName() %>' required></p>
                
                <input type='hidden' name='role' id='roleSelect' value='<%= rg.getRole() %>'>
                
                <p id='studentField' style='<%= "Student".equals(rg.getRole()) ? "display:block;" : "display:none;" %>'>Level:
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
                <p>Address: <input type='text' name='address' placeholder='Address' value date’)” onblur=”(this.type=‘text’)” name=‘date’ value=’<%= rg.getDOB() %>’ required>
                <script>
    function confirmLogout() {
        return confirm("Are you sure you want to log out?");
    }
</script>
</body>
</html>
