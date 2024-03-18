<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.cfg.Configuration"%>
<%@ page import="com.model.FavCrossings"%>
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
					<li><h2>Favourite Railway Crossings</h2></li>
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
								href="User_Home.jsp">Home</a> 
						 <a class="btn bg-light btn-outline-light me-8 text-dark"
							href="Search_Crossing.jsp">Search Crossings</a>
						</div></li>
				</ul>

			</div>
		</div>
	</header>

	<%
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(FavCrossings.class)
			.buildSessionFactory();

	Session session1 = factory.openSession();

	try {

		session1.beginTransaction();

		List<FavCrossings> favList = session1.createQuery("from FavCrossings").list();

		session1.getTransaction().commit();

		for (FavCrossings fc : favList) {
	%>

	<div class="card w-90" style="margin-left: 10px;">
		<div class="card-body">
			<h5 class="card-title"><%=fc.getName()%></h5>
			<p class="card-text">
				Crossing Status:&nbsp;
			
			<% if(fc.getStatus().equals("Open")) {%>
				
				<a href="#"
					class="btn btn-sm btn-outline-dark btn-success text-white"> 
					<%=fc.getStatus()%></a>
					<%}
			else
			{
			
			%>
                <a href="#"
					class="btn btn-sm btn-outline-dark btn-danger text-white"> 
					<%=fc.getStatus()%></a>
               <%} %>
				<br>
				Person In-Charge:&nbsp;<b><%=fc.getPersonInCharge()%></b><br>
				Train Schedule: &nbsp;<b><%=fc.getTrainSchedules()%></b><br>
				Landmark: &nbsp;<b><%=fc.getLandmark()%></b><br> Address:
				&nbsp;<b><%=fc.getAddress()%></b><br>
			</p>
			
			<form action="RemoveFavCrossingDao">
			<input type="hidden" name="id" value="<%=fc.getFavCrossingId()%>">
			<input type="submit" class="btn btn-outline-dark bg-light text-secondary" value="REMOVE FROM FAVOURITE" >
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
	%>

</body>
</html>