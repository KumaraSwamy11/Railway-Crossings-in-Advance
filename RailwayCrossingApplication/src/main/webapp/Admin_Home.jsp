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
<title>Admin_Home</title>
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
					<li><h2>Admin Home Page</h2></li>
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
	
	<%
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(RailCrossing.class)
			.buildSessionFactory();

	Session session1 = factory.openSession();

	try {

		session1.beginTransaction();

		List<RailCrossing> crossingList = session1.createQuery("from RailCrossing").list();

		session1.getTransaction().commit();
	%>
	

	<h4>
		Railway Crossings[<%=crossingList.size()%>]
	</h4>



	<header class="p-2 text-dark">
		<div class="container-fluid">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					
					<li><div class="text-auto">
						<a class="btn bg-light btn-outline-light me-8 text-dark"
							href="index.jsp">Home</a>
							<a class="btn bg-light btn-outline-light me-8 text-dark"
							href="Add_Crossing.jsp">Add Railway Crossings</a>
							<a class="btn bg-light btn-outline-light me-8 text-dark"
							href="Search_Crossing.jsp">Search Crossings</a>
					</div></li>
				</ul>

			</div>
		</div>
	</header>




	<table class="table table-striped">
		
			<tr>
				<th scope="col">Sr.No</th>
				<th scope="col">Name</th>
				<th scope="col">Address</th>
				<th scope="col">Land Mark</th>
				<th scope="col">Train Schedule</th>
				<th scope="col">Person-In-Charge</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		
		<% for (RailCrossing rail : crossingList) { %>
		
			<tr>
				<td><%=rail.getCrossingId() %></td>
				<td><%=rail.getName() %></td>
				<td><%=rail.getAddress() %></td>
				<td><%=rail.getLandmark()%></td>
				<td><%=rail.getTrainSchedules() %></td>
				<td><%=rail.getPersonInCharge() %></td>
				<td><%=rail.getStatus()%></td>
				<td>
					<div class="text-auto">
						<a class="btn bg-primary btn-outline-light me-8 text-white"
							href="Update_Crossing.jsp?id=<%=rail.getCrossingId()%>">Update</a> 
							
					    <a class="btn bg-danger btn-outline-light me-8 text-white"
					       href="Delete_Crossing.jsp?id=<%=rail.getCrossingId()%>">Delete</a>
					    
					</div>
				</td>
			</tr>
			
			<%
		}

	session1.close();

	} catch (Exception e) {
	System.out.println(e);
	}
	%>


			
	</table>
</body>
</html>