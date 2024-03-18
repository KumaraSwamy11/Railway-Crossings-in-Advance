<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

  <style>
        body {
            font-family: Arial, sans-serif;        
        }

        .login-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            width: 400px;
            margin: 100px auto;
            padding: 20px;
        }

        h1,h4 {
            margin-bottom: 20px;
            text-align:center;
            
        }

        label{
        padding: 10px;
        margin: 8px 0;
        }
        
        
        input[type="text"],
        input[type="password"] ,
        input[type="email"] 
        {
            width: 90%;
            padding: 10px;
            margin: 8px 0;
            border: 2px solid #ccc;
            border-radius: 3px;
        }

        button {
            width: 95%;
            padding: 10px;
            background-color: lightgreen;
            color: white;
            border: none;
            border-radius: 15px;
            cursor: pointer;
        }

        button:hover {
            background-color: green;
        }

        .login-link {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Railway Crossing</h1>
        <h4>User Registration</h4>
        <form action="UserRegistrationDao">
            <label><b>Enter Name:</b></label> 
            <input type="text" name="username" placeholder="Username" required>
            <br><br>
            
             <label><b>Enter Email:</b></label> 
            <input type="email" name="email" placeholder="E-mail Address" required>
            <br><br>
            
            <label><b>Enter Password:</b></label> 
            
            <input type="password" name="password" placeholder="Password" required>
            <br>
            <button type="submit">SignUp</button>
        </form>
        
         <div class="login-link">
            Already have an account? <a href="User_Login.jsp">Login</a> 
        </div>
    </div>
</body>
</html>





