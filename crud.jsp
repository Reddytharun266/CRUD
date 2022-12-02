<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@ page errorPage="error.jsp" %>  

<%
String item = request.getParameter("val");  

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
String sql = "SELECT * FROM item_view";
result_set = statement.executeQuery(sql);
if (result_set.next() == true)
{
	result_set.previous();
		List item_list = new ArrayList();
	while(result_set.next())
	{
		item_list.add(result_set.getString("item_ID"));

	}

		String[] str = new String[item_list.size()];
		Iterator it = item_list.iterator();

		int index_counter = 0;
		while(it.hasNext())
		{
			String id = (String)it.next();
			str[index_counter] = id;
			index_counter++;
		}
		result_set.first();
		result_set.previous();
		%>
	<table bgcolor="lightgray" cellpadding="4" cellspacing="4" width="100%">
	<tr>
	<td><b>Item ID</b></td>
	<td><b>Item Name</b></td>
	<td><b>Unit Price</b></td>
	<td><b>Stock Quantity </b></td>
	<td><b>SupplierID</b></td>
	</tr>
	<%
	int count = 0;
		for(int counter = 0; counter < str.length; counter++)
		{
			if(str[counter].toUpperCase().startsWith(item.toUpperCase()))
			{
				result_set.first();
				result_set.previous();
				while(result_set.next())
				{
					if(str[counter].equals(result_set.getString("item_ID")))
					{
						count = 1;
						%>
		                <tr>
		                <td><%=result_set.getString("item_ID")%></td>
		                <td><%=result_set.getString("item_name")%></td>           
		                <td><%=result_set.getString("unit_price")%></td>
		                <td><%=result_set.getString("stock_quantity")%></td>
		                <td><%=result_set.getString("supplier_ID")%></td>
		                <td><%=result_set.getString("edit")%></td>
		                <td><%=result_set.getString("delete")%></td>
		                </tr>
		                <%
					}
				}
			}
		}
		if (count == 0)
		{
			count = 2/0;
		} 
}
else
{
%>
	<label style = "color: red;">Item not found!</label>
<%
}
%>
</table>