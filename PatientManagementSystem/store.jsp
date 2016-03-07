<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%!
   Connection con;
   PreparedStatement ps1;
   Statement s0;
   ResultSet rss,rss1;
 public void jspInit()
 {
   try
   {
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    System.out.println("Driver Loaded");
   con=DriverManager.getConnection("jdbc:odbc:king");
   s0=con.createStatement();
   ps1=con.prepareStatement("INSERT INTO TreatmentTab values(?,?,?,?,?,?,?,?)");
   }
   catch(Exception e)
   {
   }
 }
 public void jspDestroy()
 {
   try
   {
    if(ps1!=null) ps1.close();
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
   DateFormat df = new SimpleDateFormat("M/d/yyyy");
   String d4=df.format(new java.util.Date());
   System.out.println("date is "+d4);	
   String s7=request.getParameter("new"); 
   String s8="select max(ID) from TreatmentTab";
   String s9="SELECT timestamp();";
   rss=s0.executeQuery(s8);
   rss.next();
   int n3=rss.getInt(1);
   n3=n3+1;
   System.out.println("The details are  \n"+s7+"hello"+n3+"hello1");
   ps1.setInt(1,n3);
   ps1.setString(2,s7);
   ps1.setString(3,d4);
   ps1.setString(4,request.getParameter("pr"));
   ps1.setString(5,request.getParameter("cr"));
   ps1.setString(6,request.getParameter("ca"));
   ps1.setString(7,request.getParameter("tg"));
   ps1.setString(8,request.getParameter("fee"));
   ps1.executeUpdate();
   System.out.println("xjkfdgjh");
  %>
<html>
 <body>
<h1>DETAILS ARE STORED SUCCESSFULLY</h1>
<br> <br> 
<input type="button" value="MENU" onclick="window.location='./home.jsp'";><br> <br>
</input>
</body>
</html>
<%
}
 catch(Exception j)
{
%>
<html>
<body>
<h3>Did not enter the details properly. please fill the form properly<h3/>
<%System.out.println(request.getParameter("new"));
%>
<input type="button" Value="Back" style="font-size:23px;" onclick="window.location='./pres_treat.jsp'";>
<%
  System.out.print(j.getMessage());
}
 %>


