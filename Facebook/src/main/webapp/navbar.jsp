<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="register.*" %>
<%@page import="java.sql.*" %>
<%@page import="connection.*" %>
<%@page import="friend.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/Navbar.css">
<link rel="stylesheet" href="css/SearchDropDown2.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!--  <script src="js/SearchDropDown.js"></script>-->
</head>
<style>
.notification {
    background-color: #fff;
    border-radius: 8px;
    padding: 0px;
    width: 230px;
    justify-content:center;
    text-align: center;
}

.message {
    font-size: 12px;
    margin-bottom: 2px;
    margin-top: 0px;
}

.buttons {
    display: flex;
    justify-content: space-around;
}

button {
    padding: 5px 10px;
    border: none;
    border-radius: 5px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.accept {
    background-color: #4CAF50;
    color: white;
}

.accept:hover {
    background-color: #45a049;
}

.reject {
    background-color: #f44336;
    color: white;
}

.reject:hover {
    background-color: #da190b;
}

</style>
<body>
<%    

UserBean user = (UserBean)session.getAttribute("UserBean");
	

if(user != null){
%>

<nav class="nav1" >
  <span>
  <div class="logo">
    <p>Facebook</p>
    <form action="Search" method="post" class="search" id="search-bar">
        <input type="search" placeholder="Type something..." name="name" class="search__input">

        <div class="search__button" id="search-button">
            <i class="ri-search-2-line search__icon" style="color:white !important;"></i>
            <i class="ri-close-line search__close"></i>
        </div>    
                 
    </form>
<div id="search-dropdown" class="search-dropdown" style="display: none;">
    <div class="slider">
        <div class="slider-content">
        <p>Search Result</p>
        <% String message = (String)session.getAttribute("msg1");
           String name = (String)session.getAttribute("name");
        %>
       
        <% if(message != null){ %>
            <script>
                searchDropdown.style.display = 'block';
            </script>
            <% Connection con = Conn.connect();
               Statement stmt = con.createStatement();
               ResultSet rs = stmt.executeQuery("Select * from user where uname LIKE '%" + name + "%' OR umail LIKE '%" + name + "%'");
               while(rs.next()){
            %>
            <a href="FriendProfile?uid=<%out.print(rs.getString("uid"));%>" style="text-decoration:none;">
                <div class="user-card" style="width:210px">
                    <img src="Userimages/<%out.print(rs.getString("uimg")); %>" alt="User Image">
                    <div class="user-details">
                        <h2><%out.print(rs.getString("uname")); %></h2>
                    </div>
                </div>
            </a>
            <% } 
               session.setAttribute("msg1", null);
            } %>
        </div>
    </div>
</div>
  </div>
</span>
  <ul class="navbar1">
    <li><a class="btn" href="index.jsp"><i class="fa-solid fa-house fa-xl color" style="color: #0866FF;"></i></a></li>
    <li><a class="btn" href="#"><i class="fa-solid fa-user-group fa-xl" style="color: #0866FF;"></i></a></li>
    <li><a class="btn" href="#"><i class="fa-brands fa-youtube fa-xl" style="color: #0866FF;"></i></a></li>
    <li><a class="btn" href="#"><i class="fa-solid fa-shop fa-xl" style="color: #0866FF;"></i></a></li>
  </ul>
  <div class="logo-right">
    <ul class="ull">
      <li><a href="#"><i class="fa-solid fa-ellipsis fa-lg" style="color: #0866FF;"></i></a></li>
      <li><a href="#"><i class="fa-brands fa-facebook-messenger fa-lg" style="color: #0866FF;"></i></a></li>
     <li>
      <a href="#" class="bell-icon-container">
      <i class="fa-solid fa-bell fa-lg" style="color: #0866FF;"></i>
      </a>
      <div class="dropdown-menu" id="bell-dropdown" style="display:none; justify-content:center; transform:translate(-62%,17%);">
               <div class="notification">
        <p class="message">John Deo sent you a friend request</p>
        <div class="buttons">
            <button class="accept">Accept</button>
            <button class="reject">Reject</button>
        </div>
    </div>
      </div>
     </li>
      <%if(user.getUimg()!=null){ %>
      <li>
      <a href="#" class="user-image-container">
         <img src="Userimages/<%out.print(user.getUimg());%>" alt="User">
      </a>
      <div class="dropdown-menu" id="user-dropdown">
         <div class="cont">
            <span>
            	<a href="Profile.jsp">
            		<img src="Userimages/<%out.print(user.getUimg());%>" style="width:30px; height:30px; border-radius:50%;"><%out.print(user.getUname());%>
            	</a>
            </span>
            <a href="">See all profiles</a>
         </div>
         <div class="icons">
               <a href="#"><i class="fa-solid fa-gear fa-xl"></i>Setting & privacy</a>
               <a href="#"><i class="fa-solid fa-circle-question fa-xl"></i>Help & Support</a>
               <a href="#"><i class="fa-solid fa-moon fa-xl"></i>Display & accessibility</a>
               <a href="#"><i class="fa-solid fa-comment-dollar fa-xl"></i>Give feedback</a>
               <a href="Logout"><i class="fa-solid fa-right-from-bracket fa-xl"></i>Log Out</a>
          </div>
           </div>
         </li>
      <%}else{ %>
      <li>
      <a href="#" class="user-image-container">
         <i class="fa-solid fa-user fa-lg" style="color: #0866FF; "></i>
      </a>
      <div class="dropdown-menu" id="user-dropdown" style="transform:translate(-80%,3%);">
         <div class="cont">
            <span>
             <%if(user.getUimg()!=null){ %>
            	<a href="Profile.jsp">
            		<img src="Userimages/<%out.print(user.getUimg());%>" style="width:30px; height:30px; margin:5px 0px 0px 2px; border-radius:50%; " alt="user">
            		<%out.print(user.getUname());%>
            	</a>
            <%}else{ %>
             	<a href="Profile.jsp">
            		<i class="fa-solid fa-user fa-xl" style="color: black; width:20px; height:30px; border-radius:50%;"></i>
            		<%out.print(user.getUname());%>
            	</a>
            <%}%>
            </span>
            <a href="">See all profiles</a>
         </div>
         <div class="icons">
               <a href="#"><i class="fa-solid fa-gear fa-xl"></i>Setting & privacy</a>
               <a href="#"><i class="fa-solid fa-circle-question fa-xl"></i>Help & Support</a>
               <a href="#"><i class="fa-solid fa-moon fa-xl"></i>Display & accessibility</a>
               <a href="#"><i class="fa-solid fa-comment-dollar fa-xl"></i>Give feedback</a>
               <a href="Logout"><i class="fa-solid fa-right-from-bracket fa-xl"></i>Log Out</a>
          </div>
           </div>
         </li>
      <%} %>
      
    </ul>
  </div>
</nav>

</body>
<script>
window.addEventListener('DOMContentLoaded', function() {
    var sidenav = document.getElementById('sidenav');

    // Check if content overflows horizontally
    if (sidenav.scrollHeight > sidenav.clientHeight) {
        sidenav.style.overflowY = 'auto'; // Show scrollbar
    } else {
        sidenav.style.overflowY = 'hidden'; // Hide scrollbar
    }
});

document.addEventListener("DOMContentLoaded", function() {
    const userIcon = document.querySelector('.user-image-container');
    const userDropdown = document.getElementById('user-dropdown');
    const bellIcon = document.querySelector('.bell-icon-container');
    const bellDropdown = document.getElementById('bell-dropdown');

    userIcon.addEventListener('click', function(event) {
        event.preventDefault();
        userDropdown.style.display = (userDropdown.style.display === 'block') ? 'none' : 'block';
    });

    bellIcon.addEventListener('click', function(event) {
        event.preventDefault();
        bellDropdown.style.display = (bellDropdown.style.display === 'flex') ? 'none' : 'flex';
    });

    // Close dropdowns when clicking outside
    window.addEventListener('click', function(event) {
        if (!userIcon.contains(event.target)) {
            userDropdown.style.display = 'none';
        }
        if (!bellIcon.contains(event.target) && !bellDropdown.contains(event.target)) {
            bellDropdown.style.display = 'none';
        }
    });

    // Handle search dropdown
    const searchInput = document.querySelector('.search__input');
    const searchDropdown = document.getElementById('search-dropdown');

    searchInput.addEventListener('focus', function(event) {
        searchDropdown.style.display = 'block';
    });

    // Close search dropdown when clicking outside
    window.addEventListener('click', function(event) {
        if (!searchInput.contains(event.target) && !searchDropdown.contains(event.target)) {
            searchDropdown.style.display = 'none';
        }
    });

    // Submit the form when Enter is pressed
    const searchBar = document.getElementById('search-bar');
    searchInput.addEventListener('keypress', function(event) {
        if (event.key === 'Enter') {
            event.preventDefault();
            searchBar.submit();
        }
    });
});

const toggleSearch = (search, button) => {
    const searchBar = document.getElementById(search),
          searchButton = document.getElementById(button);

    searchButton.addEventListener('click', () => {
        searchBar.classList.toggle('show-search');
    });
}
toggleSearch('search-bar', 'search-button');
</script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var searchDropdown = document.getElementById('search-dropdown');
        <% if(message != null) { %>
            searchDropdown.style.display = 'block';
        <% } %>
    });
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function fetchNotificationCount() {
            $.ajax({
                url: 'Notification?uid=<%out.print(user.getUid());%>', // URL to the servlet
                method: 'get',
                dataType: 'text',
                success: function(response) {
                    $('#notificationCount').text(response);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching notification count:', error);
                }
            });
        }

        $(document).ready(function() {
            // Fetch the notification count on page load
            fetchNotificationCount();

            // Set an interval to fetch the notification count every 10 seconds
            setInterval(fetchNotificationCount, 10000);
        });
    </script>
<%} %>
</html>
