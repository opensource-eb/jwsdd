<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
		response.sendRedirect("login.jsp");
	}
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Deal Information</title>
    </head>
    <body>
        <form method="post" action="add_deal.jsp">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Deal Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Startup Name</td>
                        <td><input type="text" name="startup_name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Start Sector</td>
                        <td><input type="text" name="startup_sector" value="" /></td>
                    </tr>
                    <tr>
                        <td>Location</td>
                        <td><input type="text" name="location" value="" /></td>
                    </tr>
                    <tr>
                        <td>Valution last</td>
                        <td><input type="text" name="valuation_last" value="" /></td>
                    </tr>
                    <tr>
                        <td>Valution Benchmark</td>
                        <td><input type="text" name="location" value="" /></td>
                    </tr>					
                    <tr>
                        <td>Funding Stage</td>
                        <td><input type="text" name="funding_stage" value="" /></td>
                    </tr>
                    <tr>
                        <td>Funding Amount</td>
                        <td><input type="text" name="funding_amount" value="" /></td>
                    </tr>					
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>                    
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>