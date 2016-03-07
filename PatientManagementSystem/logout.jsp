<html>
<head>
</head>
<body>
<h3>The user has been successfully logged out</h3>
<%	
	session.removeAttribute("id");
	session.invalidate();
%>
<a href="./login.jsp">Login</a>
</body>
</html>