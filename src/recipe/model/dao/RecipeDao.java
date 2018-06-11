package recipe.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import common.JDBCTemplate;

public class RecipeDao {

	public HashMap<Integer, String> getCategoryClass(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("classSelectAll");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				list.put(rset.getInt("CLASS_NO"), rset.getString("CLASS_NAME"));
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}

	public HashMap<Integer, String> getCategorySituation(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("situationSelectAll");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				list.put(rset.getInt("situation_NO"),rset.getString("situation_name"));
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}

	public HashMap<Integer, String> getCategoryMethod(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("methodSelectAll");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				list.put(rset.getInt("method_no"), rset.getString("method_name"));
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}

	public HashMap<Integer, String> getCategoryIngredient(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("ingredientSelectAll");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				list.put(rset.getInt("ingre_no"), rset.getString("ingre_name"));
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}

}
