<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Form</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
  <style>
      body {
          display: flex;
          justify-content: center;
          align-items: center;
          height: 100vh;
          margin: 0;
          font-family: 'poppins',sans-serif;
          background-color: #f0f0f0;
         
      }

      .login-container {
          display: flex;
          justify-content: center;
          align-items: center;
          margin-top: 15px;
          width: 900px;
          font-size: larger !important;
      }

      .login-form {
          width: 550px;
          padding: 20px;
          padding-bottom: 0px;
          border: 1px solid #ccc;
          border-radius: 5px;
          background-color: #fff;
          text-align: center;
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
      }

      .login-form input[type="email"],
      .login-form input[type="password"] {
          width: 100%;
          height: 50px;
          padding: 10px;
          margin-bottom: 15px;
          box-sizing: border-box;
          font-size: large;
          border: 1px solid #ccc;
          border-radius: 4px;
      }

      .login-form input[type="submit"] {
          width: 100%;
          background-color: #0866ff;
          color: white;
          padding: 14px 20px;
          margin: 8px 0;
          font-size: large;
          font-weight:bold;
          border: none;
          border-radius: 4px;
          cursor: pointer;
      }

      .welcome-message {
          margin-right: 20px;
          font-size: x-large;;
      }
      .welcome-message p{
        transform: translate(0,-40%);
      }
      h1{
        color: #0866ff;
        margin: 0%;
        padding: 0%;
      }
      a{
        color:#fff;
        font-size:small;
        text-decoration: none;
      }
      .login-form button{
          width: 60%;
          background-color: #42b72a;
          color: white;
          padding: 14px 12px;
          margin: 28px 0;
          font-size: large;
          font-weight:bold;
          border: none;
          border-radius: 8px;
          cursor: pointer;
      }
      .form1{
        padding-bottom: 20px;
        box-shadow: 0 4px 2px -2px #f0f0f0;
      }
  /* The modal (background) */
  .modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  }

  /* Modal Content/Box */
  .modal-content {
    background-color: #fefefe;
    margin: 5% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 400px; /* Could be more or less, depending on screen size */
  }

  /* The Close Button */
  .close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
  }

  .close:hover,
  .close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
  }

  /* Menu items */
  .menu-item {
    list-style: none;
    padding: 10px 0;
    border-bottom: 1px solid #ccc;
    cursor: pointer;
  }

  .menu-item:last-child {
    border-bottom: none;
  }
    form h1 {
      text-align: center;
      color:black;
    }

    form p {
      font-size:small;
      margin-top:0%;
      text-align: center;
      margin-bottom: 20px;
    }

    form label {
      display: block;
      margin-bottom: 5px;
    }
    form input[type="text"],
    form input[type="password"],
    form input[type="date"] {
      width: 95%;
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      box-shadow: 0px 0px 5px #ccc;
    }

    form input[type="radio"] {
      margin-right: 10px;
    }

    form input[type="submit"] {
      width: 100%;
      padding: 10px;
      background-color: #4caf50;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    form input[type="submit"]:hover {
      background-color: #45a049;
    }
    .name{
        width: 100%;
    }
    .last{
        text-align: left;
        margin:5px;
    }
    .pro{
        margin-top: 10px;
    }
    .num{
        display: flex;
    }
    .num1{
        width: 10% !important;
        margin-right: 5px;
    }
  </style>
  
</head>
<body>

<div class="login-container">
    <div class="welcome-message">
        <h1>facebook</h1>
        <p>Facebook  helps you connect and share with the people in your life</p>
    </div>
    <div class="login-form">
        <form action="Login" method="post" class="form1">
            <input type="email" placeholder="Email address and phone number " name="email" required>
            <input type="password" placeholder="Password" name="password" required><br>
            <input type="submit" value="Log in">
            <a href="#">Forgotten password?</a>
        </form>
        <button onclick="openModal()" class="acc">Create new account</button>
    </div>
</div>
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close" onclick="closeModal()">&times;</span>
      <form action="UserServlet" method="post">
        <h1>Sign Up</h1>
        <p>It's quick and easy.</p>
        <div class="name">
        <input type="text" class="name1" placeholder="Enter Your Name" id="fname" name="uname" required/>
        </div>
        <input type="text" placeholder="Enter Your Email address" id="contact" name="umail" required/>

        <input type="password" placeholder="password" id="pwd" name="upass" required/>
        <label for="Date of Birth">Date of Birth :</label>
        <input type="date" id="dob" name="udob" value="2024-05-01" /><br />
        <label for="Gender">Gender :</label>
        <button>Female<input type="radio" id="female" name="ugender" value="female"/></button>
        <button>Male<input type="radio" id="male" name="ugender" value="male" />
        </button>
        <button>Custom<input type="radio" id="custom" name="ugender" value="custom" /></button>

        <p class="last">
          People who use our service may have uploaded your contact information
          to Facebook. Learn more.
        </p>
        <p class="last">
          By clicking Sign Up, you agree to our Terms, Privacy Policy and
          Cookies Policy. You may receive SMS notifications from us and can opt
          out at any time.
        </p>
        <input type="submit" value="Sign Up" />
      </form>
  </div>

</div>
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// When the user clicks the button, open the modal 
function openModal() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
function closeModal() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

</body>
</html>
