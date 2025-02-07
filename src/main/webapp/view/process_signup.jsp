<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.math.BigInteger" %>
<%
    // 데이터베이스 연결 정보
    String jdbcURL = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
    String dbUser = "new_user";
    String dbPassword = "password";

    // 폼에서 전송된 데이터 받기
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String country = request.getParameter("country");
    
    // 입력 유효성 검사
    if(username == null || email == null || password == null || country == null || 
       username.trim().isEmpty() || email.trim().isEmpty() || password.trim().isEmpty() || country.trim().isEmpty()) {
        out.println("<script>alert('모든 필드를 입력해주세요.'); window.location='signup.jsp';</script>");
        return;
    }
    
    // 비밀번호 해싱
    MessageDigest md = MessageDigest.getInstance("SHA-256");
    byte[] messageDigest = md.digest(password.getBytes());
    BigInteger no = new BigInteger(1, messageDigest);
    String hashedPassword = no.toString(16);
    while (hashedPassword.length() < 32) {
        hashedPassword = "0" + hashedPassword;
    }
    
    try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
         PreparedStatement pstmt = conn.prepareStatement("INSERT INTO users (username, email, password, country) VALUES (?, ?, ?, ?)")) {
        
        // JDBC 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");
        
        pstmt.setString(1, username);
        pstmt.setString(2, email);
        pstmt.setString(3, hashedPassword);
        pstmt.setString(4, country);
        
        int rowsAffected = pstmt.executeUpdate();
        
        if(rowsAffected > 0) {
            out.println("<script>alert('가입 완료! " + country + "로 떠나볼까요?'); window.location='signup.jsp';</script>");
        } else {
            out.println("<script>alert('가입에 실패했습니다. 다시 시도해주세요.'); window.location='signup.jsp';</script>");
        }
    } catch(SQLException e) {
        out.println("<script>alert('데이터베이스 오류: " + e.getMessage() + "'); window.location='signup.jsp';</script>");
    } catch(Exception e) {
        out.println("<script>alert('오류 발생: " + e.getMessage() + "'); window.location='signup.jsp';</script>");
    }
%>
