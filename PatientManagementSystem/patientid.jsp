<html>
<head>
<title>
Patient details
</title>
<script type="text/javascript">
function validate(form)
{
	var text=document.getElementById("pat_help");
	var input=document.getElementById("pat1");
	var regEx=/^\d{4,6}-\d{2}$/
	if(input.value.length==0)
	{
		while(text.firstChild)
			text.removeChild(text.firstChild);
		text.appendChild(document.createTextNode("Please Enter a value"));
		return false;
	}
	else
	{
		if(regEx.test(input.value)==false)
		{
			while(text.firstChild)
				text.removeChild(text.firstChild);
			text.appendChild(document.createTextNode("please enter id of the form Ex:0009-02"));
			return false;
		}
		else
		{
			while(text.firstChild)
				text.removeChild(text.firstChild);
			form.submit();
		}
	}		
}
</script>
</head>
<center>
<body bgcolor=#F0F8FF>
<h1>Enter the details:</h1><br>
<form name="pat" method="post" action="report_p.jsp">
<h3>Enter patient id:<input type="text" id="pat1" name="patient" value="" /><br /><br /></h3>
<span id="pat_help"></span><br /><br />
<input type="button" value="search" style="font-size:19px;" onclick="validate(this.form);" />
</form>
<a href="./home.jsp" style="font-size:20px;">Click here to go to the main page</a>
</center>
</body>
</html>