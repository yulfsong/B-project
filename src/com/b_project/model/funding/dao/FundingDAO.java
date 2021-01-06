package com.b_project.model.funding.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.b_project.model.funding.model.FundingBean;
import com.b_project.model.project.dao.ProjectDAO;
import com.b_project.model.project.model.ProjectBoardBean;
import com.b_project.util.JDBCUtil;

public class FundingDAO {

	public static FundingDAO fundingDAO;
	private FundingDAO() {}
	public static FundingDAO getInstance() {
		if(fundingDAO == null) fundingDAO = new FundingDAO();
		return fundingDAO;
	}
	
	public int insertFunding(Connection conn, FundingBean funding) {
		
		PreparedStatement pstmt = null;
		int insertCount = 0;
		int project_no = funding.getProjectNo();
		
		String sql = "insert into funding(id, fund_date, fund, project_no) values(?, now(), ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, funding.getId());
			pstmt.setInt(2, funding.getMoney());
			pstmt.setInt(3, funding.getProjectNo());
			
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		sql = "update funding_project set now_fund = now_fund + ?, supporter = supporter + 1 where project_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, funding.getMoney());
			pstmt.setInt(2, project_no);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		return insertCount;
	}
}
