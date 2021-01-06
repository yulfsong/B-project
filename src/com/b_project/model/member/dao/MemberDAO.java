package com.b_project.model.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.Date;

import com.b_project.model.member.model.Member;
import com.b_project.util.JDBCUtil;

public class MemberDAO {

	// 싱글톤
	public static MemberDAO memberDAO;	
	private MemberDAO() {}
	public static MemberDAO getInstance() {
		if(memberDAO == null) memberDAO = new MemberDAO();
		return memberDAO;
	}
	

	public Member selectByID(Connection conn, String id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		
		String sql = "select * from member where id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new Member(rs.getString(1), 
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4), 
									rs.getString(5), 
									toDate(rs.getTimestamp(6)), 
									rs.getInt(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return member;
	}
	
	public int insert(Connection conn, Member member) {
		
		PreparedStatement pstmt = null;
		int insertCount = 0;
		// sql문을 보면 등급(level)의 default값은 1임을 알 수 있다.
		String sql = "insert into member values(?,?,?,?,?,now(),1)";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPassword());
			
			if(member.getTel() == null) {
				pstmt.setNull(4, Types.VARCHAR);
			} else {
				pstmt.setString(4, member.getTel());
			}
			
			pstmt.setString(5, member.geteMail());
			
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return insertCount;
	}
	
	
	
	
	
	
	private Date toDate(Timestamp date) {
		return date == null ? null : new Date(date.getTime());
	}
	
}
