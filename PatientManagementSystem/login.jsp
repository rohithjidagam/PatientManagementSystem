<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>login</title>
<link type="text/css" rel="stylesheet" href="login.css" />
<script type="text/javascript">
function validate(form,help,help1)
{
	var username=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	if((username.length==0&&password.length==0))
	{
		help.innerHTML="Please enter the username";
		help1.innerHTML="Please enter the password";
		return false;
	}
	if(username.length==0&&password.length!=0)
	{
		help.innerHTML="Please enter the username";
		help1.innerHTML="";
		return false;
	}
	if(username.length!=0&&password.length==0)
	{
		help1.innerHTML="Please enter the password";
		help.innerHTML="";
		return false;
	}
	if(username.length!=0&&password.length!=0) 
	{
		help.innerHTML="";
		help1.innerHTML="";
		document.login.submit();
		return true;
	}
}	
</script>
<body>
<p><img src="./images/clinic.gif" alt="Dr sastry's clinic" /></p>
<div class="main">
<div>
<form name="login" action="j.jsp" method="post">
	<em class="heading">Enter your details to login</em><br /><br />	
	<p class="logmodule">
	Username:<input type="text" name="username" id="username" value="" /><br /><br />
	<span id="username_help"></span><br />
	Password:<input type="password" name="password" id="password" value=""  /><br /><br />
	<span id="password_help"></span><br />
	<input type="button" id="flag" value="send" onclick="validate(this.form,document.getElementById('username_help'),document.getElementById('password_help'));"  /><br /><br />
	</p>
</div>
	<div class="footer">
      <img src="./images/project2.gif" alt="our logo" />copyrights @Snist-computer science
      <br />
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
	</div>
</div>
</form>
</body>
</html>