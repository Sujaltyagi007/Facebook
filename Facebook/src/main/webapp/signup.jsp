<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Facebook</title>
</head>
<style>
    .container {
      margin-top: 20px;
      width: 400px;
      margin: 0 auto;
      padding: 10px;
      border: 1px solid #ccc;
      box-shadow: 0px 0px 10px #ccc;
    }
    form h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    form p {
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
<body>
<div class="container">
      <form action="UserServlet" method="post">
        <h2>Sign Up</h2>
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
</body>
</html>