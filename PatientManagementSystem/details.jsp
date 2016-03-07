<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

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
function sbmt()
{
  document.det.action="./details1.jsp";
  document.det.submit();
}
function sbmt1()
{
  document.det.action="./pres_treat.jsp";
  document.det.submit();
}
</script>
<html>
<head>
<link type="text/css" rel="stylesheet" href="./details.css" />
</head>
<body>
<h2>The patient details are:</h2>
<form name="det" method="post" action="">
<center>
<input type="button" name="b1" value="EDIT" style="font-size:15px;" onclick="sbmt();" />
<input type="button" name="b2" value="CONTINUE" style="font-size:15px;" onclick="sbmt1();" />
<input type="button" name="b2" value="HOME" style="font-size:15px;" onclick="window.location='./home.jsp'"; />
</center> <input type="hidden" name="new" value="<%=request.getParameter("new")%>" />
<%
	String name1=request.getParameter("new");
	System.out.println("name retrieved is:"+name1);
	String s="select * from PatientsTab where PatientID='"+name1+"'";
	ps=con.createStatement();
	rs=ps.executeQuery(s);
	System.out.println("executed query");
    	rmd=rs.getMetaData();
	rs.next();
	int n=rmd.getColumnCount();
	String s1;
	int y;
	int no=0;
%>


<center>
<table width="60%" border="2">
<tr>
<td> 
<%
     int k=0;
	for(int i=2;i<=rmd.getColumnCount();i++,no++,k++)
	{
	
     if(k%3==0&&k!=0)
	 {
%>
       </td></tr><tr><td>
<% } %>	   
    <b><%=rmd.getColumnName(i)%>:</b><br></td><td>
<%
	if(i!=6)
	{ %>
		<%=rs.getString(i)%><br>
	<%}
	else
	{%>
		<%=rs.getInt(i)%><br>
	<%}
%>
	</td><td>
<%	
	}
%>
   </td>
   </tr></table></center>
 <%
           
	String s2="select * from TreatmentTab where PatientID='"+name1+"'";
	ps=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	rs1=ps.executeQuery(s2);
	System.out.println("executed query--2");
    	rmd1=rs1.getMetaData();
	rs1.afterLast();
	int n1=rmd1.getColumnCount();
%>
<center>
<br><br><br>
<table width="80%">
<tr>
<%
    for(int i=1;i<n1;i++)
 
  {
%>
    <th><%=rmd1.getColumnName(i)%></th>
 <% 
  }
 %>
</tr>
  <%
       while(rs1.previous())
       {
 %>
<tr>
         <td><%=rs1.getInt(1)%></td>
         <td><%=rs1.getString(2)%></td>
         <td><%=rs1.getString(3)%></td>
         <td><%=rs1.getString(4)%></td>
         <td><%=rs1.getString(5)%></td>
         <td><%=rs1.getString(6)%></td>
	   <td><%=rs1.getString(7)%></td>

</tr>
<%
       }


    
%>
</table>
</center>
<br>
</form>
</body>
</html>
