package com.service.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminValidationDao")
public class AdminValidationDao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminValidationDao() {
	}

	private boolean isvalidate(String uname, String pass) {
		if (uname.equals("Admin") && pass.equals("Admin@123"))
			return true;
		else
			return false;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uname = request.getParameter("username");
		String pass = request.getParameter("password");

		if (isvalidate(uname, pass)) {
			HttpSession session = request.getSession(true);
			session.setAttribute("username", uname);

			RequestDispatcher rd = request.getRequestDispatcher("Admin_Home.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("error","Invalid Username or Password");
			RequestDispatcher rd = request.getRequestDispatcher("Admin_Login.jsp");
			rd.include(request, response);
		}

	}

}
