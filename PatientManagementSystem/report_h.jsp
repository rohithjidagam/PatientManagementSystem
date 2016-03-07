<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%!
   	Connection con;
   	Statement ps; 
	ResultSet rs;
	ResultSetMetaData rmd; 
public void jspInit()
{
try
{
    	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   	con=DriverManager.getConnection("jdbc:odbc:king");
}
   	catch(Exception e)
   	{
     		System.out.println("error occured");
   	}
}
public void jspDestroy()
{
	try
   	{
    		if(ps!=null) ps.close();
     		if(con!=null) con.close();
    	}
    	catch(Exception e)
     	{
     	}
}
%>
<html>
<title>reports</title>
<link type="text/css" rel="stylesheet" href="./day.css" />
<body>
 <%
   
    	String day=request.getParameter("day");
	String month=request.getParameter("month");
	String year=request.getParameter("year1");
	String date=month+"/"+day+"/"+year;
try
{
	if(date==null) 
	{
%>
		<jsp:forward page="disease.html"/>
<%
	}
	else 
	{
  		ps=con.createStatement();     
		String s="select * from TreatmentTab where Date like '"+date+"'";     
		rs=ps.executeQuery(s);
		System.out.println("executed query");
    		rmd=rs.getMetaData();
		int i,n=rmd.getColumnCount();
		int flag=1;
%>
<%
		while(rs.next())
		{
			if(flag==1)
			{
%>
<h3>The details are:</h3>
<table>
<tr>
<%
				for(i=2;i<=rmd.getColumnCount();i++)
				{
%>
					<th><%=rmd.getColumnName(i)%></th>
<%		
					
				}
				flag++;
			}
			if(flag==2)
			{
%>
</tr>		
<%
			}
%>
<tr>
<%
			for(i=2;i<=rmd.getColumnCount();i++)
			{
%>
			<td><%=rs.getString(i)%></td>
<%
			}
%>
</tr>
<%
		}
		if(flag==2)
		{
%>
</table>
<br><br>
<form name="o" method="post" action=""><center>
<input type="button" value="MENU" onclick="window.location='./home.jsp'"; /> 
</form></center></body>
<%
		}
		else
		{
%>
<h3>No data was retrieved for the details entered</h3>
<form name="o" method="post" action=""><center>
<input type="button" value="Re-enter the date" onclick="window.location='./day.jsp'"; /> 
</form>
<%
		}

	}
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
%>
</body>
</html>
