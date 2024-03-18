package com.service.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.model.RailCrossing;

@WebServlet("/AddCrossingDao")
public class AddCrossingDao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	int addRailCrossing(RailCrossing rc) {
		SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(RailCrossing.class)
				.buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		int i = (Integer) session.save(rc);
		session.getTransaction().commit();

		session.close();
		return i;

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String address = request.getParameter("add");
		String landmark = request.getParameter("landmark");
		String trainSchedule = request.getParameter("train");
		String personInCharge = request.getParameter("person");
		String status = request.getParameter("status");

		RailCrossing rc = new RailCrossing(name, address, landmark, trainSchedule, personInCharge, status);

		int i = addRailCrossing(rc);
		if (i > 0)
			response.sendRedirect("Admin_Home.jsp");
		else
			response.sendRedirect("Add_Crossing.jsp");
		
	}

}
