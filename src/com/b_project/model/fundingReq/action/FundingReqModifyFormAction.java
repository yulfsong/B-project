package com.b_project.model.fundingReq.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b_project.controller.Action;
import com.b_project.controller.ActionForward;
import com.b_project.model.fundingReq.model.FundingReq;
import com.b_project.model.fundingReq.service.FundingReqDetailService;
import com.b_project.model.fundingReq.service.FundingReqModifyService;
import com.b_project.model.member.model.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FundingReqModifyFormAction implements Action {

	private static final String FORM_VIEW = "/view/fundingReq/fundingReqModifyForm.jsp";
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if(req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private ActionForward processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
			ActionForward forward = new ActionForward();
			int req_no = Integer.parseInt(req.getParameter("req_no"));
			FundingReqDetailService fundingReqDetailService = new FundingReqDetailService();
			FundingReq article = fundingReqDetailService.getArticle(req_no);
			req.setAttribute("article", article);	
			forward.setPath(FORM_VIEW);	
			return forward;
	}

	private ActionForward processForm(HttpServletRequest req, HttpServletResponse res) throws Exception {


		FundingReqModifyService projectModifyService = new FundingReqModifyService();
		ActionForward forward = new ActionForward();
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		
		req.setAttribute("errors", errors);
		
		String realFolder = null;
		String saveFolder = "attachedFile";
		int fileSize = 1024 * 1024 * 5; 
		ServletContext context = req.getServletContext();
		
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(req, realFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());
		
		String nowPage = multi.getParameter("page");
		int req_no = Integer.parseInt(multi.getParameter("req_no"));
		
		FundingReq item = new FundingReq();
		item.setSubject(multi.getParameter("subject"));
		item.setId(((Member) req.getSession().getAttribute("authUser")).getId());
		item.setContent(multi.getParameter("content"));
		item.setFile(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		
		return forward;
	}
}




