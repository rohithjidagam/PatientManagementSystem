<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.lang.*" %>
<html>
<head>
<title>
Welcome to the home page
</title>
<script type="text/javascript">
window.history.forward(1);
function sbmt1()
{
  document.search.action="./patient.jsp";
  document.search.submit();
}
function sbmt2()
{
  document.search.action="./patient1.jsp";
  document.search.submit();
}
function sbmt3()
{
  document.search.action="./new.jsp";
  document.search.submit();
}
function sbmt4()
{
  document.search.action="./day.jsp";
  document.search.submit();
}
function sbmt5()
{
  document.search.action="./disease.jsp";
  document.search.submit();
}
function sbmt6()
{
  document.search.action="./patientid.jsp";
  document.search.submit();
}
function sbmt7()
{
  document.search.action="./treatment.jsp";
  document.search.submit();
}
function sbmt8()
{
  document.search.action="./medic.jsp";
  document.search.submit();
}
function validate(name)
{
	if(name=="admin")
	{
		document.getElementById("reports").style.visibility="visible";
		document.getElementById("cp").style.visibility="visible";
		return true;
	}
	else
	{
		document.getElementById("reports").style.visibility="hidden";
		document.getElementById("cp").style.visibility="hidden";

		return false;
	}
}
onunload=function()
{
	var e=document.getElementById("hi");
	if(e.value=="no")
		e.value="yes"
	else
	{
		e.value="no";
		submit();
	}
}
</script>
<link type="text/css" rel="stylesheet" href="./home.css" />
</head>
<%
try
{
	if(((String)session.getAttribute("id"))!=null)
	{
%>
<body onload="validate('<%=(String)session.getAttribute("username")%>');">
<input type="hidden" id="hi" value="no" />
<h1>Sastry Institute of Homeophatic Medical Science & Research Centre</h1>
<marquee style="color:black;font-size:25px;margin-bottom:20px;" loop="true">Welcome to the home page <%=session.getAttribute("username")%></marquee>
<a href="./logout.jsp">Logout</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="./change.jsp" id="cp" style="visibility:hidden">Change password</a>
<img id="img" src="./images/Quick.jpg" height=650 width=500 alt="
Sastry Institute of Homeophatic Medical Science & Research Centre" />
<form name="search" action="" method="post" >
	<h2>Enter details to search</h2>
	FAMILY ID:&nbsp &nbsp<input type="text" name="patient" value="" /> &nbsp &nbsp &nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<input type="button" name="ser" value="search" onclick="sbmt1()" /><br><br> <br><br>
	FIRST NAME:<input type="text" name="first" value="" /><br><br>&nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
	<input type="button" name="ser" value="search" onclick="sbmt2()" />  <br>
	LAST  NAME:<input type="text" name="last" value="" /><br><br><br>
	
</form>
<a href="./new.jsp"><img src="./images/past.gif" /></a>
<div id="reports" style="visibility:hidden">
<p> 
<strong>Reports</strong><br /><br /> 
<table> <tr> <td>
<input type="button" name="d" value="Day-wise reports" onclick="sbmt4()"/> <br><br></td> 
<td><input type="button" name="w" value="Disease-wise report" onclick="sbmt5()"/><br><br></td> </tr>  
<tr> <td><input type="button" name="p" value="Patient-wise report" onclick="sbmt6()" /> <br><br></td> 
<td><input type="button" name="t" value="Treatment-wise report" onclick="sbmt7()"/> <br><br></td> </tr> 
<tr> <td><input type="button" name="q" value="Medicine given or not" onclick="sbmt8()"/> <br><br></td> 
</tr> 
</table> 
</p>
<%
	}
	else
	{
%>
	<h3>Session has expired please login to continue</h3>
	<a href="./login.jsp">login</a>
<%
	}
}
catch(Exception e)
	{
		System.out.println(e.getMessage());
	}

%>
</div>
</body>
</html>

