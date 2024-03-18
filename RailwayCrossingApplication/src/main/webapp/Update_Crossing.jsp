<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>    
<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.cfg.Configuration"%>
<%@ page import="com.model.RailCrossing"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update_Crossing</title>

<%@ include file="bootstrap.jsp" %>

  <style>
        body {
            font-family: Arial, sans-serif;        
        }

        .login-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            width: 500px;
            margin: 100px auto;
            padding: 20px;
        }

        h1,h4 {
            margin-bottom: 20px;
            text-align:center;
            
        }

        label{
        padding: 5px;
        margin: 5px 0;
        }
        
        
        input[type="text"],
        input[type="password"],
        textarea
        {
            width: 90%;
            padding: 10px;
            margin: 8px 0;
            border: 2px solid #ccc;
            border-radius: 10px;
        }

        button {
            width: 95%;
            padding: 10px;
            background-color: lightgreen;
            color: white;
            border: none;
            border-radius: 15px;
            cursor: pointer;
        }

        button:hover {
            background-color: green;
        }

        .signup-link {
            margin-top: 10px;
        }
    </style>
</head>
<body>

<%
// Get the crossingId from the request parameter
int crossingId = Integer.parseInt(request.getParameter("id"));

// Create a Hibernate session factory
SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(RailCrossing.class)
        .buildSessionFactory();

Session session1 = factory.openSession();

try {
    session1.beginTransaction();

    // Retrieve the RailCrossing record based on crossingId
    RailCrossing rc = session1.get(RailCrossing.class, crossingId);

    if (rc != null) { // Check if the record exists

%>
    <div class="login-container">
        <h1>Railway Crossing</h1>
        <h4>Update Railway Crossing Information</h4>
        <form action="UpdateCrossingDao" method="post">
            <input type="hidden" name="id" value="<%=rc.getCrossingId()%>">
            <label><b>Enter Name:</b></label> 
            <input type="text" name="name" value="<%=rc.getName()%>" required><br>
         
            <label><b>Address:</b></label> 
            <input type="text" name="add" value="<%=rc.getAddress()%>" required><br>
            <label><b>Landmark:</b></label>
            <textarea style="height:90px" name="landmark" id="landmark"><%=rc.getLandmark()%></textarea><br>
           
            <label><b>Train Schedule:</b></label> 
            <input type="text" name="train" value="<%=rc.getTrainSchedules()%>" required><br>
            <label><b>Person In-Charge:</b></label> 
            <input type="text" name="person" value="<%=rc.getPersonInCharge()%>" required><br>
           
            <label><b>Crossing status:</b></label><br>
            <input type="radio" name="status" value="Open" 
            <%=rc.getStatus().equals("Open")?"checked":"" %>>
            <label>Open</label>
           
            <input type="radio" name="status" value="Close" 
            <%= rc.getStatus().equals("Close")?"checked":"" %>>
            <label>Close</label><br>
            
            <button type="submit">Submit</button>
        </form>
    </div>
<%
    } else {
%>
    <div class="login-container">
        <h1>Railway Crossing</h1>
        <h4>No record found for this ID.</h4>
    </div>
<%
    }

    session1.getTransaction().commit();
    session1.close();

} catch (Exception e) {
    System.out.println(e);
}
%> 

</body>
</html>