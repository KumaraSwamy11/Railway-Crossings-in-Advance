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

import com.model.User;

@WebServlet("/UserRegistrationDao")
public class UserRegistrationDao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	int insertUser(User user) {
		SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(User.class)
				.buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		int i = (Integer) session.save(user);
		session.getTransaction().commit();

		session.close();
		return i;

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uname = request.getParameter("username");
		String email = request.getParameter("email");
		String pass = request.getParameter("password");

		User user = new User(uname, email, pass);

		int i = insertUser(user);
		PrintWriter out = response.getWriter();
		if (i > 0)
			out.println("Record Inserted");
		else
			out.println("Record not Inserted");

	}

}
