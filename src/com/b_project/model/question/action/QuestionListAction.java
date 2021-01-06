package com.b_project.model.question.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b_project.controller.Action;
import com.b_project.controller.ActionForward;
import com.b_project.model.PageInfo;
import com.b_project.model.question.model.Question;
import com.b_project.model.question.service.QuestionListService;

public class QuestionListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ArrayList<Question> articleList = null;
		int pagerLimit = 10;
		int limit = 15;
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
		
		QuestionListService questionListService = new QuestionListService();
		int listCount = questionListService.getListCount(searchOption, searchWord);
		articleList = questionListService.getArticleList(page, limit, searchOption, searchWord);
		
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
		
		ActionForward forward = new ActionForward();
		forward.setPath("/view/question/questionList.jsp");
		
		return forward;
	}

}
