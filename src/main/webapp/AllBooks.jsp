<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/8a6f1db44c.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="AllBooks.css">
    <title>All Books</title>
    <link rel="icon" href="Company.png" type="image/png">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #4a90e2;
            color: #fff;
            padding: 10px 20px;
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
            margin-right: 20px;
            position: relative;
        }

        .nav ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }

        .nav ul li a:hover {
            text-decoration: underline;
        }

        .nav .dropdown-content {
            display: none;
            position: absolute;
            background-color: #fff;
            color: #000;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            padding: 10px;
            list-style: none;
            margin: 0;
            top: 100%;
            left: 0;
        }

        .nav .dropdown:hover .dropdown-content {
            display: block;
        }

        .nav .dropdown-content li a {
            color: #000;
            text-decoration: none;
        }

        .nav .dropdown-content li a:hover {
            text-decoration: underline;
        }

        .container {
            padding: 20px;
        }

        .book-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .book {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            width: 200px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .book img {
            width: 100%;
            height: auto;
        }

        .book-details {
            padding: 10px;
        }

        .book-details h3 {
            margin: 10px 0;
            font-size: 18px;
        }

        .book-details p {
            margin: 5px 0;
            color: #555;
        }

        .book-details .author {
            font-style: italic;
        }
    </style>
</head>
<body>
    <div class="nav">
        <div class="flexleft">
            <a href="LiberianDashboard.jsp"><img src="Logo.png" width="190" height="60" class="img"></a>
            <ul>
                <li><a href="LiberianDashboard.jsp">Home</a></li>
                <li class="dropdown">
                    <a href="#">Books</a>
                    <ul class="dropdown-content">
                    
                     <li><a href="AllBooks.jsp">All Books</a></li>
                    
                        <li><a href="#">Fiction</a></li>
                        <li><a href="#">Non-Fiction</a></li>
                        <li><a href="#">Sci-Fi</a></li>
                        <li><a href="#">Biography</a></li>
                        <li><a href="#">History</a></li>
                        <li><a href="#">Fantasy</a></li>
                    </ul>
                </li>
                <li><a href="UserStatus.jsp">User Status</a></li>
                <li><a href="AddBooks.jsp">Add Books</a></li>
                <li><a href="IssueBook.jsp">Issue Book</a></li>
                <li><a href="UserRequests.jsp">User Requests</a></li>
            </ul>
        </div>
        <div class="flexright">
            <ul>
                <li><a href="Login.jsp" onclick="return confirmLogout();"><i class="fa-solid fa-arrow-right-from-bracket"></i> Log Out</a></li>
            </ul>
        </div>
    </div>

    <div class="container">
        <h1>All Books</h1>
        <div class="book-list">
            <%-- Sample Data for 50 Books --%>
            <% 
                String[][] books = {
                    {"The Great Gatsby", "F. Scott Fitzgerald", "Fiction", "greatgatsby.jpeg"},
                    {"1984", "George Orwell", "Dystopian", "1984.jpg"},
                    {"To Kill a Mockingbird", "Harper Lee", "Fiction", "mockingbird.jpg"},
                    {"Pride and Prejudice", "Jane Austen", "Romance", "prideprejudice.jpg"},
                    {"The Catcher in the Rye", "J.D. Salinger", "Fiction", "catcher.jpg"},
                    {"The Hobbit", "J.R.R. Tolkien", "Fantasy", "hobbit.jpg"},
                    {"Brave New World", "Aldous Huxley", "Dystopian", "bravenewworld.jpg"},
                    {"The Lord of the Rings", "J.R.R. Tolkien", "Fantasy", "lordrings.jpg"},
                    {"Harry Potter and the Sorcerer's Stone", "J.K. Rowling", "Fantasy", "harrypotter.jpg"},
                    {"The Da Vinci Code", "Dan Brown", "Thriller", "davincicode.jpg"},
                    {"The Alchemist", "Paulo Coelho", "Fiction", "alchemist.jpg"},
                    {"The Catcher in the Rye", "J.D. Salinger", "Fiction", "catcher2.jpg"},
                    {"Jane Eyre", "Charlotte Brontë", "Classic", "janeeyre.jpg"},
                    {"Wuthering Heights", "Emily Brontë", "Classic", "wutheringheights.jpg"},
                    {"Moby Dick", "Herman Melville", "Classic", "mobydick.jpg"},
                    {"The Odyssey", "Homer", "Epic", "odyssey.jpg"},
                    {"Crime and Punishment", "Fyodor Dostoevsky", "Classic", "crimepunishment.jpg"},
                    {"War and Peace", "Leo Tolstoy", "Historical", "warpeace.jpg"},
                    {"The Brothers Karamazov", "Fyodor Dostoevsky", "Philosophical", "brotherskaramazov.jpg"},
                    {"One Hundred Years of Solitude", "Gabriel García Márquez", "Magical Realism", "solitude.jpg"},
                    {"Catch-22", "Joseph Heller", "Satire", "catch22.jpg"},
                    {"The Old Man and the Sea", "Ernest Hemingway", "Classic", "oldmansea.jpg"},
                    {"Lord of the Flies", "William Golding", "Dystopian", "lordflies.jpg"},
                    {"The Sun Also Rises", "Ernest Hemingway", "Classic", "sunrises.jpg"},
                    {"The Great Gatsby", "F. Scott Fitzgerald", "Fiction", "gatsby2.jpg"},
                    {"The Road", "Cormac McCarthy", "Dystopian", "road.jpg"},
                    {"The Hunger Games", "Suzanne Collins", "Dystopian", "hunger.jpg"},
                    {"The Martian", "Andy Weir", "Sci-Fi", "martian.jpg"},
                    {"Ready Player One", "Ernest Cline", "Sci-Fi", "readyplayerone.jpg"},
                    {"The Leftovers", "Tom Perrotta", "Drama", "leftovers.jpg"},
                    {"A Game of Thrones", "George R.R. Martin", "Fantasy", "gameofthrones.jpg"},
                    {"The Name of the Wind", "Patrick Rothfuss", "Fantasy", "namewind.jpg"},
                    {"Good Omens", "Neil Gaiman & Terry Pratchett", "Fantasy", "goodomens.jpg"},
                    {"American Gods", "Neil Gaiman", "Fantasy", "americangods.jpg"},
                    {"The Night Circus", "Erin Morgenstern", "Fantasy", "nightcircus.jpg"},
                    {"Dune", "Frank Herbert", "Sci-Fi", "dune.jpg"},
                    {"Neuromancer", "William Gibson", "Sci-Fi", "neuromancer.jpg"},
                    {"Foundation", "Isaac Asimov", "Sci-Fi", "foundation.jpg"},
                    {"Ender's Game", "Orson Scott Card", "Sci-Fi", "endersgame.jpg"},

};

            for (String[] book : books) {
                String title = book[0];
                String author = book[1];
                String genre = book[2];
                String imageUrl = book[3];
        %>
        <div class="book">
            <img src="<%= imageUrl %>" alt="<%= title %>">
            <div class="book-details">
                <h3><%= title %></h3>
                <p class="author">by <%= author %></p>
                <p>Genre: <%= genre %></p>
            </div>
        </div>
        <% } %>
    </div>
</div>

<script>
    function confirmLogout() {
        return confirm("Are you sure you want to log out?");
    }
</script>

</body>
</html>
