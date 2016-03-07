<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.lang.*" %>
<%@ page import="javax.servlet.*" %>
<%!
   	Connection con;
   	Statement ps; 
	ResultSet rs;
	Date currentDate = new Date();
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
<jsp>
<head>
<title>
welcome to sastry's clinic
</title>
</head>
<body>
 <%
	String name=request.getParameter("username");
  	String password=request.getParameter("password");
	session.setAttribute("username",name);
	session.setAttribute("password",password);
	String s2="logged on";
	session.setAttribute("id",s2);
try
{
	String s="";
	if(name==null||password==null) 
	{
%>
		<jsp:forward page="./login.jsp"/>
<%
	}
	else 
	{
  		ps=con.createStatement();     
		s="select * from login where username='"+(String)session.getAttribute("username")+"' and password='"+(String)session.getAttribute("password")+"'";     
		rs=ps.executeQuery(s);
    		if(rs.next())
    		{
%>
			<jsp:forward page="./home.jsp" />
<%
		}
		else
		{
			out.println("<h1>INVALID USERNAME/PASSWORD</h1>");
    			out.println("<a href=login.jsp>TRY AGAIN</a>");
		}
	} 
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
   
%>
</body>
</jsp>


 

 