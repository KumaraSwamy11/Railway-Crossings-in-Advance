package com.service.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.model.User;


@WebServlet("/UserValidationDao")
public class UserValidationDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
        String uname = request.getParameter("username");
        String pass = request.getParameter("password");
       
        
       if( validateUser(uname, pass))
       {
    	   HttpSession session = request.getSession(true);
		session.setAttribute("username", uname);

		RequestDispatcher rd = request.getRequestDispatcher("User_Home.jsp");
		rd.forward(request, response);
	} else {
		request.setAttribute("error","Invalid Username or Password");
		RequestDispatcher rd = request.getRequestDispatcher("User_Login.jsp");
		rd.include(request, response);
	}
     
	}

	public boolean validateUser(String uname, String pass) {

		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class)
				.buildSessionFactory();
		
		Session session = factory.openSession();

		try {

			session.beginTransaction();

			List<User> userList = session.createQuery("from User").list();
			
			session.getTransaction().commit();
	
			for(User user: userList)
			{
				if(user.getUsername().equals(uname)&& user.getPassword().equals(pass))
				return true;
				else
					return false;
			}
			
			session.close();
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return false;
	}

}
