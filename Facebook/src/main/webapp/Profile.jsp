<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="register.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="css/profile.css">
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<%
UserBean user=(UserBean)session.getAttribute("UserBean");
%>
<div class="popop-background"></div>
<div class="thim-div">
	<div class="hadr-thim-bar">
		<span id="thim-button" class="fas fa-caret-right"></span>
		<p>Background</p>
		<div class="bg-color">
			<div id="bg-c-1" class="bg-color-1"></div>
			<div id="bg-c-2" class="bg-color-2"></div>
			<div id="bg-c-3" class="bg-color-3"></div>
			<div id="bg-c-4" class="bg-color-4"></div>
			<div id="bg-c-5" class="bg-color-5"></div>
			<div id="bg-c-6" class="bg-color-6"></div>
		</div>
<br>
		<p>Text Color</p>
		<div class="bg-color">
			<div id="txt-c-1" class="bg-color-1"></div>
			<div id="txt-c-2" class="bg-color-2"></div>
			<div id="txt-c-3" class="bg-color-3"></div>
			<div id="txt-c-4" class="bg-color-4"></div>
			<div id="txt-c-5" class="bg-color-5"></div>
			<div id="txt-c-6" class="bg-color-6"></div>
		</div>

	</div>
</div>



<section class="cover-image-section">		
			<header class="cover-hader-site">
			<img src="Userimages/<%out.print(user.getUproimage());%>">
			<div class="cover-image-div">
			<div class="cover-image-edite-btn">
				<button>
				<a href="UploadProfile.jsp" style="color:black;
				text-decoration:none;"><i class="fas fa-camera"></i>Edit Cover Photo</a>
				</button>
			</div>
		</div>
	</header>
</section>

<section class="profile-section">
	<div class="profile-section-in">
		<div class="profile-image-site">
			<div class="profile-image-div">
				<a href="#" id="profile-link">
				<img id="Profile_images" src="Userimages/<%out.print(user.getUimg());%>">
				</a>
				<span><a href="UploadImage.jsp"><i class="fa-solid fa-camera" style="color:black;"></i></a></span>
			</div>
		</div>
<div class="profile-name-info">
	<h1>
	<span class="pro-txt" id="profile_name"><%out.print(user.getUname()); %></span>
	<span id="nik-name"></span>
	</h1>
	<p>
	<span class="fir-count-txt">
	<span id="friend_count">3.9K</span> Friends
	</span>
	</p>
</div>
<div class="profile-button-site">
	<div class="btn-site-pro">
	<span>
	<i class="fas fa-plus-circle"></i>
	Add to Story</span>
	<span class="edit-profile-btn">
	<i class="fas fa-pen"></i>
	Edit Profile
	</span>
</div>
</div></div>
</section>


<section class="full-navbar">
	<nav class="navbar-site">		
	<ul compact="txt-color-c">
	<a href="#"><li class=" txt-cc activ-navbar">Posts</li></a>
	<a href="#"><li class=" txt-cc">About</li></a>
	<a href="#"><li class=" txt-cc">Friends</li></a>
	<a href="#" id="photo-nav"><li class=" txt-cc">Photo</li></a>
	<a href="#" id="video-nav"><li class=" txt-cc">Video</li></a>
	<a href="#" id="likes-nav">	<li class=" txt-cc">Likes</li></a>
	<a href="#"><li class=" txt-cc">More <i class="fas fa-caret-down"></i></li></a>
	</ul>

<div class="nav-btn">
	<i class="fas fa-ellipsis-h"></i>
</div>
</nav>
</section>


		<section class="post-section">
			<div class="post-section-in">
				
				<section class="info-section">
					
					<div class="profile-lock-div">
						<div class="icon-pld">
							<i class="fab fa-keycdn"></i>
						</div>
						<div class="pld-text">
							<h3>You locked your profile</h3>
							<a href="#">Learn More</a>
						</div>
					</div>

					<div class="about-info">
						<h4>Intro</h4>

						<p id="bio-text">MD Mehedi Hasan</p>
						<div class="bio-btn-click">
							<input class="input-box" type="text" value="MD Mehedi Hasan"> 
							<p class="length-count-txt"> 
								<span id="length-count">101</span> characters remaining</p> 
								<div class="putlic-c-o-btn">
									<div>
										<p><span class="fas fa-globe-europe"></span> Public</p>
									</div>
									<div class="button-site-js">
										<button id="cencel-btn">Cancel</button>
										<button id="save-btn">Save</button></div>
									</div>
						</div>
						<button id="bio-edit-btn" class="edit-bio btn">Edit Bio</button>

						<ul>
							<li><i class="fas fa-briefcase"></i> Works at 
								<a href="#">Sad Mia</a>
							</li>

							<li><i class="fas fa-graduation-cap"></i> Went to
								<a href="#">kamarkhali high school</a>
							</li>

							<li><i class="fas fa-home"></i> Lives in 
								<a href="#">Dhaka, Bangladesh</a>
							</li>

							<li><i class="fas fa-map-marker-alt"></i> From 
								<a href="#">Faridpur, Dhaka, Bangladesh</a>
							</li>
							<li><i class="fas fa-heart"></i> Single</li>
							<li><i class="fas fa-globe"></i> <a href="#">
								sadmia.com
							</a></li>
						</ul>

						<button class="edit-bio btn">Edit Details</button>

						<div class="Hobbies-show">
							<span><i class="fas fa-laptop-code"></i> Learning to Code</span>

							<span><i class="fas fa-laptop-code"></i>Code</span>

							<span><i class="fas fa-book"></i>Learning</span>

							<span><i class="fas fa-camera-retro"></i>Photography</span>
						</div>

						<button class="edit-bio btn">Edit Hobbies</button>

						<div class="Featured-site">
							
							<div class="Featured-img-div">
								<img id="post-image-12" src="images/friends/0.jpg">
							</div>

							<div class="Featured-img-div">
								<img id="post-image-11" src="images/friends/0.jpg">
							</div>

							<div class="Featured-img-div">
								<img id="post-image-9" src="images/friends/0.jpg">
							</div>

							<div class="Featured-img-div">
								<img id="post-image-8" src="images/friends/0.jpg">
							</div>

						</div>

						<button class="edit-bio btn">Edit Featured</button>
					</div>

					<div class="box-design images-site">
													
							<span>Photos</span>

							<div class="see-all-images"><a href="#">See All Photos</a></div>

						<div class="at9-images">
							
							<div class="images-div">
								<img id="post-image-12" src="images/friends/0.jpg">
							</div>

							<div class="images-div">
								<img id="post-image-2" src="images/friends/0.jpg">
							</div>

							<div class="images-div">
								<img id="post-image-3" src="images/friends/0.jpg">
							</div>

							<div class="images-div">
								<img id="post-image-4" src="images/friends/0.jpg">
							</div>

							<div class="images-div">
								<img id="post-image-5" src="images/friends/0.jpg">
							</div>

							<div class="images-div">
								<img id="post-image-6" src="images/friends/0.jpg">
							</div>

							<div class="images-div">
								<img id="post-image-7" src="images/friends/0.jpg">
							</div>

							<div class="images-div">
								<img id="post-image-8" src="images/friends/0.jpg">
							</div>

							<div class="images-div">
								<img id="post-image-9" src="images/friends/0.jpg">
							</div>

						</div>

					</div>

					<div class="box-design friends-site">
													
							<span>Friends <br> 
								<p>
									<span>
										3641
									</span> 
									Friends
								</p>
							</span>

							<div class="see-all-images"><a href="#">See All Friends</a></div>

						<div class="at9-images">
							
							<div class="images-div">
								<img id="frind-image-1" src="images/friends/0.jpg">
								<p><a href="#">Mehei Hasan</a></p>
							</div>

							<div class="images-div">
								<img id="frind-image-2" src="images/friends/0.jpg">
								<p><a href="#">salma akter</a></p>
							</div>

							<div class="images-div">
								<img id="frind-image-3" src="images/friends/0.jpg">
								<p><a href="#">abu bakker</a></p>
							</div>

							<div class="images-div">
								<img id="frind-image-4" src="images/friends/0.jpg">
								<p><a href="#">bangladesh</a></p>
							</div>

							<div class="images-div">
								<img id="frind-image-5" src="images/friends/0.jpg">
								<p><a href="#">japan</a></p>
							</div>

							<div class="images-div">
								<img id="frind-image-6" src="images/friends/0.jpg">
								<p><a href="#">hello Bangladesh</a></p>
							</div>

							<div class="images-div">
								<img id="frind-image-7" src="images/friends/0.jpg">
								<p><a href="#">sad mia</a></p>
							</div>

							<div class="images-div">
								<img id="frind-image-8" src="images/friends/0.jpg">
								<p><a href="#">china</a></p>
							</div>

							<div class="images-div">
								<img id="frind-image-9" src="images/friends/0.jpg">
								<p><a href="#">sad mia</a></p>
							</div>

						</div>

					</div>

				</section>

				<section class="post-info">

					<div class="box-design">
						<div class="post-upload-T">
							<div class="profil-ing-div">
								<a href="#" id="profile-link">
									<img id="Profile_images" src="Userimages/<%out.print(user.getUimg());%>">
								</a>
							</div>
							<div class="text-post">
								<span>What's on your mind?</span>
							</div>
						</div>
						<div class="photo-upload">
							<div class="post-upl">
								<p><i class="fas fa-video"></i> Live Video</p>
							</div>
							<div class="post-upl">
								<p><i class="fas fa-images"></i> Photo/Video</p>
							</div>
							<div class="post-upl">
								<p><i class="fas fa-flag"></i> Life Event</p>
							</div>
						</div>
					</div>

					<div class="box-design post-filter">

						<div class="filter-site">
							<span>Posts</span>
							<div class="fil-ter">
								<button><i class="fas fa-sliders-h"></i> Filters</button>

								<button><i class="fas fa-cog"></i> Manager Posts</button>
							</div>
						</div>

						<div class="list-type">
							<div class="fil-list activ-navbar">
								<i class="fas fa-bars"></i> List View
							</div>
							<div class="fil-list">
								<i class="fas fa-th-large"></i> Grid View
							</div>
		</div>	</div>
</body>
</html>