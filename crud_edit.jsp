<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String item = request.getParameter("val");  
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://165.22.14.77/";
String dbName = "dbTharun";
String userId = "Tharun";
String password = "pwdTharun";

try 
{
        Class.forName(driverName);
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
try 
{		
        connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
        statement = connection.createStatement();
        String sql = "SELECT * FROM item where item_ID = " + "'" + item + "'";
        result_set = statement.executeQuery(sql);
        if (result_set.next() == true)
        {
        	%>
                <body>
                <FORM id ="update_id" NAME = "update_form">
                <table bgcolor = "lightgray" cellpadding = "4" cellspacing = "4" align="CENTER">
                        <tr><td><a>Item ID </a></td><td><input type = "text" name = "item_ID" id = "item_ID" value="<%=result_set.getString("item_ID")%>" required></td></tr>
                        <tr><td><a>Item name</a></td><td><input type = "text" name = "item_name" id = "item_name" value="<%=result_set.getString("item_name")%>" required></td></tr>
                        <tr><td><a>Unit Price</a></td><td><input type = "text" name = "unit_price" id = "unit_price" value="<%=result_set.getString("unit_price")%>" required></td></tr>
                        <tr><td><a>Stock quantity</a></td><td><input type = "text" name = "stock_quantity" id = "stock_quantity" value="<%=result_set.getString("stock_quantity")%>" required></td></tr>
                        <tr><td><a>Supplier ID</a></td><td><input type = "text" name = "supplier_ID" id = "supplier_ID" value = "<%=result_set.getString("supplier_ID")%>" required></td></tr>
                        <tr><td  align = "right"><button onclick = 'add_item()'>Add</button></td>
                        <td align = "center"><button id="edit" onclick = "update()">Update</td></tr>
                        <tr><td><a>Search</a></td><td><input type = "text" name = "item_ID_search" id = "item_ID_search" onkeyup = "send_edit_information()"></td></tr>
                </form>  
                </body>
                <%
        }
        else
        {
        %>
        	<label style = "color: red;">Item not found!</label>
        <%
        }
} 
catch (Exception e) 
{
	out.print("Item not found!");  
}
%>
