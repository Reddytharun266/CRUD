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
  String sql = "update item set item_name = '" + item_name + "', unit_price = '" + unit_price + "', supplier_ID = '" + supplier_ID + "', stock_quantity = '" + stock_quantity + "' where item_ID = '" + item_ID + "'"; 
  statement.executeUpdate(sql);
}
catch(Exception e)
{
  %><%=e%><%
}

%>
</table>