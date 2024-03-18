<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.cfg.Configuration"%>
<%@ page import="com.model.RailCrossing"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User_Home</title>
<%@ include file="bootstrap.jsp"%>

</head>
<body>
	<!-- Navbar... -->

	<header class="p-2 text-dark">
		<div class="container-fluid">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><h2>Search Railway Crossing</h2></li>
				</ul>

				<div class="text-auto">
					<form action="UserLogoutDao" method="post">
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
								href="User_Home.jsp">All</a> <a
								class="btn bg-light btn-outline-light me-8 text-dark"
								href="User_Fav_Crossing.jsp">Favourite Crossings</a>
						</div></li>
				</ul>

			</div>
		</div>
	</header>






	<form style="width: 300px; margin-left: 20px; padding-top: 10px"
		action="Search_Crossing.jsp">
		<label>Search Railway Crossing:</label><br> <input type="search"
			name="search" class="form-control form-control-dark"
			placeholder="Search..." aria-label="Search"><br>
		<button type="submit"
			class="btn bg-light btn-outline-light me-lg-8 justify-content-center text-dark">
			Search</button>
	</form>

	<br>
	<br>



	<%   String crossingName = request.getParameter("search");
    if (crossingName != null && !crossingName.isEmpty())
    {
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(RailCrossing.class)
			.buildSessionFactory();

	Session session1 = factory.openSession();

	try {

		session1.beginTransaction();

		// List<RailCrossing> crossingList = session1.createQuery("from RailCrossing where name like "+crossingName+"%").list();
		
		
		List<RailCrossing> crossingList = session1.createQuery("from RailCrossing where name like :crossingName")
			    .setParameter("crossingName", crossingName + "%").list();
		
		session1.getTransaction().commit();

		for (RailCrossing rail : crossingList) {
	%>

	<div class="card w-90" style="margin-left: 10px;">
		<div class="card-body">
			<h5 class="card-title"><%=rail.getName()%></h5>
			<p class="card-text">
				Crossing Status:&nbsp;

				<%
					if (rail.getStatus().equals("Open")) {
				%>

				<a href="#" class="btn btn-sm btn-outline-dark btn-success text-white"> 
				<%=rail.getStatus()%></a>
				<%
					}
					else {
				%>
				<a href="#" class="btn btn-sm btn-outline-dark btn-danger text-white"> 
				<%=rail.getStatus()%></a>
				<%
					}
				%>
				<br> 
				Person In-Charge:&nbsp;<b><%=rail.getPersonInCharge()%></b><br>
				Train Schedule: &nbsp;<b><%=rail.getTrainSchedules()%></b><br>
				Landmark: &nbsp;<b><%=rail.getLandmark()%></b><br> 
				Address: &nbsp;<b><%=rail.getAddress()%></b><br>
			</p>

			<form action="FavCrossingDao" method="post">
				<input type="hidden" name="id" value="<%=rail.getCrossingId()%>">
				<input type="submit"
					class="btn btn-outline-dark bg-light text-secondary"
					value="ADD TO FAVOURITE">
			</form>
		</div>
	</div>

	<br>

	<%
		}

	session1.close();

	} catch (Exception e) {
	System.out.println(e);
	}
    }
	%>

</body>
</html>