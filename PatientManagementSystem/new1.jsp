<%@ page import="java.sql.*" %>
<%!
   Connection con;
   PreparedStatement ps;
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
 
 %>
 <%
  try
  {
 
 
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
   
   
   }
   catch(Exception e)
   {
     System.out.println(e.getMessage());
   }
   
 
 %>
 