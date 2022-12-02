<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page errorPage="error.jsp" %>  

<%
String item_ID = request.getParameter("val");

try 
{
  Class.forName("com.mysql.jdbc.Driver");
} 
catch (ClassNotFoundException e) 
{
  e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
connection = DriverManager.getConnection("jdbc:mysql://165.22.14.77/" + "dbTharun", "Tharun", "pwdTharun");
statement = connection.createStatement();
try
{
    String sql = "delete from item where item_ID = '" + item_ID + "'";
    statement.executeUpdate(sql);
}
catch(Exception e)
{
  %><%=e%><%
}

%>
</table>