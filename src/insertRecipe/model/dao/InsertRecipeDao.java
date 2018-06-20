package insertRecipe.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;
import insertRecipe.model.vo.InsertRecipe;
import recipe.model.vo.Process;

public class InsertRecipeDao {

	public int insertRecipe(Connection conn, InsertRecipe ir, int maxNum) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		try {
			prop.load(new FileReader(path+"resources/insertRecipeQuery.properties"));
			String query = prop.getProperty("insertRecipeAll");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ir.getRecipeTitle());
			pstmt.setString(2, ir.getRecipeIntro());
			pstmt.setString(3, ir.getRecipePic());
			pstmt.setString(4, ir.getCookServing());
			pstmt.setString(5, ir.getCookTime());
			pstmt.setString(6, ir.getCookLevel());
			pstmt.setString(7, ir.getIngredient());
			pstmt.setString(8, ir.getTip());
			pstmt.setString(9, ir.getCompletePic());
			pstmt.setString(10, ir.getRecipeTag());
			pstmt.setString(11, ir.getVideo());
			pstmt.setInt(12, ir.getClassNo());
			pstmt.setInt(13, ir.getSituationNo());
			pstmt.setInt(14, ir.getMemberNo());
			pstmt.setInt(15, ir.getIngreNo());
			
			result = pstmt.executeUpdate();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertRecipeProcess(Connection conn, ArrayList<Process> stepValuelist, int maxNum) {

		PreparedStatement pstmt = null;
		int result = 0;
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		try {
			prop.load(new FileReader(path+"resources/insertRecipeQuery.properties"));
			String query = prop.getProperty("insertRecipeProcess");
			pstmt = conn.prepareStatement(query);
			
			for(int i=0; i<stepValuelist.size();i++) {
				
				pstmt.setInt(1, stepValuelist.get(i).getProcessOrder());
				pstmt.setString(2, stepValuelist.get(i).getProcessExplain());
				pstmt.setString(3, stepValuelist.get(i).getProcessPic());
				pstmt.setString(4, stepValuelist.get(i).getIngre());
				pstmt.setString(5, stepValuelist.get(i).getTools());
				pstmt.setString(6, stepValuelist.get(i).getFireLevel());
				pstmt.setString(7, stepValuelist.get(i).getTip());
				pstmt.setInt(8, maxNum+1);
				
				result = pstmt.executeUpdate();
			}
			
		} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertRecipeMaxNum(Connection conn) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int maxNum =0;
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		try {
			prop.load(new FileReader(path+"resources/insertRecipeQuery.properties"));
			
			String query = prop.getProperty("insertRecipeMaxNum");
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				maxNum = Integer.parseInt(rset.getString("MAXRECIPENUM"));
			}
			
			System.out.println(maxNum);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return maxNum;
	}

}
