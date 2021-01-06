package com.b_project.model.fundingReq.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b_project.controller.Action;
import com.b_project.controller.ActionForward;
import com.b_project.model.fundingReq.model.FundingReq;
import com.b_project.model.fundingReq.service.FundingReqModifyService;

public class FundingReqModifyProAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		FundingReqModifyService fundingReqModifyService = new FundingReqModifyService();
		boolean isUpdateSuccess = fundingReqModifyService.modifyFunding(item);
	}

}
