<%@page import="com.b_project.model.project.model.ProjectBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

${ctxPath = pageContext.request.contextPath; ''}
<%
	ProjectBoardBean article = (ProjectBoardBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
%>
<c:set var="category" 
	   value='<%= new String[]{"게임","공연","디자인","만화","미술","사진",
							   "영화/비디오","요리","음악","출판","테크놀로지","패션"} %>'/>
<!DOCTYPE>
<html>
<head>
	<title>프로젝트 쓰기</title>
  	
  	<jsp:include page="/includee/init.jsp"/>
  	
  	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	
  	<style>
  	input:hover, textarea:hover, select:hover {
    	border-color: #FF3533;
    }
	</style>
</head>

<body>
	<jsp:include page="/includee/navbar.jsp"/>

	<div class="container-fluid main-container">    
      	<div class="col-sm-2 aside">
			<h3 style="font-weight: bold;">고객 센터</h3>
			<table class="table">		
				<tr>
					<td>자주 묻는 질문</td>
				</tr>
				<tr>
					<td>질문과 답변</td>
				</tr>
				<tr>
					<td>나의 상담 내역</td>
				</tr>
			</table>
		</div>
		
      	<div class="col-sm-8 main-content text-left">
        	<form action="projectModify.do" enctype="multipart/form-data" method="post">
        		<input type="hidden" name="project_no" value="<%=article.getProjectNo() %>"/>
        		<input type="hidden" name="page" value="<%=nowPage %>"/>
        		<h3 style="font-weight: bold">프로젝트 수정하기</h3>
        		<br />
	        	<table class="table summernote">
	        		<tr>
	        			<td style="width: 15%"><label for="category">카테고리</label></td>
	        			<td style="width: 15%">
	        				<select name="category" id="category" class="form-control input-sm">
	        					<c:forEach var="i" items="${category}">
	        						<option value="${i}">${i}</option>
	        					</c:forEach>
 							</select>
	        			</td>
	        			<td></td>
	        			<td style="width: 15%"><label for="creater">창작자</label></td>
	        			<td style="width: 35%">
	        				<input type="text" name="creator" id="creator" class="form-control input-sm" value="<%=article.getCreator() %>" required="required"/>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td><label for="obj_fund">목표금액</label></td>
	        			<td colspan="2">
	        				<input type="number" name="obj_fund" id="obj_fund" class="form-control input-sm" value="<%=article.getObjFund() %>" required="required"  />
	        			</td>
	        			<td><label for="end_date">종료일자</label></td>
	        			<td>
	        				<c:if test="${errors.invalidEndDate}"><div style="color: #FF3533">종료일자는 금일 이후이어야 합니다.</div></c:if>
	        				<input type="date" name="end_date" id="end_date" class="form-control input-sm" placeholder="크라우드 펀딩 종료일자를 입력해주세요" value="<%=article.getEndDate() %>" required="required"/> 
	        			</td>
	        		</tr>
	        		<tr>
	        			<td><label for="subject">제목</label></td>
	        			<td colspan="4">
	        				<input type="text" name="subject" id="subject" class="form-control input-sm" placeholder="프로젝트 제목을 입력해주세요" value="<%=article.getSubject() %>" required="required"/>
	        			</td>
	        		</tr>
	        		<tr height="500px">
	        			<td colspan="5">
	        				<textarea name="content" id="summernote"><%=article.getContent() %></textarea>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td><label for="attachedFile">대표 이미지</label></td>
	        			<td colspan="3">
	        				<input type="file" name="attachedFile" id="attachedFile"/>
	        			</td>
	        			<td> 
	        				<input type="submit" style="float: right; width: 60px"  value="확 인" />
	        			</td>
	        		</tr>
	        	</table>
        	</form>
		</div>
	    <div class="col-sm-2 sidenav">
	    	<div class="well">
	          	<p>ADS</p>
	       	</div>
	       	<div class="well">
	          	<p>ADS</p>
	        </div>
	    </div>
  	</div>
	
	<jsp:include page="/includee/footer.jsp"/>
	
	<script>
		$(document).ready(function() {
     		$('#summernote').summernote({
             	height: 450,                 // set editor height
             	minHeight: null,             // set minimum height of editor
             	maxHeight: null,             // set maximum height of editor
             	focus: true,                 // set focus to editable area after initializing summernote
             	disableResizeEditor: true
     		});
		});
	</script>
</body>
</html>