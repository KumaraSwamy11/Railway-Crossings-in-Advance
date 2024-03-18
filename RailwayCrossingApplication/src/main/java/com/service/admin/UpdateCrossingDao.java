package com.service.admin;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import com.model.RailCrossing;

@WebServlet("/UpdateCrossingDao")
public class UpdateCrossingDao extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int crossingId = Integer.parseInt(request.getParameter("id"));

            SessionFactory factory = new Configuration().configure("hibernate.cfg.xml")
                    .addAnnotatedClass(RailCrossing.class).buildSessionFactory();

            Session session = factory.openSession();
            session.beginTransaction();

            RailCrossing rc = session.get(RailCrossing.class, crossingId);

            if (rc != null) {
                rc.setName(request.getParameter("name"));
                rc.setAddress(request.getParameter("add"));
                rc.setLandmark(request.getParameter("landmark"));
                rc.setTrainSchedules(request.getParameter("train"));
                rc.setPersonInCharge(request.getParameter("person"));
                rc.setStatus(request.getParameter("status"));

                session.update(rc);
                session.getTransaction().commit();
                session.close();
                response.sendRedirect("Admin_Home.jsp"); 
            } else {
                session.getTransaction().rollback();
                session.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
