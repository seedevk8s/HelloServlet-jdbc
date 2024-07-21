<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.kosta.common.JDBConnect"%> 	
<%@ page import="kr.co.kosta.common.DBConnPool"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2>JDBC 테스트 1</h2>
    <%
    JDBConnect jdbc1 = new JDBConnect(); 
    jdbc1.close(); 
    %>
    
    <h2>JDBC 테스트 2</h2>
    <%
    String driver = application.getInitParameter("MySQLDriver"); 
    String url = application.getInitParameter("MySQLURL");
    String id = application.getInitParameter("MySQLId");
    String pwd = application.getInitParameter("MySQLPwd");

    JDBConnect jdbc2 = new JDBConnect(driver, url, id, pwd); 
    jdbc2.close();
    %>    
    
    <h2>JDBC 테스트 3</h2>
    <%
    JDBConnect jdbc3 = new JDBConnect(application); 
    jdbc3.close();
    %>    
    
        <h2>커넥션 풀 테스트</h2>
    <%
    DBConnPool pool = new DBConnPool();
    pool.close();
    %>
    
</body>
</html>