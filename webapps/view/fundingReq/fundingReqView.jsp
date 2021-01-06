<%@page import="com.b_project.model.fundingReq.model.FundingReq"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	${ctxPath = pageContext.request.contextPath; ''}

<% 
	FundingReq article = (FundingReq)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
%>
<!DOCTYPE>
<html>
<head>
	<title>글 내용 확인하기</title>
	
	<jsp:include page="/includee/init.jsp"/>
</head>
<body>
	<jsp:include page="/includee/navbar.jsp"/>
	
	<div class="container-fluid main-container">
		<div class ="col-sm-8 main-content">	
		<center>
			<table>
				<tr>
					<td style="width: 20%">프로젝트 제목</td>
					<td><%=article.getSubject()%><td>
				</tr>
				<tr>
					<td>프로젝트 내용</td>
					<td>
						<textarea style="resize:none;" name="content" id="content" class="form-control input-sm" 
										required="required" rows="25" cols="15"><%=article.getContent()%></textarea>
					</td>
				</tr>
				<tr>
					<td>파일</td>
					<td>
						<% if(article.getFile() != null) { %>
							<a href="file_down?downFile=<%=article.getFile()%>"><%=article.getFile()%></a>
						<% } else { %>
							첨부파일이 없습니다.
						<% } %>						
					</td>
				</tr>
				<tr align="center">
					<br/>
	 			<td colspan="2">
						<a href="${ctxPath}/fundingReqList.do?req_no=<%=article.getReqNo()%>&page=<%=nowPage%>" class="btn btn-default" style="float: right;">
								<span class="glyphicon glyphicon-list-alt"></span> 목록
							</a> <!-- 목록 -->
						
						<a href="${ctxPath}/fundingReqModifyForm.do?req_no=<%=article.getReqNo()%>" class="btn btn-default" style="float: right;">
						 		<span class="glyphicon glyphicon-cog"></span> 수정
							</a> <!-- 수정 --> 
						
						<a href="${ctxPath}/fundingReqDelete.do?req_no=<%=article.getReqNo()%>" class="btn btn-default" style="float: right;">
								<span class="glyphicon glyphicon-remove"></span> 삭제
							</a> <!-- 삭제 -->
					</td>	
				</tr>
			</table>
		</center>
		
		</div>
	</div>
	
	<jsp:include page="/includee/footer.jsp"/>
	
</body>
</html>