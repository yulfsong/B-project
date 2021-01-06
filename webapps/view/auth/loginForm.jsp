<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

${ctxPath = pageContext.request.contextPath; ''}

<!DOCTYPE>
<html>
<head>
	<title>로그인</title>
  	
  	<jsp:include page="/includee/init.jsp"/>
  	
  	<style>
  
    .center-form > div {
    	margin: 10px;
    	color: #777;
    }
    
    .btn-naver {
    	width: 240px;
    	margin-top: 10px;
    	margin-bottom: 10px;
    	background-color: #00BE39;
    	font-weight: bold;
    	color: white;
    }
    
    .btn-naver:hover {
    	color: white;
    	background-color: #00A020;
    }
     
    input {
    	width: 240px;
    	margin-top: 20px;
    	margin-bottom: 20px;
    }
    
    input:hover {
    	border-color: #FF4543;
    }
    
  	</style>
</head>
<body>
	<jsp:include page="/includee/navbar.jsp"/>
	
	<div class="container-fluid" style="background-color: #f7f7f7;">
		<form action="login.do" method="post">
			<div class="form-group-lg center-form" align="center">
				<c:if test="${!empty name}">
					<h4>${name}님 환영합니다!</h4>
				</c:if>
				<a href="#" class="btn btn-naver form-control" role="button">네이버 아이디로 로그인</a>
				<div>또는</div>
				<c:if test="${errors.idOrPwNotMatch }"><div style="color: #FF3533">아이디나 비밀번호가 틀립니다</div></c:if>
				<input type="text" name="id" class="form-control" autofocus="autofocus" placeholder="아이디를 입력해주세요" required="required"/>
				<input type="password" name="password" class="form-control" placeholder="비밀번호를 입력해주세요" required="required"/>
				<input type="submit" class="btn okay form-control"  value="로그인" />
				<br /><br />
				<c:if test="${empty name}">
					<div>아직 계정이 없으신가요? <a href="join.do">회원가입</a></div>
				</c:if>
			</div>	
		</form>
	</div>
	
	<jsp:include page="/includee/footer.jsp"/>
</body>
</html>