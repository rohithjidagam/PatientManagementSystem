<html>
<head>
<title>
Welcome to the home page
</title>
<script type="text/javascript">
function validate(regEx,form,input,helpText)
{
	if(input.value.length==0)
	{
		helpText.innerjsp="Please enter a value";
		return false;
	}
	if(input.value.length>0)
	{
		if (regEx.test(input.value)==false) 
		{
            	helpText.innerjsp="Please enter Id of the form xxxx or xxxxx or xxxxxx";
          		return false;
      	}
      	if(regEx.test(input.value)==true)
		{
            	helpText.innerjsp= "";
			form.submit();
          		return true;
		}
	}
} 
</script>
<link type="text/css" rel="stylesheet" href="./home.css" />
</head>
<body>
<h1>Welcome to the home page</h1>
<img id="img" src="./images/doctors.jpg" height=550 wodth=400 alt="Dr.sastry's clinic" />
<div id="form">
<form name="search" action="patient.jsp" method="post" >
	<p id="ser"><em>Enter details to search</em><br /><br /><br />
	Family ID:<input type="text" id="patient" name="patient" value="" /><input type="text" id="dummy" value="" style="visibility:hidden" /><br /><br />
	<span id="patient_help"></span><br />
<input type="button" name="ser" value="search" onclick="validate(/^\d{4,6}$/,this.form,document.getElementById('patient'),document.getElementById('patient_help'));" /><br />
	</p>
</form>

<p id="new">
<strong>Click here to enter details of new patient</strong><br /><br />
<a href="./new.jsp" >New Id</a>
</p>
</div>
<p id="report">
<strong>Reports</strong><br /><br />
<a href="./day.jsp">Day-wise reports</a><br /><br />
<a href="./disease.jsp">Disease-wise report</a><br /><br />
<a href="./patient.jsp">Patient-wise report</a><br /><br />
<a href="./treatment.jsp">Treatment-wise report</a><br /><br />
</p>
</body>
<html>