package main.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import main.model.dao.MainDao;
import main.model.vo.MainRecipe;

public class MainService {

	public String getTotalRecipe() {
		Connection conn = JDBCTemplate.getConnection();
		String totalRecipe= new MainDao().getTotalRecipe(conn);
		JDBCTemplate.close(conn);
		return totalRecipe;
	}

	public ArrayList<MainRecipe> getRecipe() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<MainRecipe> list = new MainDao().getRecipe(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<MainRecipe> getMonthlyRecipe() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<MainRecipe> list = new MainDao().getMonthlyRecipe(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public void searchRecipe(String userValue) {
		Connection conn = JDBCTemplate.getConnection();
		new MainDao().searchRecipe(userValue);
		
	}

	public int upViews(int num) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MainDao().upViews(conn, num);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
}
