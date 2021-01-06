<%@page import="java.util.Date"%>
<%@page import="com.b_project.model.project.model.ProjectBoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.b_project.model.project.service.ProjectListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

${ctxPath = pageContext.request.contextPath; ''}

<%
	int limit = 4;
	ProjectListService projectListService = new ProjectListService();
	
	ArrayList<ProjectBoardBean> hotArticleList = projectListService.getArticleList(1, limit, "now_fund", false);
	ArrayList<ProjectBoardBean> newArticleList = projectListService.getArticleList(1, limit, "wrt_date", false);
	ArrayList<ProjectBoardBean> oldArticleList = projectListService.getArticleList(1, limit, "DATEDIFF(END_DATE, NOW())", true);
	
	if(oldArticleList.size()<4) {
		limit = oldArticleList.size();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title>B-Project</title>
	
  	<jsp:include page="/includee/init.jsp"/>
  	
  	<style>
  	
   	.carousel-inner img {
        width: 100%; /* Set width to 100% */
        margin: auto;
        min-height:200px;
    }

    /* Hide the carousel text when the screen is less than 600 pixels wide */
    @media (max-width: 600px) {
      	.carousel-caption {
        	display: none; 
      	}
    }
  	</style>
</head>
<body>
  	<jsp:include page="/includee/navbar.jsp"/>
  	
  	<div id="myCarousel" class="carousel slide" data-ride="carousel">
      	<!-- Indicators -->
      	<ol class="carousel-indicators">
        	<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        	<li data-target="#myCarousel" data-slide-to="1"></li>
        	<li data-target="#myCarousel" data-slide-to="2"></li>
      	</ol>

      	<!-- Wrapper for slides -->
      	<div class="carousel-inner" role="listbox">
        	<div class="item active">
          		<img src="${ctxPath}/img/m1.jpg" alt="Image">
          			<div class="carousel-caption">
	            		<h3>Sell $</h3>
	            		<p>Money Money.</p>
          			</div>      
        	</div>

        	<div class="item">
          		<img src="${ctxPath}/img/m2.jpg" alt="Image">
          		<div class="carousel-caption">
            		<h3>More Sell $</h3>
            		<p>Lorem ipsum...</p>
          		</div>      
        	</div>
        	
        	<div class="item">
          		<img src="${ctxPath}/img/m3.jpg" alt="Image">
          		<div class="carousel-caption">
            		<h3>More1111 Sell $</h3>
            		<p>Lorem1111 ipsum...</p>
          		</div>      
        	</div>
      	</div>

      	<!-- Left and right controls -->
      	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        	<span class="sr-only">Previous</span>
      	</a>
      	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        	<span class="sr-only">Next</span>
      	</a>
  	</div>
  	
  	<div class="container-fluid" style="background-color: #f0f0f0">
	  	<div class="container" style="margin-top: 30px"> 
	  		
	  	<% if(hotArticleList != null && !hotArticleList.isEmpty()) { %>	
		  	<!-- 인기프로젝트 -->
		  	<h5 style="font-weight: bold;">인기 프로젝트</h5>
		  	<br />
		  	<% for(int i=0; i< limit; i++) { %>
	   		<div class="col-sm-3 items">
	   			<%
					ProjectBoardBean bean = hotArticleList.get(i);
					if(bean.getAttachedFile() == null) {
						bean.setAttachedFile("default.jpg");
					}
				%>
				<div class="project-item" onclick="location.href='${ctxPath}/projectRead.do?project_no=<%=bean.getProjectNo()%>'">
					<img src="${ctxPath}/attachedFile/<%=bean.getAttachedFile()%>" alt="<%=bean.getAttachedFile()%>" width="100%" height="53%"/>
					<div style="padding: 15px;">
						<div style="height: 100px;">
							<p style="font-weight: bold;"><%=bean.getSubject() %></p>
							<p style="margin-top: -5px;"><small><%=bean.getCreator() %></small></p>
						</div>
						
						<div class="progress" style="height: 4px;">
							<%
								long progress = ((long)bean.getNowFund()*100)/bean.getObjFund();
							%>
	  						<div class="progress-bar" role="progressbar" 
	  							 aria-valuenow="<%=progress%>" 
	  							 aria-valuemin="0" aria-valuemax="100" 
	  							 style="width:<%=progress %>%; background-color: #4263EB;">
	  						</div>
						</div>
						<%
							Date today = new Date();
							long diff = bean.getEndDate().getTime() - today.getTime();
							long diffDays = diff/ (24 * 60 * 60 * 1000);
						%>
						<p style="margin-top: -10px; float: left;"><small><%=diffDays%>일 남음</small></p>
						<p style="margin-top: -10px; float: right;"><small><%=bean.getNowFund()%>원(<%=progress%>%)</small></p>
					</div>			
				</div>
			</div>
			<% } %>
			
			<!-- 새로운 프로젝트 -->
			<h5 style="font-weight: bold;">새로운 프로젝트</h5>
		  	<br />
		  	<% for(int i=0; i< limit; i++) { %>
	   		<div class="col-sm-3 items">
	   			<%
					ProjectBoardBean bean = newArticleList.get(i);
					if(bean.getAttachedFile() == null) {
						bean.setAttachedFile("default.jpg");
					}
				%>
				<div class="project-item" onclick="location.href='${ctxPath}/projectRead.do?project_no=<%=bean.getProjectNo()%>'">
					<img src="${ctxPath}/attachedFile/<%=bean.getAttachedFile()%>" alt="<%=bean.getAttachedFile()%>" width="100%" height="53%"/>
					<div style="padding: 15px;">
						<div style="height: 100px;">
							<p style="font-weight: bold;"><%=bean.getSubject() %></p>
							<p style="margin-top: -5px;"><small><%=bean.getCreator() %></small></p>
						</div>
						
						<div class="progress" style="height: 4px;">
							<%
								long progress = ((long)bean.getNowFund()*100)/bean.getObjFund();
							%>
	  						<div class="progress-bar" role="progressbar" 
	  							 aria-valuenow="<%=progress%>" 
	  							 aria-valuemin="0" aria-valuemax="100" 
	  							 style="width:<%=progress %>%; background-color: #4263EB;">
	  						</div>
						</div>
						<%
							Date today = new Date();
							long diff = bean.getEndDate().getTime() - today.getTime();
							long diffDays = diff/ (24 * 60 * 60 * 1000);
						%>
						<p style="margin-top: -10px; float: left;"><small><%=diffDays%>일 남음</small></p>
						<p style="margin-top: -10px; float: right;"><small><%=bean.getNowFund()%>원(<%=progress%>%)</small></p>
					</div>			
				</div>
			</div>
			<% } %>
			
			<!-- 마감 임박 프로젝트 -->
			<h5 style="font-weight: bold;">마감 임박 프로젝트</h5>
		  	<br />
		  	<% for(int i=0; i< limit; i++) { %>
		   		<div class="col-sm-3 items">
		   			<%
						ProjectBoardBean bean = oldArticleList.get(i);
						if(bean.getAttachedFile() == null) {
							bean.setAttachedFile("default.jpg");
						}
					%>
					<div class="project-item" onclick="location.href='${ctxPath}/projectRead.do?project_no=<%=bean.getProjectNo()%>'">
						<img src="${ctxPath}/attachedFile/<%=bean.getAttachedFile()%>" alt="<%=bean.getAttachedFile()%>" width="100%" height="53%"/>
						<div style="padding: 15px;">
							<div style="height: 100px;">
								<p style="font-weight: bold;"><%=bean.getSubject() %></p>
								<p style="margin-top: -5px;"><small><%=bean.getCreator() %></small></p>
							</div>
							
							<div class="progress" style="height: 4px;">
								<%
									long progress = ((long)bean.getNowFund()*100)/bean.getObjFund();
								%>
		  						<div class="progress-bar" role="progressbar" 
		  							 aria-valuenow="<%=progress%>" 
		  							 aria-valuemin="0" aria-valuemax="100" 
		  							 style="width:<%=progress %>%; background-color: #4263EB;">
		  						</div>
							</div>
							<%
								Date today = new Date();
								long diff = bean.getEndDate().getTime() - today.getTime();
								long diffDays = diff / (24 * 60 * 60 * 1000);
							%>
							<p style="margin-top: -10px; float: left;"><small><%=diffDays%>일 남음</small></p>
							<p style="margin-top: -10px; float: right;"><small><%=bean.getNowFund()%>원(<%=progress%>%)</small></p>
						</div>			
					</div>
				</div>
			<% } %>
		<% } %>	
		</div>
	</div>
	
  	<jsp:include page="/includee/footer.jsp"/>
</body>
</html>
