<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="/index.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("userid")%>. Your last login was <%= session.getAttribute("lastLogin") %>.
<a href='logout.jsp'>Log out</a>
<%
    }
%>