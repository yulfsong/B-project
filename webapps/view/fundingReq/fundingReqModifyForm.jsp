<%@ page import="com.b_project.model.fundingReq.model.FundingReq"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	${ctxPath = pageContext.request.contextPath; ''}
	
<% 
	FundingReq article = (FundingReq)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");

%>
<!DOCTYPE>
<html>
<head>
	<title>글 수정하기</title>
	
	<jsp:include page="/includee/init.jsp"/>
</head>
<body>
	<script type="text/javascript">
		function modifyboard() {
			modifyform.submit();
		}
	</script>
	<jsp:include page="/includee/navbar.jsp"/>
	
		<center>
			<form action="fundingReqModifyPro.do" method="post" enctype="multipart/form-data">
				<input type="text" name="page" value="<%=nowPage %>" />
				<input type="text" name="req_no" value="<%=article.getReqNo()%>"/>
				<table>
					<tr>
						<td>프로젝트 제목</td>
						<td><input type="text" name="subject" value="<%=article.getSubject()%>"/></td>
					</tr>
					<tr>
						<td>프로젝트 내용</td>
						<td><textarea name="content" cols="40" rows="15"><%=article.getContent()%></textarea></td>
					</tr>
					<tr>
						<td></td>
						<td>파일</td>
					</tr>
					 <tr align="center">		
					 	<td colspan="2">
					 		<a href="${ctxPath}/fundingReqList.do?req_no=<%=article.getReqNo()%>&page=<%=nowPage%>" class="btn btn-default" style="float: right;">
								<span class="glyphicon glyphicon-list-alt"></span> 목록
							</a> <!-- 목록 -->
						
							<a href="${ctxPath}/fundingReqModify.do?req_no=<%=article.getReqNo()%>" class="btn btn-default" style="float: right;">
						 		<span class="glyphicon glyphicon-cog"></span> 수정
							</a> <!-- 수정 --> 
					 	</td>		 
					 </tr>
				</table>
			</form>
		</center>
	<jsp:include page="/includee/footer.jsp"/>
</body>
</html>