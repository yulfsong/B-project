package com.b_project.model.project.service;

import java.sql.Connection;

import com.b_project.model.project.dao.ProjectDAO;
import com.b_project.util.JDBCUtil;

public class ProjectDeleteService {

	public boolean removeArticle(int project_no) {
		
		boolean isRemoveSuccess = false;
		
		Connection conn = JDBCUtil.getConnection();
		ProjectDAO projectDAO = ProjectDAO.getInstance();
		int deleteCount = projectDAO.deleteArticle(conn, project_no);
		
		if(deleteCount > 0) {
			JDBCUtil.commit(conn);
			isRemoveSuccess = true;
		} else {
			JDBCUtil.rollback(conn);
		}
		JDBCUtil.close(conn);
		return isRemoveSuccess;
	}
}
