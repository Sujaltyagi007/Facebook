<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="register.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Facebook</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="icon" href="logo\facebook.png" type=".jpg">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/Slider1.css">
<script src="Slider.js"></script>
<style>
.card {
    position: relative;
    width: 300px;
    height: 400px;
}
.hover-half {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 25%;
    background-color: white;
    display: flex;
    align-items: center; 
    justify-content: flex-end;  
    padding-right: 20px; 
    transform: translateY(150%);
    transition: transform 0.4s ease;
    color: white;
}
.card:hover .hover-half {
    transform: translateY(0); 
}
.card:hover .img img{
	background-color: rgba(0, 0, 0, 0.6); 
}
.img img {
    width: 100%;
    height: auto;
}
.hover-half i {
    font-size: 2rem; /* Adjust the size of the icon */
    color: white;
}
</style>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<% UserBean user = (UserBean)session.getAttribute("UserBean");
if(user!=null){ %>
 <div class="container-fluid">
 <div class="row align-items-start">
   <div class="col-3">
     <div class="sidenav" id="sidenav">
       <%if(user.getUimg()!=null){ %>
       <a href="Profile.jsp">
       		<i><img src="Userimages/<%out.print(user.getUimg());%>" style="width:28px; border-radius:50%; height:30px; margin-top:5px; margin-bottom:3px; margin-left:-5px; "></i>
       			<%out.print(user.getUname()); %>
       	</a>
       <%}else{ %>
       <a href="Profile.jsp">
       		<i class="fa-solid fa-user" style="margin-left:15px;"></i>
       			<%out.print(user.getUname()); %>
       </a>
       <%} %>
       <a href="#"><i class="fa-solid fa-user-group"></i>Friends</a>
       <a href="#"><i class="fa-solid fa-clock"></i>Memories</a>
       <a href="#"><i class="fa-solid fa-bookmark"></i>Saved</a>
       <a href="#"><i class="fa-solid fa-people-group"></i>Group</a>
       <a href="#"><i class="fa-brands fa-youtube"></i>Vedio</a>
       <a href="#"><i class="fa-solid fa-house-user"></i>Marketplace</a>
       <a href="#"><i class="fa-solid fa-book-open-reader"></i>Feeds</a>
       <a href="#"><i class="fa-solid fa-calendar"></i>Events</a>
       <a href="#"><i class="fa-solid fa-chart-simple"></i>Ads Manager</a>
       <a href="#"><i class="fa-solid fa-shield-heart"></i>Fundraiser</a>
       <a href="#"><i class="fa-solid fa-caret-down"></i>See More</a>
     </div>
   </div>
   <div class="col-6 scrollable">
    <div class="wrapper"> 
	<i id="left" class="fa-solid fas fa-angle-left"></i> 
	<ul class="carousel"> 
		<li class="card" style="background-image: url(Userimages/<%out.print(user.getUimg()); %>); background-size: cover; background-position: center; position: relative; overflow: hidden;">
		   <div class="img">
		       <img src="Userimages/<%out.print(user.getUimg()); %>" alt="" draggable="false">
		   </div>
		   <h2 style="color: white; text-align: center;">
		       <% out.print(user.getUname()); %>
		   </h2>
		    <div class="hover-half"><i class="fa-solid fa-plus" style="transform: translate(65px,-50px);"></i></div>
		</li>
		<%for(int i=0;i<8;i++){ %>
		<li class="card" style="background-image: url(Userimages/<%out.print(user.getUimg()); %>); background-size: cover;
           background-position: center; " > 
		<div class="img"><img src="https://media.geeksforgeeks.org/wp-content/uploads/20240213150115/ppp.png" alt="" draggable="false"></div> 
		<h2 style="color: green; font-weight:bold;">GeeksforGeeks</h2> 
		</li> 
		<%} %>
		
	</ul> 
	<i id="right" class="fa-solid fas fa-angle-right"></i> 
</div>
     <div class="storie">
  <div class="sto_up">
      <div class="sto_up_inner">
          <img src="Userimages/<%out.print(user.getUimg());%>" style="width:40px; height:40px; border-radius:50%;">
          <a href="Makepost.jsp"><input type="text" placeholder="What's on your mind, <%=user.getUname()%>?" readonly></a>
      </div>
  </div>
  <div class="sto_down">
      <span>
          <a href="#"><i class="fa-solid fa-video fa-lg" style="color:crimson;"></i>Live video</a>
          <a href="Makepost.jsp"><i class="fa-solid fa-images fa-lg" style="color: #41a464;"></i>Photo/video</a>
          <a href="#"><i class="fa-regular fa-face-grin-wide fa-lg" style="color: #FFD43B;"></i>Feeling/activity</a>
        </span>
    </div>
</div>
     
	    </div>
	    <div class="col-3">
	      One of three columns
	    </div>
	  </div>
	  </div>
	<%}

else {
 response.sendRedirect("login.jsp");
 
}%>
</body>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() { 
	const carousel = document.querySelector(".carousel"); 
	const arrowBtns = document.querySelectorAll(".wrapper i"); 
	const wrapper = document.querySelector(".wrapper"); 

	const firstCard = carousel.querySelector(".card"); 
	const firstCardWidth = firstCard.offsetWidth; 

	let isDragging = false, 
		startX, 
		startScrollLeft; 

	const dragStart = (e) => { 
		isDragging = true; 
		carousel.classList.add("dragging"); 
		startX = e.pageX; 
		startScrollLeft = carousel.scrollLeft; 
	}; 

	const dragging = (e) => { 
		if (!isDragging) return; 
	
		// Calculate the new scroll position 
		const newScrollLeft = startScrollLeft - (e.pageX - startX); 
	
		// Check if the new scroll position exceeds 
		// the carousel boundaries 
		if (newScrollLeft <= 0 || newScrollLeft >= 
			carousel.scrollWidth - carousel.offsetWidth) { 
			
			// If so, prevent further dragging 
			isDragging = false; 
			return; 
		} 
	
		// Otherwise, update the scroll position of the carousel 
		carousel.scrollLeft = newScrollLeft; 
	}; 

	const dragStop = () => { 
		isDragging = false; 
		carousel.classList.remove("dragging"); 
	}; 

	carousel.addEventListener("mousedown", dragStart); 
	carousel.addEventListener("mousemove", dragging); 
	document.addEventListener("mouseup", dragStop); 

	// Add event listeners for the arrow buttons to 
	// scroll the carousel left and right 
	arrowBtns.forEach(btn => { 
		btn.addEventListener("click", () => { 
			carousel.scrollLeft += btn.id === "left" ? 
				-firstCardWidth : firstCardWidth; 
		}); 
	}); 
}); 
function showModal(){
	$('#myModal').modal('show');
}

</script>
</html>