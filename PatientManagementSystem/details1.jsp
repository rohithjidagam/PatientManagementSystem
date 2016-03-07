<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%!
   	Connection con;
   	Statement ps;
	ResultSet rs,rs1;
	ResultSetMetaData rmd,rmd1; 
public void jspInit()
{
try
{
    	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   	con=DriverManager.getConnection("jdbc:odbc:king");
	System.out.println("connection");
   
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
<script type="text/javascript">
function sbmt1()
{
  document.det.action="./edit.jsp";
  document.det.submit();
}
</script>
<html>
<head>
<link type="text/css" rel="stylesheet" href="./details.css" />
</head>
<body>
<h2>The patient details are:</h2>
<%
	String name1=request.getParameter("new");
	System.out.println("name retrieved is:"+name1);
	String s="select * from PatientsTab where PatientID='"+name1+"'";
	ps=con.createStatement();
	rs=ps.executeQuery(s);
	System.out.println("executed query hello ");
    	rmd=rs.getMetaData();
	rs.next();
	int n=rmd.getColumnCount();
	String s1;
	int y;
	int no=0;
%>
<form name="det" method="post" action="">
<input type="hidden" name="new" value="<%=request.getParameter("new")%>" />
<input type="hidden" name="i" value="<%=rs.getInt(1)%>" />
<center>
<table width="80%" border="2">
<tr>
<td> <table width="100%">
     <tr><td>
<%
     int k=0;
	for(int i=2;i<=rmd.getColumnCount();i++,no++,k++)
	{
	
     if(k%3==0)
	 {
%>
       </td></tr><tr><td>
<% } %>	   
    <b><%=rmd.getColumnName(i)%>:</b><br>
<%
	if(i!=6)
	{ %>
		<textarea name="<%=no%>" rows="4" cols="30"><%=rs.getString(i)%></textarea>
	<%}
	else
	{%>
		<textarea name="<%=no%>" rows="4" cols="30"><%=rs.getInt(i)%></textarea>	
	<%}
%>
	</td><td>
<%	
	}
%>
   </td></tr>
   </table>
   </td>
   </tr></table></center>
   <center>
   <input type="button" value="Save" onclick="sbmt1()" />
   <input type="button" value="Back" onclick=history.back(); />
   <input type="button" value="Home" onclick="window.location='./home.jsp'"; />
   </center>
 </form>
</body>
</html>
