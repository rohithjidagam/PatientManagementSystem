<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%!
	int flag=0;
	int q=1;
	int no=0;
   	Connection con;
   	Statement ps; 
public void jspInit()
{
try
{
    	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   	con=DriverManager.getConnection("jdbc:odbc:King");
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
<link type="text/css" rel="stylesheet" href="./patient.css" />
</head>
<body>
<img id="new" src="./images/doctors.jpg" height=600 width=600 />
<script type="text/javascript">
function validate(form)
{
	form.submit();
}
</script>
<%
    	String id=request.getParameter("patient");
	id=id+"-__";
	System.out.println("id retrieved is"+id);
	
	try
{
	if(id==null) 
	{
%>
		<jsp:forward page="home.jsp"/>
<%
	}
	else 
	{
  		ps=con.createStatement(); 
			System.out.println("executed query");
		String s="select PatientID,`First Name` from PatientsTab where PatientID like '"+id+"'";     
		ResultSet rs=ps.executeQuery(s);
		System.out.println("executed query");
%>
<%
		no=0;
		q=1;
		flag=0;
    		while(rs.next())
    		{			
			if(q==1)
			{
%>
				<h1>The patients with the given id's are:</h1>
				<form name='details' action='details.jsp' method='POST'>
			<%
				q++;
			}
%>
			The patient name is:<input type="radio" name="new" value="<%=rs.getString(1)%>" onclick="validate(this.form);" /><%=rs.getString(2)%>
			<br /><br />
<%
			flag=1;
			no++;
		}
%>
		</form>
<%
		if(flag==1)
		{
%>
		<a href="./home.jsp" style="font-size:20px;">Click here to go to main page</a>
<%
		}
		if(flag==0)
		{
		System.out.println("Inside else");
%>
		<h1>id not present in the table</h1>
    		<a href=home.jsp>TRY AGAIN</a>
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
