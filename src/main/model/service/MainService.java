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

}
