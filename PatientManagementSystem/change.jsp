<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.String.*" %>

<html>
<head>
<title>
Change password
</title>
<link type="text/css" rel="stylesheet" href="./changepass.css" />
</head>
<body>
<h1>Change your existing password</h1>
<%
int k=0;
List errorMsg=(List)request.getAttribute("errorMsg");
try
{
if(!errorMsg.isEmpty())
{
	k++;
	Iterator items=errorMsg.iterator();
%>
	<p>Please correct the following errors before proceeding
	<ul>
<%
	while(items.hasNext())
	{
		String message=(String)items.next();
%>		
		<li><%=message%></li>
<%
	}
}
}
catch(Exception e)
{
}
if(k==1)
{
%>
	</ul>
	</p>
<%
}
%>
<div class="main">
<p class="form">
<form name="change" action="./changepass.jsp" method="post">
<table>
<tr><td>Username:</td><td><input type="text" name="user" value="" /><br /><br /></td></tr>
<tr><td>Existing password:</td><td><input type="password" name="e_p" value="" /><br /><br /></td></tr>
<tr><td>New password:</td><td><input type="password" name="n_p" value="" /><br /><br /></td></tr>
<tr><td>Confirm password:</td><td><input type="password" name="c_p" value="" /><br /><br /></td></tr>
<tr><td></td><td><input type="submit" value="change password" /></td></tr>
</table>
</form>
</p>
</body>
</html>