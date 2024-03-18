<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.cfg.Configuration"%>
<%@ page import="com.model.RailCrossing"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		int crossingId = Integer.parseInt(request.getParameter("id"));
	
	    SessionFactory factory = new Configuration().configure("hibernate.cfg.xml")
	    		.addAnnotatedClass(RailCrossing.class).buildSessionFactory();

	Session session1 = factory.openSession();
	try {
		session1.beginTransaction();
		RailCrossing deleteRecored = new RailCrossing();

		int i = session1.createQuery("delete from RailCrossing where crossingId = " + crossingId).executeUpdate();

		session1.getTransaction().commit();
		session1.close();

		if (i > 0) {
			response.sendRedirect("Admin_Home.jsp");
		}

	} catch (Exception e) {
		System.out.println(e);
	}
	%>

</body>
</html>