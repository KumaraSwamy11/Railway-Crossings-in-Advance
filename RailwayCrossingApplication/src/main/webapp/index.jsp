<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home</title>
<%@ include file="bootstrap.jsp"%>
<style>
.nav-link {
	color: white;
	font-size: larger;
}

img
{
height:500px;
}

footer {
      background-color: #009688;
      color: white;
      text-align: center;
      padding: 10px;
      clear: both;
    }
</style>

</head>
<body>
	<!-- Navbar... -->

	<header class="p-2 text-white" style="background-color: #009688;">
		<div class="container-fluid">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="HomePage.jsp" class="nav-link px-2 text-white"><i
							class="fa-solid fa-train-subway"></i>Indian-Rail</a></li>
					<li><a href="#" class="nav-link px-2 text-white">About</a></li>
				</ul>

				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
					<input type="search" class="form-control form-control-dark"
						placeholder="Search..." aria-label="Search">
				</form>

				<div class="text-auto">
					<button type="button" class="btn btn-outline-light me-2">
						<a class="nav-link px-2 text-dark" href="Admin_Login.jsp">admin</a>
					</button>
				</div>
				<div class="dropdown">
					<button type="button" class="btn btn-outline-light me-2">
						<a class="nav-link px-2 text-dark" href="#" role="button"
							id="dropdownMenuLink" data-bs-toggle="dropdown"
							aria-expanded="false"> User </a>


						<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<li><a class="dropdown-item" href="User_Registration.jsp">Sign-up</a></li>
							<li><a class="dropdown-item" href="User_Login.jsp">Login</a></li>
						</ul>
					</button>
				</div>

			</div>
		</div>
	</header>
<br>
<h2 style=" text-align:center">WELCOME TO INDAIN RAIL CROSSINGS</h2>


<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/cross2.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="img/cross1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="img/cross3.jfif" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<br>

<h2 style=" text-align:center">FEATURES & ADVERTISEMENT</h2>

<div class="row row-cols-1 row-cols-md-2 g-4">
  <div class="col">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Train Flow Management</h5>
        <p class="card-text">Manages train movements and reduces delays.</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title"> Route Flexibility</h5>
        <p class="card-text">Provides multiple track options for efficient train routing.</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src="img/ad1.jpg" class="card-img-top" alt="...">
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src="img/ad2.jpg" class="card-img-top" alt="...">
    </div>
  </div>
</div>


<br>
<footer>
    &copy; 2024-Indian Rail. All rights reserved.
  </footer>

</body>
</html>