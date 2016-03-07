<html>
<head>
<style>
body
{
	background-color:#87cefa;
	
}
</style>
</head>
<body bgcolor=#F0F8FF>
 <center> <h1>Present Treatment</h1></center>
<form name="pt" method="post" action="store.jsp">
<input type="hidden" name="new" value="<%=request.getParameter("new")%>" />
<center><table>
<tr>
<td>Progress</td><td><textarea name="pr" rows="5" cols="50"></textarea> </td>
<td>Complaints Releived</td><td><textarea name="cr" rows="5" cols="50"></textarea></td><br><br>
</tr>
<tr>
<td>Complaints Appeared</td><td><textarea name="ca" rows="5" cols="50"></textarea></td>
<td>Treatment Given</td><td><textarea name="tg" rows="5" cols="50"></textarea></td><br><br>
</tr>
<tr>
<td></td><td><br><br>
FEES <input type="radio" value="paid" name="fee" >PAID  <input type="radio" value="free" name="fee" >FREE
</td>
</tr> </table></center><br> <br>
<center><input type="submit"  value="send" style="font-size:19px;"/></center>
</body>
</html>



