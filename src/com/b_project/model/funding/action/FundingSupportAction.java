package com.b_project.model.funding.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b_project.controller.Action;
import com.b_project.controller.ActionForward;
import com.b_project.model.funding.model.FundingBean;
import com.b_project.model.funding.service.FundingSupportService;
import com.b_project.model.member.model.Member;

public class FundingSupportAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		FundingSupportService fundingSupportService = new FundingSupportService();
		ActionForward forward = new ActionForward();
		String nowPage = req.getParameter("page");
		String password = req.getParameter("password");
		
		// FundingBean 세팅
		FundingBean fundingBean = new FundingBean();
		int projectNo = Integer.parseInt(req.getParameter("project_no"));
		fundingBean.setProjectNo(projectNo);
		Member user = (Member) req.getSession(false).getAttribute("authUser");
		String id = user.getId();
		fundingBean.setId(id);
		int money = Integer.parseInt(req.getParameter("money"));
		fundingBean.setMoney(money);
		
		// 비밀번호 일치 여부 조사
		boolean confirmPassword = user.matchPassword(password);
		
		boolean isSupportSuccess = fundingSupportService.registerFunding(fundingBean);
		
		if(!isSupportSuccess) {
			res.setContentType("text/html;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('후원금 등록 실패!');");
			out.println("history.back();");
			out.println("</script>");
		} else if(!confirmPassword) {
			res.setContentType("text/html;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			res.setContentType("text/html;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('후원금이 성공적으로 등록되었습니다!');");
			out.println("location.href='" + req.getContextPath() +"/projectRead.do?project_no=" + projectNo +"&page=" + nowPage + "';");
			out.println("</script>");
		}
		return forward;
	}
}
