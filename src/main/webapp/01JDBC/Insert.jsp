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
    <h2>회원 추가 테스트(executeUpdate() 사용)</h2>
    <%
    // DB에 연결
    JDBConnect jdbc = new JDBConnect();
    
    // 테스트용 입력값 준비 
    String id = "kosta3";
    String pass = "pass123#";
    String name = "코스타3";

    // 쿼리문 생성
    String sql = "INSERT INTO member (id, pass, name, regidate) VALUES (?, ?, ?, NOW())"; 
    //PreparedStatement psmt = jdbc.con.prepareStatement(sql);  
    jdbc.psmt = jdbc.con.prepareStatement(sql);
    jdbc.psmt.setString(1, id);
    jdbc.psmt.setString(2, pass);
    jdbc.psmt.setString(3, name);

    // 쿼리 수행
    int inResult = jdbc.psmt.executeUpdate(); 
    out.println(inResult + "행이 입력되었습니다.");

    // 연결 닫기
    jdbc.close(); 
    %>
</body>
</html>