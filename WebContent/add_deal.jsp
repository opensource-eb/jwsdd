<%@ page import ="java.sql.*" %>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
		response.sendRedirect("login.jsp");
	}
%>
<%
    String startup_name = request.getParameter("startup_name");    
    String startup_sector =  request.getParameter("startup_sector");
    String location = request.getParameter("location");
    String valuation_last = request.getParameter("valuation_last");
    String valuation_benchmark = request.getParameter("valuation_benchmark");
    String funding_stage = request.getParameter("funding_stage");
    String funding_amount = request.getParameter("funding_amount");
		
	
	/*
	
	dealinfo

startup_name
startup_sector
location
valuation_last 
valuation_benchmark
funding_stage
funding_amount

*/


	
	
    Class.forName("com.mysql.jdbc.Driver");
	
	
    Connection conn = DriverManager.getConnection("jdbc:mysql://jws-app-mysql:3306/sampledb",
            "ronald", "60503176");
			
			
    
	String query = "insert into dealinfo(startup_name, startup_sector, location, valuation_last, valuation_benchmark,funding_stage ,funding_amount, regdate) values (?, ?, ?, ?, ?,?,? CURDATE())";
	
	
	PreparedStatement preparedStmt = conn.prepareStatement(query);
      preparedStmt.setString(1, startup_name);
      preparedStmt.setString(2, startup_sector);
      preparedStmt.setString(3, location);
      preparedStmt.setString(4, valuation_last);
      preparedStmt.setString(5, valuation_benchmark);
	  preparedStmt.setString(6, funding_stage);
      preparedStmt.setString(7, funding_amount);
	  
	  
	  
     int i =  preparedStmt.executeUpdate();
		
		
	
	//int i = st.executeUpdate("insert into members(first_name, last_name, email, uname, pass, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "', CURDATE())");
	
	
	
	
	con.close();
	
	
	
	
    if (i > 0) {       
        
       out.print("Add Deal Successfull!"+"<a href='success.jsp'>Go back to main page</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
%>