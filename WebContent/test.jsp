<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ page language="java"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>

<%
	//載入驅動程式 
	//String driverName = "com.mysql.jdbc.Driver";
	String driverName = "com.mysql.cj.jdbc.Driver";
	//資料庫資訊
	String userName = "wilsonUOB";
	//密碼 
	String userPasswd = "wilson12345";
	//資料庫名 
	String dbName = "cybersoft";
	//表名 
	String tableName = "user";
	//將資料庫資訊字元串連接成為一個完整的url（也可以直接寫成url，分開寫是明瞭可維護性強） 

	//String url = "jdbc:mysql://localhost/" + dbName + "?user=" + userName + "&password=" + userPasswd;
	String url = "jdbc:mysql://localhost/" + dbName + "?useUnicode=true&characterEncoding=Big5&serverTimezone=CTT";

	Class.forName(driverName).newInstance();
	//Connection conn = DriverManager.getConnection(url);
	Connection conn = DriverManager.getConnection(url, userName, userPasswd);

	Statement stmt = conn.createStatement();
	String sql = "SELECT * FROM " + tableName;
	ResultSet rs = stmt.executeQuery(sql);

	out.print("id");
	out.print(" | ");
	out.print("name");
	out.print(" | ");
	out.print("passwd");
	out.print("<br>");

	while (rs.next()) {
		out.print(rs.getString(1) + " ");
		out.print(" | ");
		out.print(rs.getString(2) + " ");
		out.print(" | ");
		out.print(rs.getString(3));
		out.print("<br>");
	}

	out.print("<br>");
	out.print("Ok, Database Query Successd!");
	rs.close();
	stmt.close();
	conn.close();
%>