<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="register.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Facebook</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style>
/* Import Google Font - Poppins */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
body{
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  background: linear-gradient(#00C6FF, #0078FF);
}
::selection{
  color: #fff;
  background: #1a81ff;
}
.container{
  width: 500px;
  height: 480px;
  overflow: hidden;
  background: #fff;
  border-radius: 10px;
  transition: height 0.2s ease;
  box-shadow: 0 12px 28px rgba(0, 0, 0, 0.12);
}
.container.active{
  height: 590px;
}
.container .wrapper{
  width: 1000px;
  display: flex;
}
.container .wrapper section{
  width: 500px;
  background: #fff;
}
.container img{
  cursor: pointer;
}
.container .post{
  transition: margin-left 0.18s ease;
}
.container.active .post{
  margin-left: -500px;
}
.post header{
  font-size: 22px;
  font-weight: 600;
  padding: 17px 0;
  text-align: center;
  border-bottom: 1px solid #bfbfbf;
}
.post form{
  margin: 20px 25px;
}
.post form .content,
.audience .list li .column{
  display: flex;
  align-items: center;
}
.post form .content img{
  cursor: default;
  max-width: 52px;
}
.post form .content .details{
  margin: -3px 0 0 12px;
}
form .content .details p{
  font-size: 17px;
  font-weight: 500;
}
.content .details .privacy{
  display: flex;
  height: 25px;
  cursor: pointer;
  padding: 0 10px;
  font-size: 11px;
  margin-top: 3px;
  border-radius: 5px;
  align-items: center;
  max-width: 98px;
  background: #E4E6EB;
  justify-content: space-between;
}
.details .privacy span{
  font-size: 13px;
  margin-top: 1px;
  font-weight: 500;
}
.details .privacy i:last-child{
  font-size: 13px;
  margin-left: 1px;
}
form :where(textarea, button){
  width: 100%;
  outline: none;
  border: none;
}
form textarea{
  resize: none;
  font-size: 18px;
  margin-top: 30px;
  min-height: 100px;
}
form textarea::placeholder{
  color: #858585;
}
form textarea:focus::placeholder{
  color: #b3b3b3;
}
form :where(.theme-emoji, .options){
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.theme-emoji img:last-child{
  max-width: 24px;
}
form .options{
  height: 57px;
  margin: 15px 0;
  padding: 0 15px;
  border-radius: 7px;
  border: 1px solid #B9B9B9;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}
form .options :where(.list, li),
.audience :where(.arrow-back, .icon, li .radio){
  display: flex;
  align-items: center;
  justify-content: center;
}
form .options p{
  color: #595959;
  font-size: 15px;
  font-weight: 500;
  cursor: default;
}
form .options .list{
  list-style: none;
}
.options .list li{
  height: 42px;
  width: 42px;
  margin: 0 -1px;
  cursor: pointer;
  border-radius: 50%;
}
.options .list li:hover{
  background: #f0f1f4;
}
.options .list li img{
  width: 23px;
}
form button{
  height: 53px;
  color: #fff;
  font-size: 18px;
  font-weight: 500;
  cursor: pointer;
  color: #BCC0C4;
  cursor: no-drop;
  border-radius: 7px;
  background: #e2e5e9;
  transition: all 0.3s ease;
}
form textarea:valid ~ button{
  color: #fff;
  cursor: pointer;
  background: #4599FF;
}
form textarea:valid ~ button:hover{
  background: #1a81ff;
}
.container .audience{
  opacity: 0;
  transition: opacity 0.12s ease;
}
.container.active .audience{
  opacity: 1;
}
.audience header{
  padding: 17px 0;
  text-align: center;
  position: relative;
  border-bottom: 1px solid #bfbfbf;
}
.audience header .arrow-back{
  position: absolute;
  left: 25px;
  width: 35px;
  height: 35px;
  cursor: pointer;
  font-size: 15px;
  color: #747474;
  border-radius: 50%;
  background: #E4E6EB;
}
.audience header p{
  font-size: 22px;
  font-weight: 600;
}
.audience .content{
  margin: 20px 25px 0;
}
.audience .content p{
  font-size: 17px;
  font-weight: 500;
}
.audience .content span{
  font-size: 14px;
  color: #65676B;
}
.audience .list{
  margin: 15px 16px 20px;
  list-style: none;
}
.audience .list li{
  display: flex;
  cursor: pointer;
  margin-bottom: 5px;
  padding: 12px 10px;
  border-radius: 7px;
  align-items: center;
  justify-content: space-between;
}
.list li.active,
.audience .list li.active:hover{
  background: #E5F1FF;
}
.audience .list li:hover{
  background: #f0f1f4;
}
.audience .list li .column .icon{
  height: 50px;
  width: 50px;
  color: #333;
  font-size: 23px;
  border-radius: 50%;
  background: #E4E6EB;
}
.audience .list li.active .column .icon{
  background: #cce4ff;
}
.audience .list li .column .details{
  margin-left: 15px;
}
.list li .column .details p{
  font-weight: 500;
}
.list li .column .details span{
  font-size: 14px;
  color: #65676B;
}
.list li .radio{
  height: 20px;
  width: 20px;
  border-radius: 50%;
  position: relative;
  border: 1px solid #707070;
}
.list li.active .radio{
  border: 2px solid #4599FF;
}
.list li .radio::before{
  content: "";
  width: 12px;
  height: 12px;
  border-radius: inherit;
}
.list li.active .radio::before{
  background: #4599FF;
}
img{
width:45px;
height:45px;
border-radius:50%;
}
.post header .arrow-back {
    position: absolute;
    left: 25px;
    width: 35px;
    height: 35px;
    cursor: pointer;
    font-size: 15px;
    color: #747474;
    border-radius: 50%;
    background: #E4E6EB;
}
.post header {
    padding: 17px 0;
    text-align: center;
    position: relative;
    border-bottom: 1px solid #bfbfbf;
}
.post :where(.arrow-back, .icon, li .radio) {
    display: flex;
    align-items: center;
    justify-content: center;
}
</style>
<body>
<% UserBean user = (UserBean)session.getAttribute("UserBean");%>
<div class="container">
      <div class="wrapper">
        <section class="post">
          <header>
             <div class="arrow-back" id="post-arrow-back"><i class="fas fa-arrow-left"></i></div>
            <p>Create Post</p>
          </header>
          <form action="Post" method="post" enctype="multipart/form-data">
          <input type="hidden" name="uid" value="<%out.print(user.getUid()); %>">
            <div class="content">
              <img src="Userimages/<%out.print(user.getUimg()); %>" alt="logo">
              <div class="details">
                <p><%out.print(user.getUname()); %></p>
                <div class="privacy">
                  <i class="fas fa-user-friends"></i>
                  <span>Friends</span>
                  <i class="fas fa-caret-down"></i>
                </div>
              </div>
            </div>
            <textarea placeholder="What's on your mind, <%out.print(user.getUname());%>?" id="postcontent" name="postcontent" spellcheck="false" required></textarea>
            <div class="theme-emoji">
              <i class="fa-solid fa-file-pen fa-xl"></i>
              <i class="fa-regular fa-face-smile fa-xl" style="color: #c6c9cd;"></i>
            </div>
            <div class="options">
              <p>Add to Your Post</p>
              <ul class="list">
                <li>
                <input type="file" name="image" id="img" accept="image/*" style="display:none;">
                <i class="fa-regular fa-file-image fa-xl" style="color: #63E6BE;" onclick="document.getElementById('img').click();"></i></li>
                <li><i class="fa-solid fa-user-plus fa-xl" style="color: #0866ff;"></i></li>
                <li><i class="fa-regular fa-face-laugh fa-xl" style="color: #FFD43B;"></i></li>
                <li><i class="fa-solid fa-location-dot fa-xl" style="color: #f32812;"></i></li>
                <li><i class="fa-solid fa-gift fa-xl" style="color: #63E6BE;"></i></li>
                <li><i class="fa-solid fa-ellipsis fa-xl" style="color: #dadbdc;"></i></li>
              </ul>
            </div>
            <button>Post</button>
          </form>
        </section>
        <section class="audience">
          <header>
            <div class="arrow-back"><i class="fas fa-arrow-left"></i></div>
            <p>Select Audience</p>
          </header>
          <div class="content">
            <p>Who can see your post?</p>
            <span>Your post will show up in News Feed, on your profile and in search results.</span>
          </div>
          <ul class="list">
            <li>
              <div class="column">
                <div class="icon"><i class="fas fa-globe-asia"></i></div>
                <div class="details">
                  <p>Public</p>
                  <span>Anyone on or off Facebook</span>
                </div>
              </div>
              <div class="radio"></div>
            </li>
            <li class="active">
              <div class="column">
                <div class="icon"><i class="fas fa-user-friends"></i></div>
                <div class="details">
                  <p>Friends</p>
                  <span>Your friends on Facebook</span>
                </div>
              </div>
              <div class="radio"></div>
            </li>
            <li>
              <div class="column">
                <div class="icon"><i class="fas fa-user"></i></div>
                <div class="details">
                  <p>Specific</p>
                  <span>Only show to some friends</span>
                </div>
              </div>
              <div class="radio"></div>
            </li>
            <li>
              <div class="column">
                <div class="icon"><i class="fas fa-lock"></i></div>
                <div class="details">
                  <p>Only me</p>
                  <span>Only you can see your post</span>
                </div>
              </div>
              <div class="radio"></div>
            </li>
            <li>
              <div class="column">
                <div class="icon"><i class="fas fa-cog"></i></div>
                <div class="details">
                  <p>Custom</p>
                  <span>Include and exclude friends</span>
                </div>
              </div>
              <div class="radio"></div>
            </li>
          </ul>
        </section>
      </div>
    </div>
</body>
<script>
const container = document.querySelector(".container"),
privacy = container.querySelector(".post .privacy"),
arrowBack = container.querySelector(".audience .arrow-back");

privacy.addEventListener("click", () => {
  container.classList.add("active");
});

arrowBack.addEventListener("click", () => {
  container.classList.remove("active");
});



document.addEventListener("DOMContentLoaded", function() {
	  const postArrowBackButton = document.getElementById("post-arrow-back");
	  postArrowBackButton.addEventListener("click", function() {
	    window.location.href = "index.jsp";
	  });
	});

</script>
</html>