<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="register.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="css/Uploadimage.css">
</head>
<body>
<div class="container">
<%
UserBean user=(UserBean)session.getAttribute("UserBean");
%>
<div class="container">
   <h2>Profile Photo Update</h2>
     <form action="Uploadprofileimage" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="profile_photo">Select Photo:</label>
            <input type="file" id="profile_photo" name="image" accept="image/*" required>
            <input type="hidden" name="id" value="<%out.print(user.getUid()); %>" >
        </div>
        <div class="form-group">
            <input type="submit" value="Upload">
        </div>
    </form>
</div>

</body>
</html>