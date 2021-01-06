<%@page import="com.b_project.util.JDBCUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head><title></title></head>
<body>
	<%
		try(Connection conn = JDBCUtil.getConnection()) {
			out.println("DB커넥션 연결 성공...");
		} catch(SQLException e) {
			out.println("DB커넥션 연결 실패 : " + e.getMessage());
			application.log("DB커넥션 연결 실패", e);
		}
	%>
	<br />
	<%=request.getRealPath("/")%>
	<br />
	<%=request.getContextPath()%>
</body>
</html>