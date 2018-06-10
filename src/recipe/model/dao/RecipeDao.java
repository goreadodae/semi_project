package recipe.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;

public class RecipeDao {

	public ArrayList<String> getCategoryClass(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<String> list = new ArrayList<String>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("classSelectAll");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				list.add(rset.getString("CLASS_NAME"));
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

	public ArrayList<String> getCategorySituation(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<String> list = new ArrayList<String>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("situationSelectAll");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				list.add(rset.getString("situation_name"));
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

	public ArrayList<String> getCategoryMethod(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<String> list = new ArrayList<String>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("methodSelectAll");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				list.add(rset.getString("method_name"));
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

	public ArrayList<String> getCategoryIngredient(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<String> list = new ArrayList<String>();
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/recipeQuery.properties"));
			String query = prop.getProperty("ingredientSelectAll");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				list.add(rset.getString("ingre_name"));
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
