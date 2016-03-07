<html>
<script type="text/javascript">
function sbmt()
{
  document.f1.action="./details.jsp";
  document.f1.submit();
}
</script>
<body bgcolor="#FF6347"/><center><h1><p style="background-color:#63b8ff "> EDIT SUCCESSFULL</p></h1></center>
<br><br><br><br><br><center>
<form name="f1" method="post" action="">
<input type="hidden" name="new" value="<%=request.getParameter("new")%>" />
<input type="button" Value="Menu" style="font-size:23px;" onclick="window.location='./home.jsp'";>
<input type="button" Value="Continue" style="font-size:23px;" onclick="sbmt()";>
</center>
