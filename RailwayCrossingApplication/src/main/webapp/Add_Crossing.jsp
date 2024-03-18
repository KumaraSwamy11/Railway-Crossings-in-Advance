<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add_Crossing</title>

<%@ include file="bootstrap.jsp" %>

  <style>
        body {
            font-family: Arial, sans-serif;        
        }

        .login-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            width: 500px;
            margin: 100px auto;
            padding: 20px;
        }

        h1,h4 {
            margin-bottom: 20px;
            text-align:center;
            
        }

        label{
        padding: 5px;
        margin: 5px 0;
        }
        
        
        input[type="text"],
        input[type="password"],
        textarea
        {
            width: 90%;
            padding: 10px;
            margin: 8px 0;
            border: 2px solid #ccc;
            border-radius: 10px;
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

        .signup-link {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<!-- NavBar -->
<header class="p-2 text-dark">
		<div class="container-fluid">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><h2>Add Railway Crossings</h2></li>
				</ul>

				<div class="text-auto">
					<form action="AdminLogoutDao" method="post">
						<input class="btn bg-light btn-outline-light me-2 text-dark"
							type="submit" value="Logout">
					</form>
				</div>
			</div>
		</div>
	</header>
	
	<header class="p-2 text-dark">
		<div class="container-fluid">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					
					<li><div class="text-auto">
						<a class="btn bg-light btn-outline-light me-8 text-dark"
							href="Admin_Home.jsp">Home</a>
							<a class="btn bg-light btn-outline-light me-8 text-dark"
							href="Search_Crossing.jsp">Search Crossings</a>
					</div></li>
				</ul>

			</div>
		</div>
	</header>	
	
	 <div class="login-container">
        <h1>Railway Crossing</h1>
        <h4>Railway Crossing Information</h4>
        <form action="AddCrossingDao" method="post">
            <label><b>Enter Name:</b></label> 
            <input type="text" name="name" placeholder="Enter name" required>
            <br>
         
            <label><b>Address:</b></label> 
            <input type="text" name="add" placeholder="Enter address" required>
            <br>
            <label><b>Landmark:</b></label>
            <textarea  name="landmark" placeholder="Landmark..." style="height:90px"></textarea>
            <br>
            <label><b>Train Schedule:</b></label> 
            <input type="text" name="train" placeholder="Train schedule" required>
            <br>
            <label><b>Person In-Charge:</b></label> 
            <input type="text" name="person" placeholder="Person in-charge" required>
            <br>
            <label><b>Crossing status:</b></label><br>
            <input type="radio" name="status"value="Open">
              <label>Open</label>
              <input type="radio" name="status" value="Closed">
              <label>close</label><br>
            <button type="submit">Submit</button>
        </form>
    </div>
	
</body>
</html>