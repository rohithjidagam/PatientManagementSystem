<%@ page import="java.sql.*" %>
<%!
   Connection con;
   PreparedStatement ps;
   Statement sss;
 public void jspInit()
 {
   try
   {
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    System.out.println("Driver Loaded");
   con=DriverManager.getConnection("jdbc:odbc:king");
   sss=con.createStatement();
   ps=con.prepareStatement("INSERT INTO PatientsTab values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
   String s4=request.getParameter("0");
    System.out.println("hii  jagga "+s4);
   String s5="Delete from PatientsTab where PatientID='"+s4+"'";
   sss.execute(s5);
   
   System.out.println("The details are \n"+s4);
   String s6=request.getParameter("i");
   System.out.println("The no is "+s6);
   ps.setInt(1,Integer.parseInt(s6));
   ps.setString(2,request.getParameter("0"));
   ps.setString(3,request.getParameter("1"));
  ps.setString(4,request.getParameter("2"));
  ps.setString(5,request.getParameter("3"));
  ps.setInt(6,Integer.parseInt(request.getParameter("4")));
  ps.setString(7,request.getParameter("5"));
  ps.setString(8,request.getParameter("6"));
  ps.setString(9,request.getParameter("7"));
  ps.setString(10,request.getParameter("8"));
  ps.setString(11,request.getParameter("9"));
  ps.setString(12,request.getParameter("10"));
  ps.setString(13,request.getParameter("11"));
  ps.setString(14,request.getParameter("12"));
  ps.setString(15,request.getParameter("13"));
  ps.setString(16,request.getParameter("14"));
  ps.setString(17,request.getParameter("15"));
  ps.setString(18,request.getParameter("16"));
  ps.setString(19,request.getParameter("17"));
  ps.setString(20,request.getParameter("18"));
  ps.setString(21,request.getParameter("19"));
  ps.setString(22,request.getParameter("20"));
  ps.execute();
  System.out.println("xjkfdgjh");
  %>
  <input type="hidden" name="new" value="<%=request.getParameter("new")%>" />
    <jsp:forward page="./editsucess.jsp" />
  <%
}
 catch(Exception j)
{
  System.out.print(j.getMessage());
}
 %>
 