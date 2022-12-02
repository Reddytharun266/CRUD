<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page errorPage="error.jsp" %>  

<%

String item_ID = request.getParameter("item_ID");
String item_name = request.getParameter("item_name");
String unit_price = request.getParameter("unit_price");
String stock_quantity = request.getParameter("stock_quantity");
String supplier_ID = request.getParameter("supplier_ID");

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
ResultSet result_set = null;
%>
<%
connection = DriverManager.getConnection("jdbc:mysql://165.22.14.77/" + "dbTharun", "Tharun", "pwdTharun");
statement = connection.createStatement();
try
{
  String sql = "insert into item values('" + item_ID + "', '" + item_name + "', '" + unit_price + "', '" + supplier_ID + "', '" + stock_quantity + "')";
  statement.executeUpdate(sql);
}
catch(Exception e)
{
  %><%=e%><%
}

%>
</table>