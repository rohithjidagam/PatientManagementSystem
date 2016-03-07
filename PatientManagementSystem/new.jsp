<%@ page import="java.text.*" %>
<%DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
   String d4=df.format(new java.util.Date());
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>
welcome
</title>

<script type="text/javascript">
function validate(id,val,text)
{
	if(document.getElementById(id).value==val)
	{
		text.style.visibility="visible";
		return true;
	}
	else
	{
		text.style.visibility="hidden";
		return false;
	}
}
</script>
</head>
<body>
<link type="text/css" rel="stylesheet" href=".\new.css" /> 
<h1>Enter the patient details</h1>
<a href="./home.jsp">Click here to go back to main page</a>
<form action="tab1.jsp" method="POST">
<table width=100%>
<tr>
<td><b>Id </td><td><input type="text" name="id" ><br><br></td>
<td><b>First Name</td><td><input type="text" name="f_n" value=""><br><br></td>
<td><b>Last Name</td><td><input type="text" name="l_n" value=""><br><br></td>
</tr>
<tr>
<td><b>Sex</b></td><td><input type="radio" name="s" value="M">Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="s" value="F">Female</td>
<td><b>Age</td><td><input type="number" name="a" ><br><br></td>
<td><b>Marital Status</b></td><td><input type="radio" name="m_s" value="M">Married<input type="radio" name="m_s" value="U">Un-married<br /></td>
</tr>
<tr>
<td><b>Date of Consultation</td><td><input type="Date/Time" name="d_c" value="<%=d4%>" ><br><br></td>
<td><b>Occupation</td><td><input type="memo" name="o" value=""><br><br></td>
<td><b>Address</td><td><input type="text" name="a_d" value=""><br><br></td>
 </tr>
<tr>
<td><b>ProvDiagnosis</td><td><input type="text" name="p_d" value=""><br><br></td>
<td><b>Diagnosis</td><td><input type="text" name="d" value=""><br><br></td>
<td><b>Compliant</td><td><input type="text" name="c" value=""><br><br></td>
</tr>
<tr>
<td><b>History</td><td><input type="text" name="h" value=""><br><br></td>
<td><b>PastHistory</td><td><input type="text" name="p_h" value=""><br><br></td>
<td><b>Family History</td><td><input type="text" name="f_h" value=""><br><br></td>
</tr>
<tr>
<td><b>General Condition</td><td><input type="text" name="g_c" value=""><br><br></td>
<td><b>Vital Data</td><td><input type="text" name="v_d" value=""><br><br></td>
<td><b>Systemic Examination</td><td><input type="text" name="s_e" value=""><br><br></td>
</tr>
<tr>
<td><b>Investigations</td><td><input type="text" name="i" value=""><br><br></td>
<td><b>Treatment</td><td><input type="text" name="t" value=""><br><br></td>
<td><b>Symptoms:</td><td><input type="text" name="symptoms" value="" /><br /><br /></td>
</tr>
<tr>
<td><b>Present complaint:</td><td><input type="text" name="complaint" value="" /><br /><br /></td>
<td><b>Time factor of aggrevation:</td><td><input type="text" name="time" value="" /><br /><br /></td>
<td><b>Climatic aggrevation:</td><td><input type="text" name="climate" value="" /><br /><br /></td>
</tr>
<tr>
<td><b>Emmilaration by</b></td><td><input type="radio" name="emmileration" value="hotpacks" />hot packs&nbsp;&nbsp;<input type="radio" name="emmileration" value="coldpacks" />cold packs</td>
<td><b>Exercise:</b></td><td><input type="radio" name="exercise" value="emmileration" />emmileration<input type="radio" name="exercise" value="aggrevation" />aggrevation<br /></td>
<td><b>Rest:</b><table><tr><td><input type="radio" name="rest" value="emmileration" />emmileration<br></td></tr><tr><td><input type="radio" name="rest" value="aggrevation" />aggrevation<br /><br /></td></tr></table></td>
<td><b>Others:<br><textarea name="others" rows="5" cols="30"></textarea><br /><br /></td>
</tr>
</table>


<div class="all_content">
	<div class="header">
	<h1>Generalities and Constitutional symptoms</h1>
	</div>
	<div class="food_desires">
	<b>Appatite:<input type="text" name="appatite" value="" /><br /><br />
	
	<b>Food desires:<br />
	<table> 
	<tr>
	<th>List-1</th>
	<th>List-2</th>
	</tr>
	<tr>
	<td><input type="checkbox" name="food[]" value="pickles">Pickles</td>
	<td><input type="checkbox" name="food[]" value="sour">Sour</td>
	</tr>
	<tr>
	<td><input type="checkbox" name="food[]" value="salty">Salty</td>
	<td><input type="checkbox" name="food[]" value="milk products">Milk products</td>
	</tr>
	<tr>
	<td><input type="checkbox" name="food[]" value="pungent">pungent</td>
	<td><input type="checkbox" name="food[]" value="sweets">sweets</td>
	</tr>
	<tr>
	<td><input type="checkbox" name="food[]" value="fatty">Fatty</td>
	<td><input type="checkbox" name="food[]" value="spicy">Spicy</td>
	</tr>
	<tr>
	<td><input type="checkbox" name="food[]" value="oily">Oily/Fried</td>
	<td><input type="checkbox" name="food[]" value="bakery Items">Bakery items</td>
	</tr>
	</table>
	<br />
	<b>Bowel movement:
	<input id="wp" type="radio" name="bowel" value="withpain" onclick="validate(this.id,this.value,document.getElementById('bowel'));"/>With Pain
      <input id="wip" type="radio" name="bowel" value="withoutpain" onclick="validate(this.id,this.value,document.getElementById('bowel'));"/>Without Pain<br /><br />
	<select id="bowel" name="bowel1" style="visibility:hidden" onchange="validate(this.id,'hard',document.getElementById('insert1'));" >
	<option value="loose">Loose</option>
	<option value="watery">Watery</option>
	<option value="semi">Semi-solid</option>
	<option value="hard" >Hard</option>
	<option value="offensive">Offensive</option>
	<option value="constipation">Constipation</option>
	<option value="spoil">Spoiling Clothes</option>
	<option value="pain in abdomen">With pain in abdomen</option>
	<option value="without pain in abdomen">Without pain in abdomen</option>
	</select><br /><br />
	<p id="insert1" style="visibility:hidden">
	<input type="radio" name="hard2" value="with bleeding" />With Bleeding
	<input type="radio" name="hard2" value="without bleeding" />Without Bleeding<br /><br />
	</p>
	<p>
	<b>Thirst:
	<table>
	<tr>
	<td>
	<input type="radio" name="thirst" value="large quantities" />Large Quantities</td>
	<td><input type="radio" name="thirst" value="small quantities" />Small Quantities</td></tr>
	<tr><td><input type="radio" name="thirst" value="thirstless" />Thirst Less</td>
	<td><input type="radio" name="thirst" value="cold water" />Cold Water</td></tr>
	<tr><td><input type="radio" name="thirst" value="warm water" />Normal Water/Warm Water<br /><br /></td></tr>
	</table>
	</p>
	<b>Sleep:
	<input type="text" name="sleep" value="" /><br /><br />
	</div>
	<div class="secondary">
	<p>
	<b>Thermal Desire:
	<input type="radio" name="thermal" value="winter" />Winter
	<input type="radio" name="thermal" value="summer" />Summer
	<input type="radio" name="thermal" value="rainy" />Rainy<br /><br />
	</p>
	<p>
	<b>Gender:
	<input id="gm" type="radio" name="gender" value="male" onclick="validate(this.id,document.getElementById('gf').value,document.getElementById('menses'));" />Male
	<input id="gf"type="radio" name="gender" value="female" onclick="validate(this.id,document.getElementById('gf').value,document.getElementById('menses'));" />Female<br /><br />
	</p>
	<p id="menses" style="visibility:hidden">
		<b>Menses:
		<input id="mp" type="radio" name="menses" value="with pain" onclick="validate(this.id,this.value,document.getElementById('menses1'));"/>With Pain
		<input id="nwp" type="radio" name="menses" value="without pain" onclick="validate(this.id,this.value,document.getElementById('menses1'));" />Without Pain<br /><br />
		<select id="menses1" name="menses1" style="visibility:hidden">
		<option value="28daycycle" >28 Days Cycle</option>
		<option value="late" >Late</option>
		<option value="early" >Early</option>
		</select><br /><br />
		<b>Menses Discharge:
		<input id="re" type="radio" name="discharge" value="red" onclick="validate(this.id,document.getElementById('clots').value,document.getElementById('clots1'));"/>Red
		<input id="blk" type="radio" name="discharge" value="black" onclick="validate(this.id,document.getElementById('clots').value,document.getElementById('clots1'));"/>Black<br />
		<input id="clots" type="radio" name="discharge" value="clots" onclick="validate(this.id,document.getElementById('clots').value,document.getElementById('clots1'));"/>clots
		<input id="wclo" type="radio" name="discharge" value="wclots" onclick="validate(this.id,document.getElementById('clots').value,document.getElementById('clots1'));"/>Without Clots<br /><br />
		<span id="clots1" style="visibility:hidden">
		<b>Color of clots:
		<input type="text" name="cofclots" value="" /><br /><br />
		</span>
		<b>Any diseases during menses:
		<input id="diar" type="radio" name="diseases" value="diahhroea" onclick="validate(this.id,document.getElementById('diseases2').value,document.getElementById('diseases1'));" />Diahhroea
		<input id="vomit" type="radio" name="diseases" value="vomiting" onclick="validate(this.id,document.getElementById('diseases2').value,document.getElementById('diseases1'));"/>Vomiting during menses
		<input id="diseases2" type="radio" name="diseases" value="other" onclick="validate(this.id,document.getElementById('diseases2').value,document.getElementById('diseases1'));"/>Other symptoms during menses<br /><br /><br />
		<span id="diseases1" style="visibility:hidden">
		<b>Other:
		<input type="text" name="diseases3" value="" /><br />
		</span>
	</p>
	<p>
	<b>Perspiration:
	<input type="radio" name="perspiration" value="offensive" />Offensive
	<input type="radio" name="perspiration" value="noffensive" />Non Offensive<br /><br />
	<b>Which part of the body:<input type="text" name="pepspiration" value="" /></br /><br />
	</p>
	</div>
</div>
<p style="text-align:center;">
<input type="submit" style="font-size:25px;"value="Submit" />
</p>
</form>
</body>
</html>	
	
