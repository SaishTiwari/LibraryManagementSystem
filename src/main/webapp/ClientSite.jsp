<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/8a6f1db44c.js" crossorigin="anonymous"></script>
    <title>Libary Management System</title>
    <link rel="icon" href="Company.png" type="image/png">
	<style>
		@charset "ISO-8859-1";
body {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    scroll-behavior: smooth;
    background-image: linear-gradient(120deg,purple,cyan);
    background-repeat: no-repeat;
    background-position: center;
    background-attachment: fixed;
}

.nav {
    display: flex;
    justify-content: space-between;
    background: linear-gradient(135deg, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
    border:1px solid rgba(255, 255, 255, 0.18);
    box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
}

.flexleft {
    display: flex;
}

ul {
    display: flex;
    gap: 18px;
    padding: 10px;
    justify-content: center;
    align-items: center;
    list-style: none;
}

a {
    text-decoration: none;
    color: white;
}

.img {
    padding-top: 7px;
}

i {
    padding-right: 6px;
}

li{
    text-transform: uppercase ;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: rgb(121, 115, 115);
    min-width: 160px;
    box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
    z-index: 1;
}

.dropdown-content li {
    display: block;
}

.dropdown-content li a {
    padding: 10px 15px;
}

.dropdown-content li a:hover {
    background-color: rgb(105, 100, 100);
}

.dropdown:hover .dropdown-content {
    display: block;
}

.imageslider{
    width: 50vw;
    height: 40vh;
    background-image: url(atomic.jpeg);
    background-position: center;
    background-repeat: no-repeat;
    animation-name: image;
    animation-duration: 6s;
    animation-delay: 3s;
    animation-iteration-count: infinite;
}

@keyframes image {
    0%   {background-image: url(harry.jpeg);}
  50%  {background-image: url(lord.png);}
  100% {background-image: url(silent.jpeg);}
}

.image{
    display: flex;
    justify-content: center;
}

.imageslider{
    border: 2px solid black;
    margin-top: 10px;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}

.content{
    display: flex;
    justify-content: center;
    margin-top: 35px;
}

.search{
    border: 3px solid white;
    border-radius: 9px;
}

.search input{
    outline: none;
    padding: 5px;
    width: 22em;
    border: none;
}

button{
    border: none;
}

form{
    display: flex;
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
                <li><a href="LibaryStatus.jsp">LibaryStatus</a></li>
                <li><a href="Contact.jsp">Contact</a></li>
            </ul>
        </div>
        <div class="flexright">
            <ul>
                <li><a href="EditProfile.jsp"><i class="fa-solid fa-user"></i>Profile</a></li>
                <li><a href="Login.jsp" onclick="return confirmLogout();"><i class="fa-solid fa-arrow-right-from-bracket"></i>LogOut</a></li>
            </ul>
        </div>
    </div>

    <div class="image">
        <div class="imageslider">
        </div>
    </div>

    <div class="content">
        <div class="search">
            <form action="SearchBookData" method="post">
                <input type="text" name="search" placeholder="Search Books" required>
                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
        
        
    </div>
    
    <div class="card">
			<a href='RequestBook'>RequestBook</a><br><br>
			<a href='BookStatus'>RequestStatus</a>
        </div>
    
    <script>
	    function confirmLogout() {
	        return confirm("Are you sure you want to log out?");
	    }
    </script>
</body>
</html>