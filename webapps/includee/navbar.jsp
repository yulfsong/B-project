<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

${ctxPath = pageContext.request.contextPath; ''}

<!-- navigation bar -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
     	<div class="navbar-header">
        	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>                        
       	 	</button>
        	<a class="navbar-brand" href="${ctxPath}/index.jsp">B-Project</a>
      	</div>
      	<div class="collapse navbar-collapse" id="myNavbar">
	        <ul class="nav navbar-nav">
	          	<li><a href="${ctxPath}/intro.jsp">B-Project?</a></li>       
	          	<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						프로젝트 참여
						<ul class="dropdown-menu">
							<li><a href="${ctxPath}/projectDisplay.do">모든 프로젝트</a></li>
							<li class="divider"></li> 
							<li><a href="#">분야별 인기 프로젝트</a></li>
							<li class="divider"></li> 
							<li><a href="#">마감 앞둔 프로젝트</a></li>
							<li class="divider"></li> 
							<li><a href="#">새로운 프로젝트</a></li>
						</ul>
					</a>
				</li>
	          	<li><a href="#">프로젝트 리뷰</a></li>
	        </ul>
        	<ul class="nav navbar-nav navbar-right">
		        <li><a href="${ctxPath}/fundingReq.do">펀딩 오픈 신청</a></li>
		        <li><a href="${ctxPath}/questionList.do">Q & A</a></li>
		          	
		        <c:if test="${empty authUser}">
		          	<li><a href="${ctxPath}/login.do">로그인 / 회원가입</a></li>
		        </c:if>
		          	
		        <c:if test="${!empty authUser}">
					<li><a href="${ctxPath}/logout.do">로그아웃</a></li>
					<c:if test="${authUser.id !='admin'}">
						<li><a href="#">마이페이지</a></li> <!-- 마이페이지는 다른 거 다 구현해야 구현할 수 있구만ㅠㅠ -->
					</c:if>
					<c:if test="${authUser.id=='admin'}">
						<li><a href="${ctxPath}/projectList.do">관리자 모드</a></li>
					</c:if>
				</c:if>
        	</ul>
      	</div>
    </div>
</nav>