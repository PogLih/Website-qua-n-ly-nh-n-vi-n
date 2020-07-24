<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="resource/homepage/assets/css/main.css" />
<style>
/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* Set a style for all buttons */
button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Lato", sans-serif;
}
body, html {
	height: 100%;
	color: #777;
	line-height: 1.8;
}

/* Create a Parallax Effect */
.bgimg-1, .bgimg-2, .bgimg-3 {
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

/* First image (Logo. Full height) */
.bgimg-1 {
	background-image: url('<c:url value='resource/homepage/images/bg-01.jpg'/>');
	min-height: 100%;
}

/* Second image (Portfolio) */
.bgimg-2 {
	background-image: url("/w3images/parallax2.jpg");
	min-height: 400px;
}

/* Third image (Contact) */
.bgimg-3 {
	background-image: url("/w3images/parallax3.jpg");
	min-height: 400px;
}

.w3-wide {
	letter-spacing: 10px;
}

.w3-hover-opacity {
	cursor: pointer;
}

/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-device-width: 1600px) {
	.bgimg-1, .bgimg-2, .bgimg-3 {
		background-attachment: scroll;
		min-height: 400px;
	}
}
</style>
</head>
<body>
	<div class="w3-top">
		<div class="w3-bar" id="myNavbar">
			<a
				class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right"
				href="javascript:void(0);" onclick="toggleFunction()"
				title="Toggle Navigation Menu"> <i class="fa fa-bars"></i>
			</a> <a href="#home" class="w3-bar-item w3-button">Trang chủ</a>
			  <a class="w3-bar-item w3-button w3-hide-small" onclick="document.getElementById('id01').style.display='block'">Đăng nhập</a>

	<div id="id01" class="modal">

		<form class="modal-content animate" action="login/submit.htm"
			method="post">
			<div class="imgcontainer">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="close" title="Close Modal">&times;</span> <img
					src="${pageContext.request.contextPath}/resource/login/images/avatar.png"
					alt="Avatar" class="avatar"> <br>
					<span
					style="text-align: center"> <c:choose>
						<c:when test="${empty message}">
								Sign In 
							</c:when>
						<c:otherwise>
								${message}
							</c:otherwise>
					</c:choose> <c:remove var="message" />
				</span>
			</div>

			<div class="container">
				<label for="uname"><b>Username</b></label> <input type="text"
					placeholder="Enter Username" name="username" required> <label
					for="psw"><b>Password</b></label> <input type="password"
					placeholder="Enter Password" name="pass" required>

				<button>Login</button>
				<label> <input type="checkbox" checked="checked"
					name="remember"> Remember me
				</label>
			</div>

			<div class="container" style="background-color: #f1f1f1">
				<button type="button"
					onclick="document.getElementById('id01').style.display='none'"
					class="cancelbtn">Cancel</button>
				<span class="psw">Forgot <a href="#">password?</a></span>
			</div>
		</form>
	</div><a
				href="#portfolio" class="w3-bar-item w3-button w3-hide-small"><i
				class="fa fa-th"></i> Tiếng Việt</a> <a href="#contact"
				class="w3-bar-item w3-button w3-hide-small"><i
				class="fa fa-envelope"></i> Tiếng Anh</a> <a href="#"
				class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red">
				<i class="fa fa-search"></i>
			</a>
		</div>
		<div id="navDemo"
			class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium">
			<a href="login/submit.htm" class="w3-bar-item w3-button"
				onclick="toggleFunction()">Đăng Nhập</a> <a href="#portfolio"
				class="w3-bar-item w3-button" onclick="toggleFunction()">Tiếng Việt</a>
			<a href="#contact" class="w3-bar-item w3-button"
				onclick="toggleFunction()">Tiếng Anh</a> <a href="#"
				class="w3-bar-item w3-button">Tìm kiếm</a>
		</div>
	</div>
	<!-- Banner -->
	<div class="bgimg-1 w3-display-container w3-opacity-min" id="home">
  <div class="w3-display-middle" style="white-space:nowrap;">
    <span class="w3-center w3-padding-large w3-black w3-xlarge w3-wide w3-animate-opacity">Java5 Personel</span>
  </div>
</div>
	<!-- Two -->
	<div class="w3-content w3-container w3-padding-64" id="about">
  <h3 class="w3-center">Về công ty</h3>
  <p>Website này là ASM của java 5 trường FPT polytechnic.Website này là ASM của java 5 trường FPT poly
  technic.Website này là ASM của java 5 trường FPT polytechnic.Website này là ASM của java 5 trường FPT polytechnic.Website này là ASM
   của java 5 trường FPT polytechnic.Website này là ASM của java 5 trường FPT polytechnic.Website này là ASM của java 5
    trường FPT polytechnic.Website này là ASM của java 5 trường FPT polytechnic.</p>
    </div>
  <div class="w3-content w3-container w3-padding-64">
    <section id="two" class="wrapper style1 special">
		<div class="w3-center">
			<header>
				<h2 style="color:gray;" class="w3-center">Top Nhân Viên Tiêu Biểu</h2>
				<p style="color:gray;" class="w3-center">(Dữ Liệu Gia Lập)</p>
			</header>
			<div class="flex flex-5">
				<c:forEach var="staff" items="${topStaff}">
					<div class="box person">
						<div class="image round">
							<img width="100px" src="resource/avatar/${staff.photo}"
								alt="Person" />
						</div>
						<h3 style="color:gray;">${staff.name}</h3>
						<p style="color:gray;">${staff.depart.name}</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
  <p class="w3-large w3-center w3-padding-16">Sơ lượt công ty</p>
  <p class="w3-wide"><i class="fa fa-camera"></i>Nhân viên</p>
  <div class="w3-light-grey">
    <div class="w3-container w3-padding-small w3-dark-grey w3-center" style="width:90%">900 nhân viên</div>
  </div>
  <p class="w3-wide"><i class="fa fa-laptop"></i>Chi nhánh</p>
  <div class="w3-light-grey">
    <div class="w3-container w3-padding-small w3-dark-grey w3-center" style="width:80%">8 chi nhánh</div>
  </div>
  <p class="w3-wide"><i class="fa fa-photo"></i>Quy mô</p>
  <div class="w3-light-grey">
    <div class="w3-container w3-padding-small w3-dark-grey w3-center" style="width:75%">75 tỷ</div>
  </div>
</div>
  <div class="w3-row w3-center w3-dark-grey w3-padding-16">
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">14+</span><br>
    Đối tác lớn
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">55+</span><br>
    Dự án hoàn thành
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">89+</span><br>
    Khách hàn thân thiết
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">150+</span><br>
    Cuộc gặp gỡ
  </div>
  
</div>
	<!-- Footer -->
	<footer class="w3-center w3-black w3-padding-64 w3-opacity w3-hover-opacity-off">
  <a href="#home" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
  <div class="w3-xlarge w3-section">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></p>
</footer>
 <script>
// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

// Change style of navbar on scroll
window.onscroll = function() {myFunction()};
function myFunction() {
    var navbar = document.getElementById("myNavbar");
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
    } else {
        navbar.className = navbar.className.replace(" w3-card w3-animate-top w3-white", "");
    }
}

// Used to toggle the menu on small screens when clicking on the menu button
function toggleFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}
//Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}
</script>
</body>
</html>