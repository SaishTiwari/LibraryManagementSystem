<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="RegisterUser.css">
    <link rel="icon" href="/MainLibaryProject/Company.png" type="image/png">
    <title>Library Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .Register {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 500px;
            width: 100%;
            text-align: center;
        }

        .Register h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .Register form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .Register p {
            margin: 10px 0;
            width: 100%;
        }

        .Register input[type='text'],
        .Register input[type='number'],
        .Register input[type='email'],
        .Register input[type='password'],
        .Register select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
            max-width: 400px;
        }

        .Register button {
            background-color: #4a90e2;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.2s;
            width: 100%;
            max-width: 400px;
        }

        .Register button:hover {
            background-color: #357ABD;
            transform: scale(1.05);
        }

        .Register .textbox-n {
            width: 100%;
            max-width: 400px;
        }
    </style>
</head>
<body>
    <div class="Register">
        <h1>Library Registration</h1>
        <form action="Validation" method="post">
            <p><input type="text" name="uid" placeholder="UID" required></p>
            <p><input type="text" name="name" placeholder="Name" required></p>
            <p>
                <select name="role" id="roleSelect" onchange="toggleStaffField()" required>
                    <option value="" disabled selected hidden>Select Role</option>
                    <option value="Staff">Staff</option>
                    <option value="Student">Student</option>
                </select>
            </p>
            <p id="studentField" style="display:none;">
                <select name="level">
                    <option value="" disabled selected hidden>Select Level</option>
                    <option value="L4">L4</option>
                    <option value="L5">L5</option>
                    <option value="L6">L6</option>
                </select>
            </p>
            <p><input type="number" name="phone" placeholder="Phone" pattern="\d{10}" title="Please enter exactly 10 digits" required></p>
            <p><input placeholder="Date of Birth" class="textbox-n" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" name="date" required></p>
            <p><input type="text" name="address" placeholder="Address" required></p>
            <p><input type="email" name="mail" placeholder="Email" required></p>
            <p><input type="password" name="password" placeholder="Password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" title="Password must be at least 8 characters long and include at least one letter, one number, and one special character (e.g., @, $, !, %, *, ?, &)." required></p>
            <p><input type="number" name="teacherCode" placeholder="Teacher Registration Code" id="staffField" style="display:none"></p>
            <button type="submit">Sign Up</button>
        </form>
    </div>

    <script>
        function toggleStaffField() {
            var role = document.getElementById('roleSelect').value;
            var studentField = document.getElementById('studentField');
            var staffField = document.getElementById('staffField');
            var levelSelect = document.querySelector("select[name='level']");
            
            if (role === 'Student') {
                studentField.style.display = 'block';
                staffField.style.display = 'none';
                document.getElementById('staffField').value = ''; // Clear teacher code field
            } else if (role === 'Staff') {
                staffField.style.display = 'inline';
                studentField.style.display = 'none';
                levelSelect.selectedIndex = 0; // Reset level select field
            } else {
                staffField.style.display = 'none';
            }
        }
    </script>
</body>
</html>