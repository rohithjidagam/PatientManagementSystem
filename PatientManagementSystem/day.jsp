<html>
<head>
<title>Day-wise report</title>
<script type="text/javascript">
function validate(form)
{
	var regEx=/\d{4}/
	var input=document.getElementById("year");
	var text=document.getElementById("year_help");
	if(input.value.length==0)
		text.innerHTML="Please enter a year";
	else
	{
		if(regEx.test(input.value)==false)
		{
			text.innerHTML="Please enter date of the form Ex:1996";
			return false;
		}
		else
		{
			text.innerHTML="";
			form.submit();
		}		
	}
}
</script>
</head>
<center>
<body bgcolor=#F0F8FF>
<h1>Enter details</h1>
<form name="home" method="get" action="report_h.jsp">
Select day:
<select name="day">
<%
for(int i=1;i<=31;i++)
{
%>
<option value="<%=i%>"><%=i%></option>
<%
}
%>
</select>&nbsp
Select month:
<select name="month">
<%
int i=1;
%>
<option value="<%=i++%>">Jan</option>
<option value="<%=i++%>">Feb</option>
<option value="<%=i++%>">Mar</option>
<option value="<%=i++%>">Apr</option>
<option value="<%=i++%>">May</option>
<option value="<%=i++%>">Jun</option>
<option value="<%=i++%>">Jly</option>
<option value="<%=i++%>">Aug</option>
<option value="<%=i++%>">Sep</option>
<option value="<%=i++%>">Oct</option>
<option value="<%=i++%>">Nov</option>
<option value="<%=i++%>">Dec</option>
</select>&nbsp
Enter year:
<input type="text" name="year1" id="year"/><br /><br />
<span id="year_help"></span><br /><br />
<input type="button" name="but" id="new1" value="submit" style="font-size:19px;" onclick="validate(this.form);" />
</form>
<a href="./home.jsp" style="font-size:20px;">Click here to go to the main page</a>
</body>
</html>