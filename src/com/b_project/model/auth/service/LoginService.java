package com.b_project.model.auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.b_project.model.member.dao.MemberDAO;
import com.b_project.model.member.model.Member;
import com.b_project.util.JDBCUtil;

public class LoginService {

	private MemberDAO memberDAO = MemberDAO.getInstance();
	
	public Member login(String id, String password) {
			
		try(Connection conn = JDBCUtil.getConnection()) {
			Member member = memberDAO.selectByID(conn, id);
			if(member == null) {
				throw new LoginFailException();
			}
			if(!member.matchPassword(password)) {
				throw new LoginFailException();
			}
			return member;
		} catch (SQLException e) {
			throw new RuntimeException();
		}	
	}
}
