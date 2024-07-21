<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.kosta.common.JDBConnect"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
    <%
    // DB에 연결
    JDBConnect jdbc = new JDBConnect();

    // 쿼리문 생성   
    String sql = "SELECT id, pass, name, regidate FROM member";  
    //Statement stmt = jdbc.con.createStatement();  
    jdbc.stmt = jdbc.con.createStatement();
    
    // 쿼리 수행
    //ResultSet rs = jdbc.stmt.executeQuery(sql);  
    jdbc.rs = jdbc.stmt.executeQuery(sql);

    // 결과 확인(웹 페이지에 출력)
    while (jdbc.rs.next()) { 
        String id = jdbc.rs.getString(1);
        String pw = jdbc.rs.getString(2);
        String name = jdbc.rs.getString("name");
        java.sql.Date regidate = jdbc.rs.getDate("regidate");
        
        out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br/>"); 
    }

    // 연결 닫기
    jdbc.close();
    %>
</body>
</html>