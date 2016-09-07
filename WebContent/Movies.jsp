<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.movies.DBsettings" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Movies</h1>
<%
Connection con = null;
Statement st = null;
ResultSet rs = null;
String n;
out.println("Welcome to the Movie List Application!");
try {
	Class.forName("com.mysql.jdbc.Driver");
	//open the connection
	con = DriverManager.getConnection(DBsettings.url, 
			DBsettings.user, DBsettings.pass);
	//get a statement object from the connection
	st = con.createStatement();
		//execute an SQL query with the statement object
		//and store the results in ResultSet rs
		rs = st.executeQuery("SELECT DISTINCT MovieGenre FROM Movies");
		
		//display categories from result set
		while (rs.next()) {

			out.println(rs.getString("MovieGenre"));

		}
		//get user input
		//display movies based on input
		rs = st.executeQuery("SELECT MovieName FROM Movies");
		while (rs.next()) {

			out.println(rs.getString("MovieName"));

		}
		
} catch (Exception e) {
	out.println("DB Exception: " + e);
} finally {
	//this is where I do my cleanup
	try {
		if (rs != null)
			rs.close();
		if (st != null)
			st.close();
		if (con != null)
			con.close();
	} catch (Exception e) {
		out.println("Exception in finally: " + e);
	}
}
%>
</body>
</html>