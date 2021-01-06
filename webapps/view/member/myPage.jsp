<%@page import="com.b_project.model.member.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

${ctxPath = pageContext.request.contextPath; ''}

<%
	Member user = (Member)request.getSession(false).getAttribute("authUser");
%>
<!DOCTYPE>
<html>
<head>
	<title>마이 페이지</title>
	
	<jsp:include page="/includee/init.jsp"/>
</head>
<body>
	<jsp:include page="/includee/navbar.jsp"/>
	
	<div class="container">
		<table>
			<tr>
				<td>아이디</td>
				<td><%=user.getId() %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=user.getName() %></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=user.getTel() %></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><%=user.geteMail() %></td>
			</tr>
			<tr>
				<td>가입한 날짜</td>
				<td><%=user.getRegDate() %></td>
			</tr>
			<tr>
				<td>등급</td>
				<td><%=user.getLevel() %></td>
			</tr>
		</table>
		
	</div>
	
	<jsp:include page="/includee/footer.jsp"/>
</body>
</html>