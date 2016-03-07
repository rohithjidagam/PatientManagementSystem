<%@ page import="java.sql.*" %>
<%!
   Connection con;
   PreparedStatement ps;
	Statement ps1;
 public void jspInit()
 {
   try
   {
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    System.out.println("Driver Loaded");
   con=DriverManager.getConnection("jdbc:odbc:king");
   ps=con.prepareStatement("INSERT INTO PatientsTab values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
   }
   catch(Exception e)
   {
   }
 }
 public void jspDestroy()
 {
   try
   {
    if(ps!=null) ps.close();
     if(con!=null) con.close();
    }
    catch(Exception e)
     {
     }
  }
 %>
<html>
<head>
<link type="text/css" rel="stylesheet" href="./tab1.css" />
<script type="text/javascript">
function f1()
{
	window.location="./new.jsp";
}
function f2()
{
	window.location="./home.jsp";
}
</script>
</head>
<body>
 <%
try
{
	int flag=1;
  String s11="Select max(ID) from PatientsTab";
  ps1=con.createStatement();
  ResultSet rs1=ps1.executeQuery(s11);
  rs1.next();
  int k=rs1.getInt(1);
   String msg="",s1[],s2;
	 s1=new String[24];
   s1[0]=request.getParameter("symptoms"); if(s1[0].length()!=0) msg=msg+"Symptoms-"+s1[0]+";";
   s1[1]=request.getParameter("complaint"); if(s1[1].length()!=0) msg=msg+"Complaint-"+s1[1]+";";
   s1[2]=request.getParameter("time"); if(s1[2].length()!=0) msg=msg+"Time factor of aggrevation-"+s1[2]+";";
   s1[3]=request.getParameter("climate"); if(s1[3].length()!=0) msg=msg+"Climatic aggrevation-"+s1[3]+";";
   s1[4]=request.getParameter("emmileration"); if(s1[4].length()!=0) msg=msg+"Emmileration by-"+s1[4]+";";
   s1[5]=request.getParameter("exercise");  if(s1[5].length()!=0) msg=msg+"Exercise-"+s1[5]+";";
   s1[6]=request.getParameter("rest"); if(s1[6].length()!=0) msg=msg+"Rest-"+s1[6]+";";
   s1[7]=request.getParameter("others"); if(s1[7].length()!=0) msg=msg+s1[7]+";";
   s1[8]=request.getParameter("appatite"); if(s1[8].length()!=0) msg=msg+"Appatite-"+s1[8]+";";
   String s[]=request.getParameterValues("food[]");
   System.out.println("food desires are");
   if(s.length!=0) msg=msg+"Food Desires-";
   for(int i=0;i<s.length;i++)
   { 
     if(s[i].length()!=0)
    {
     if(i==(s.length-1)) msg=msg+s[i]+";";
	 else msg=msg+s[i]+",";
	}
   }
   s1[9]=request.getParameter("bowel");  if(s1[9].length()!=0) msg=msg+"Bowl movement-"+s1[9];
   s1[10]=request.getParameter("bowel1"); if(s1[10].length()!=0) msg=msg+s1[10];
   s1[11]=request.getParameter("hard2");  if(s1[11].length()!=0) msg=msg+s1[11]+";";  
   s1[12]=request.getParameter("thirst"); if(s1[12].length()!=0) msg=msg+"Thirst-"+s1[12]+";";
   s1[13]=request.getParameter("thermal"); if(s1[13].length()!=0) msg=msg+"Thermal Desire-"+s1[13]+";";
   s1[14]=request.getParameter("gender"); 
   s1[15]=request.getParameter("menses"); 
   s1[16]=request.getParameter("menses1");
   s1[17]=request.getParameter("discharge");
   s1[18]=request.getParameter("cofclots");
   s1[19]=request.getParameter("diseases");
   s1[20]=request.getParameter("diseases3");
   if(s1[14].equals("female"))
   {
     if(s1[15].length()!=0) msg=msg+"Menses-"+s1[15]+",";
	 if(s1[16].length()!=0) msg=msg+s1[16]+";";
	 if(s1[17].length()!=0) msg=msg+"Menses Discharge-"+s1[17]+";";
	 if(s1[17].equals("clots")) msg=msg+"Clots colour-"+s1[18]+";";
	 if(s1[19].length()!=0) msg=msg+"Diseases during menses-"+s1[19]+";";
	 if(s1[19].equals("other")) msg=msg+s1[20]+";";
   }
   s1[21]=request.getParameter("sleep"); if(s1[21].length()!=0) msg=msg+"Sleep-"+s1[21]+";";
   s1[22]=request.getParameter("perspiration"); if(s1[22].length()!=0) msg=msg+"Perspiration "+s1[22];
   s1[23]=request.getParameter("pepspiration"); if(s1[23].length()!=0) msg=msg+"in "+s1[23]+";";
   
   
   System.out.println("The details are \n");
   System.out.println(msg);

   ps.setInt(1,k+1);
   ps.setString(2,request.getParameter("id"));
   ps.setString(3,request.getParameter("f_n"));
  ps.setString(4,request.getParameter("l_n"));
  ps.setString(5,request.getParameter("s"));
  ps.setInt(6,Integer.parseInt(request.getParameter("a")));
  ps.setString(7,request.getParameter("m_s"));
  ps.setString(8,request.getParameter("d_c"));
  ps.setString(9,request.getParameter("o"));
  ps.setString(10,request.getParameter("a_d"));
  ps.setString(11,request.getParameter("p_d"));
  ps.setString(12,request.getParameter("d"));
  ps.setString(13,request.getParameter("c"));
  ps.setString(14,request.getParameter("h"));
  ps.setString(15,request.getParameter("p_h"));
  ps.setString(16,msg);
  ps.setString(17,request.getParameter("f_h"));
  ps.setString(18,request.getParameter("g_c"));
  ps.setString(19,request.getParameter("v_d"));
  ps.setString(20,request.getParameter("s_e"));
  ps.setString(21,request.getParameter("i"));
  ps.setString(22,request.getParameter("t"));
  ps.executeUpdate();
  flag=2;
  System.out.println("xjkfdgjh");
  if(flag==2)
  {
%>
<h3>Records have been successfully inserted into the table</h3>
<p style="text-align:center;">
  <input type="button" value="Menu" style="font-size:20px;" onclick="f2();" />
</p>

<%
 }
}
 catch(Exception j)
{
%>
  <h3>You have not enterred the details completely.Please fill all the details.Do not leave anything empty.</h3><br />
   ERROR DETAILS ARE NOT STORED<br /><br />
<p style="text-align:center;">
  <input type="button" value="Click here to re-enter the details" style="font-size:20px;" onclick="f1();" />
</p>
<%
  System.out.print(j.getMessage());
}
 %>
 