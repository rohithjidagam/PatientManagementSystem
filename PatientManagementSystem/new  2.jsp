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
<html>
<head>
<script type="text/javascript">
function validate1(n)
{
	document.getElementById("h2").style.visibility="visible";
	document.getElementById("h1").style.visibility="hidden";
	var i;
	for(i=0;i<=20;i++)
	{
		document.getElementById("id"+i).style.visibility="visible";
		document.getElementById("i"+i).style.visibility="hidden";
	}
}
</script>
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
	System.out.println("executed query");
    	rmd=rs.getMetaData();
	rs.next();
	int n=rmd.getColumnCount();
	String Id[]=new String[n];
	String Id1[]=new String[n];
	String s1;
	int y;
	int no=0;
%>
<form name="det" method="post" action="edit.jsp">

<center>
<table width="60%" border="2">
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
    <b><%=rmd.getColumnName(i)%>:</b>
<%
	Id[no]="id"+no;
	Id1[no]="i"+no;
	
	
	if(i!=6)
	{
		s1=rs.getString(i);
%>      
		<em id="<%=Id1[no]%>" style="visibility:visible"><%=s1%></em>
		<input type="text" id="<%=Id[no]%>" name="<%=Id[no]%>" style="visibility:hidden" value="<%=s1%>" />
<%
	}
	else
	{
		y=rs.getInt(i);
%>
	 	<em id="<%=Id1[no]%>" style="visibility:visible"><%=y%></em>
		<input type="text" id="<%=Id[no]%>" name="<%=Id[no]%>" style="visibility:hidden" value="<%=y%>"  />
<%
	}
%>
	</td><td>
<%	
	}
%>
   </td></tr>
   </table>
   </td>
   </tr></table></center>
 <%
           
	String s2="select * from TreatmentTab where PatientID='"+name1+"'";
	ps=con.createStatement();
	rs1=ps.executeQuery(s2);
	System.out.println("executed query--2");
    	rmd1=rs1.getMetaData();
	
	int n1=rmd1.getColumnCount();
%>
<center>
<br><br><br>
<table width="60%">
<tr>
<%
    for(int i=1;i<=n1;i++)
 
  {
%>
    <th><%=rmd1.getColumnName(i)%></th>
 <% 
  }
 %>
</tr>
  <%
       while(rs1.next())
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
<br />
<input type="button" id="h1" name="b1" value="Edit" onclick="validate1(<%=n%>);" /><br /><br />
<a href="./pres_treat.jsp"><img src="./images/past.gif" /></a><br /><br />
<input type="submit" id="h2" name="b1" value="Done Editing" style="visibility:hidden" />
</p>
</form>
</body>
</html>
