<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.String.*" %>
<%!
   	Connection con;
   	Statement ps;
	ResultSet rs3;
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
<html>
<center>
<body bgcolor=#F0F8FF>
<script type="text/javascript">
function sbmt()
{
   document.fm1.submit();
}
function r()
{
	document.h.submit();
}
</script>
<form name="fm1" method="post" action="details.jsp">

<%
	String n1=request.getParameter("first").trim().toUpperCase();
	String n2=request.getParameter("last").trim().toUpperCase();
	int r=0;
	System.out.println("name retrieved is: "+n1+" and "+n2);
	String s="select PatientID from PatientsTab where ucase([First Name])='"+n1+"' and ucase([Last Name])='"+n2+"'";
	ps=con.createStatement();
	rs3=ps.executeQuery(s);
	System.out.println("executed query hello ");
     while(rs3.next())
	 {
	r++;
    	 String s3=rs3.getString(1);
	    System.out.println(s3);	
%>	
<h1><input type="radio" name="new" value="<%=s3%>"  onclick="sbmt()" /><%=s3%><br><h1>
<%

    }
	if(r==1)
	{
%>
	</form>
<%
	}
	if(r==0)
	{
%>
	<h3>No patient with the given name has been found</h3>
	<a href="./home.jsp" >Click here to go to home page</a>
<%
	}
%>
</center>
</body>
</html>
