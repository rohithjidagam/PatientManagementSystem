<%@ page import="java.sql.*" %>
<%!
   Connection con;
   PreparedStatement ps;
   
 public void jspInit()
 {
   try
   {
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    System.out.println("Driver Loaded");
   con=DriverManager.getConnection("jdbc:odbc:king");
   ps=con.prepareStatement("INSERT INTO PatientsTab values(?,?,?,?,?,?,?)");
   }
   catch(Exception e)
   {
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
 <%
try
{
     String 
    ps.setString(2,request.getParameter("id0"));
	ps.setString(2,request.getParameter("id0"));
	ps.setString(2,request.getParameter("id0"));
	ps.setString(2,request.getParameter("id0"));
	ps.setString(2,request.getParameter("id0"));
	ps.setString(2,request.getParameter("id0"));
	ps.setString(2,request.getParameter("id0"));
	