<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
   try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://aa1x7mlglnvij47.csiau6mgouoq.us-east-1.rds.amazonaws.com:3306/webapp",
            "root", "padma123");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into demo(first_name, last_name, email, uname, pass, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "', NOW())");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("registrationSuccess.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("/index.jsp");
    }
   }
   catch(Exception e){
	  System.out.println(e);
   }
%>