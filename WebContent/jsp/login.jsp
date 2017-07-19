<%@page import="java.time.LocalDateTime"%>
<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://aa1x7mlglnvij47.csiau6mgouoq.us-east-1.rds.amazonaws.com:3306/webapp",
            "root", "padma123");
    Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
    ResultSet rs;
    rs = st.executeQuery("SELECT * from demo where uname='" + userid + "' and pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        session.setAttribute("lastLogin", rs.getTimestamp(6));
        rs.updateTimestamp(6, Timestamp.valueOf(LocalDateTime.now()));
        rs.updateRow();
        session.setAttribute("test", rs.getTimestamp(6));
       
        
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("loginSuccess.jsp");
    } else {
        out.println("Invalid password <a href='/index.jsp'>try again</a>");
    }

%>
