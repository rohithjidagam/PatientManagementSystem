<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<%@ page import="javax.servlet.http.HttpServlet" %>

<%!
   	Connection con;
   	Statement ps;	
	Statement ps1;
	ResultSet rs3;
	ResultSet rs4;
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
<%

String u=request.getParameter("user");
String e=request.getParameter("e_p");
String n=request.getParameter("n_p");
String c=request.getParameter("c_p");
int k=1,r=1;
List error=new LinkedList();
request.setAttribute("errorMsg",error);
request.setAttribute("user",u);
if(!(u.length()!=0&&e.length()!=0&&n.length()!=0&&c.length()!=0))
{
	r++;
	error.add("Please fill all the data");
}
if(!n.equals(c))
{
	k++;
	error.add("The new password and the confirm password are not the same");
}
if(k==1&&r==1)
{
ps=con.createStatement();
String s="select * from login where username='"+u+"' and password='"+e+"'";     
rs3=ps.executeQuery(s);
if(rs3.next())
{
			if(k!=2)
			{	
				ps1=con.createStatement();
				String s1="update login set password='"+c+"'"+" where username='"+u+"'";
				try
				{
					rs4=ps1.executeQuery(s1); 
					if(!rs4.next())
						error.add("Unable to change password");
				}
				catch(Exception l)
				{	
				}
			}	
}
else
{
	error.add("The username/password you entered is wrong");
}
}
if(! error.isEmpty())
{
	RequestDispatcher rd=request.getRequestDispatcher("./change.jsp");
	rd.forward(request,response);
}
else
{
	RequestDispatcher rd=request.getRequestDispatcher("./success.jsp");
	rd.forward(request,response);
}
%>