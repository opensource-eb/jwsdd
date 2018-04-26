<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>JDBC Connection example</title>
</head>
<body>
<h1>JDBC Connection example</h1>

<%
  String db = request.getParameter("db");
  String username = request.getParameter("user");
  String password = request.getParameter("pass");
  String host = request.getParameter("host");
  
  
  try {  
  
  
	
	
	String url =  "jdbc:mysql://"+host+":3306/"+db+"?" +"user="+username+"&password="+password;    
    con = DriverManager.getConnection(url); 	
    
    out.println (db+ "  database successfully opened.");
	PreparedStatement stmt = null;
	ResultSet rset = null;		
	String query = "SELECT username,pass, logontime FROM `userdb`";
	
    stmt = con.prepareStatement(query);              
    rset = stmt.executeQuery();
	
    while (rset.next())  {     
    	
    //echo "appkey: " . $row["appkey"]. " - appsecret: " . $row["appsecret"]. " " . $row["appusage"]. " ". $row["email"]."  ".$row["dmt"]. "<br>";

       out.println ("username:"+rset.getString(1)+" "); 
//       out.println ("pass:"+rset.getString(2)+" ");
       
         
      
     } 
	con.close();
  }
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>




