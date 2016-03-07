<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
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
<script type="text/javascript">
function k()
{
		alert('you are about to close this page');
		document.r.submit();
}
function p()
{
	setTimeout('self.close()',3000);
}
</script>
</head>
<body bgcolor="#F0F8FF" onload="p();" onbeforeunload="k();">
<center>
<%
            ps=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 
		System.out.println("1");
		DateFormat df = new SimpleDateFormat("M/d/yyyy");
		String s2=df.format(new java.util.Date());
		System.out.println("date is "+s2);
		String pid1=request.getParameter("pid");
		System.out.println("Id is "+pid1+"date is "+s2);
		String s="select [Treatment Given],Fees from TreatmentTab where PatientID='"+pid1+"' and Date='"+s2+"'";
		String s11=" ";
		String s22=" ";
		try
		{     
		ResultSet rs8=ps.executeQuery(s);
		System.out.println("2  6");
		rs8.next();
		System.out.println("3"); 
		s11=rs8.getString(1);
		s22=rs8.getString(2);
		}
		catch(Exception e2)
		{ 
%>
			<h3>NO PRESCRIPTION AVAILABLE</h3>
			</body>
			</html>
<%
			System.out.println(e2.getMessage());
		}
		
%>
       <form name="r" id="n" action="./medicine.jsp" method="get">
       PatientID:<input type="text" name="id" value="<%=pid1%>" READONLY/><br /><br />
        <textarea name="pres" rows="5" cols="50" READONLY><%=s11%></textarea>
		<br><br>
		Fees:<input type="text" name="fee" value="<%=s22%>" READONLY /><br /><br />
   <input type="submit" value="BACK"/>

		
      </form>
</center>
	  </body>
	  </html>
	  