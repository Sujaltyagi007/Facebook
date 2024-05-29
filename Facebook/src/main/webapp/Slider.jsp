<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>
 <link rel="stylesheet" href="css/Slider.css"/>
</head>
<body>
  <div class="wrapper"> 
	<i id="left" class="fa-solid fas fa-angle-left"></i> 
	  <ul class="carousel"> 
	  <%for(int i=0;i<8;i++){ %>
		<li class="card"> 
		  <div class="img">
		    <img src="https://media.geeksforgeeks.org/wp-content/uploads/20240213150115/ppp.png"
		    alt="" draggable="false"> 
		   </div> 
		   <h2 style="color: green; font-weight:bold;">GeeksforGeeks</h2> 
		    <span>Coding Platform</span> 
	    </li> 
	    <%} %>
	  </ul> 
	 <i id="right" class="fa-solid fas fa-angle-right"></i> 
  </div> 
</body>
 <script src="js/Slider.js"></script>
</html>