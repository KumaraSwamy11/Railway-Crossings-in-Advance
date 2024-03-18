package com.service.user;

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

import com.model.FavCrossings;
import com.model.RailCrossing;


@WebServlet("/FavCrossingDao")
public class FavCrossingDao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int crossingId = Integer.parseInt(request.getParameter("id"));

		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml")
				.addAnnotatedClass(RailCrossing.class).addAnnotatedClass(FavCrossings.class)
				.buildSessionFactory();

		Session session1 = factory.openSession();

		try {
			session1.beginTransaction();

			RailCrossing rail = session1.get(RailCrossing.class, crossingId);
              
			if (rail != null) {

				FavCrossings fc = new FavCrossings(rail.getName(), rail.getAddress(), rail.getLandmark(),
						rail.getTrainSchedules(), rail.getPersonInCharge(), rail.getStatus());
             
				
				int i = (Integer) session1.save(fc);
				session1.getTransaction().commit();
				session1.close();
				if (i > 0)
					response.sendRedirect("User_Fav_Crossing.jsp");
				else
					response.sendRedirect("User_Home.jsp");

			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	
}
