<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
<%
   // Returns all employees (active and terminated) as json.
   response.setContentType("application/json");
   response.setHeader("Content-Disposition", "inline");
   
   
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://jws-app-mysql:3306/sampledb",
            "ronald", "60503176");
   String sql = "select * from dealinfo"; 
   PreparedStatement preparedStatement = conn.prepareStatement(sql);
   ResultSet rs = preparedStatement.executeQuery(sql );
   
   
   //ResultSet rs = stmt.executeQuery(sql); 
   //JSONObject obj = new JSONObject();
   
   
   
   /*
   
   startup_name
startup_sector
location
valuation_last 
valuation_benchmark
funding_stage
funding_amount
   
   */
    JSONArray arrayObj = new JSONArray();
   
   int i =0;
   while(rs.next())
   { 
     
       JSONObject obj = new JSONObject();
       String startup_name = rs.getString("startup_name");
	   String startup_sector = rs.getString("startup_sector");
	   String location = rs.getString("location");
	   String valuation_last = rs.getString("valuation_last");
	   String valuation_benchmark = rs.getString("valuation_benchmark");
	   String funding_stage = rs.getString("funding_stage");
	   String funding_amount = rs.getString("funding_amount");
	   obj.put( "startup_name", startup_name );
	   obj.put( "startup_sector", startup_sector );
	   obj.put( "location", location );
	   obj.put( "valuation_last", valuation_last );
	   obj.put( "valuation_benchmark", valuation_benchmark );
	   obj.put( "funding_stage", funding_stage );
	   obj.put( "funding_amount", funding_amount );
       arrayObj.add(0,obj);	   
	   i=i+1;
   } 
   
   rs.close(); 
   out.println(arrayObj);
%>
<%}%>
