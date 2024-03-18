package com.service.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.model.FavCrossings;

@WebServlet("/RemoveFavCrossingDao")
public class RemoveFavCrossingDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int favCrossingId = Integer.parseInt(request.getParameter("id"));
	
	    SessionFactory factory = new Configuration().configure("hibernate.cfg.xml")
	    		.addAnnotatedClass(FavCrossings.class).buildSessionFactory();

	Session session1 = factory.openSession();
	try {
		session1.beginTransaction();
		// FavCrossings deleteRecored = new FavCrossings();

		int i = session1.createQuery("delete from FavCrossings where favCrossingId = " + favCrossingId).executeUpdate();

		session1.getTransaction().commit();
		session1.close();

		if (i > 0) {
			response.sendRedirect("User_Fav_Crossing.jsp");
		}

	} catch (Exception e) {
		System.out.println(e);
	}

	}

}
