<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%!
   Connection con;
   Statement s0;
   Statement ps;
   PreparedStatement ps2;
   ResultSet rs;
 public void jspInit()
 {
   try
   {
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    System.out.println("Driver Loaded");
   con=DriverManager.getConnection("jdbc:odbc:king");
   s0=con.createStatement();
   ps2=con.prepareStatement("Insert into Medicine values(?,?,?,?)");
   }
   catch(Exception e)
   {
   }
 }
 public void jspDestroy()
 {
   try
   {
    if(ps2!=null) ps2.close();
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
  int k=0;
  System.out.println("Pid is"+request.getParameter("id"));
  DateFormat df = new SimpleDateFormat("M/d/yyyy");
  String d4=df.format(new java.util.Date());
  String id=request.getParameter("id");
  String treat=request.getParameter("pres");
  String s="select PatientID from Medicine where PatientID like '"+id+"' and Date like '"+d4+"'";
  ps=con.createStatement();
  rs=ps.executeQuery(s);
  if(!treat.equals(" "))
  {
	k=0;
	while(rs.next())
	{
		System.out.println("Inside while");
		k++;
		break;
	}
  if(k==0)
  {
  ps2.setString(1,id);
  ps2.setString(2,d4);
  System.out.println("heeel");
  ps2.setString(3,treat);
  ps2.setString(4,request.getParameter("fee"));
  ps2.executeUpdate();
  System.out.println("abcdefgh");
  }
  }
%>
<jsp:forward page="./form0.jsp" />
<%
}
catch(Exception l)
{
	System.out.println(l.getMessage());
}
%>