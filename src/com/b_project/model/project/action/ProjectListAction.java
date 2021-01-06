package com.b_project.model.project.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b_project.controller.Action;
import com.b_project.controller.ActionForward;
import com.b_project.model.PageInfo;
import com.b_project.model.project.model.ProjectBoardBean;
import com.b_project.model.project.service.ProjectListService;

public class ProjectListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ArrayList<ProjectBoardBean> articleList = null;
		int pagerLimit = 10;
		int limit = 12;
		
		executeHelper(req, articleList, pagerLimit, limit);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/view/project/projectList.jsp");
		
		return forward;
	}

	public static void executeHelper(HttpServletRequest req, ArrayList<ProjectBoardBean> articleList, int pagerLimit, int limit) {
		int page = 1;
		String searchOption = "";
		String searchWord = "";
		
		if(req.getParameter("page") != null) page = Integer.parseInt(req.getParameter("page"));
		if(req.getParameter("search-option") != null && !req.getParameter("search-option").isEmpty()) {
			searchOption = req.getParameter("search-option");
		}
		if(req.getParameter("search-word") != null && !req.getParameter("search-word").isEmpty()) {
			searchWord = req.getParameter("search-word");
		}
		
		ProjectListService listProjectService = new ProjectListService();
		int listCount = listProjectService.getListCount(searchOption, searchWord);
		articleList = listProjectService.getArticleList(page, limit, "project_no", false, searchOption, searchWord);
		
		int maxPage = (listCount - 1) / limit + 1;
		int startPage = ((page - 1) / pagerLimit) * pagerLimit + 1;
		int endPage = startPage + pagerLimit - 1;
		
		if(endPage > maxPage) endPage = maxPage; 
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		req.setAttribute("pageInfo", pageInfo);
		req.setAttribute("articleList", articleList);
		req.setAttribute("search-option", searchOption);
		req.setAttribute("search-word", searchWord);
	}
}
