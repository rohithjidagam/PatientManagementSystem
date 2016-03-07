<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%!
   	Connection con;
   	Statement ps; 
	ResultSet rs,rs1;
	ResultSetMetaData rmd; 
	int flag;
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
<link type="text/css" rel="stylesheet" href="./disease.css" />
<body>
 <%
   
    	String dis=request.getParameter("disease").trim();
	System.out.println("retrieved data is"+dis);
try
{
	if(dis==null) 
	{
%>
		<jsp:forward page="day.jsp"/>
<%
	}
	else 
	{
  		ps=con.createStatement(); 
		String s="select T1.ID,T1.PatientID,T1.Date,T1.Progress,T1.`Complaints Relieved`,T1.`Complaints Appeared`,T1.`Treatment Given`,T1.Fees from TreatmentTab T1 LEFT OUTER JOIN PatientsTab P ON P.PatientID=T1.PatientID where P.Diagnosis like '%"+dis+"%'"+";";
		rs=ps.executeQuery(s); 
		System.out.println("Query executed successfully");
		rmd=rs.getMetaData();
		int i,n=rmd.getColumnCount();
		flag=1;
		while(rs.next())
		{
			if(flag==1)
			{
%>
			<h3>The details are:</h3>
			<table>
			<tr>
<%
				for(i=2;i<=rmd.getColumnCount()-1;i++)
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
			for(i=2;i<=rmd.getColumnCount()-1;i++)
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
<input type="button" value="Re-enter the disease name" onclick="window.location='./disease.jsp'"; /> 
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
