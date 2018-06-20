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
import recipe.model.vo.Process;
import recipe.model.vo.Recipe;

public class InsertRecipeDao {

	public int insertRecipe(Connection conn, Recipe ir, int maxNum) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		/*String query = "insert into recipe values(?,?,?,?,?,?,?,?,?,?,0,0,0,?,?,sysdate,?,?,?,?,?)";*/
		try {
			prop.load(new FileReader(path+"resources/insertRecipeQuery.properties"));
			String query = prop.getProperty("insertRecipeAll");
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, maxNum+1);
			pstmt.setString(2, ir.getRecipeTitle());
			pstmt.setString(3, ir.getRecipeIntro());
			pstmt.setString(4, ir.getRecipePic());
			pstmt.setString(5, ir.getCookServing());
			pstmt.setString(6, ir.getCookTime());
			pstmt.setString(7, ir.getCookLevel());
			pstmt.setString(8, ir.getIngredient());
			pstmt.setString(9, ir.getTip());
			pstmt.setString(10, ir.getCompletePic());
			pstmt.setString(11, ir.getRecipeTag());
			pstmt.setString(12, ir.getVideo());
			pstmt.setInt(13, ir.getClassNo());
			pstmt.setInt(14, ir.getSituationNo());
			pstmt.setInt(15, ir.getMethodNo());
			pstmt.setInt(16, ir.getIngreNo());
			pstmt.setInt(17, ir.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		}  catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
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
				
				System.out.println(stepValuelist.get(i).getProcessOrder());
				System.out.println(stepValuelist.get(i).getProcessExplain());
				System.out.println(stepValuelist.get(i).getProcessPic());
				System.out.println(stepValuelist.get(i).getIngre());
				System.out.println(stepValuelist.get(i).getTools());
				System.out.println(stepValuelist.get(i).getFireLevel());
				System.out.println(stepValuelist.get(i).getTip());
				System.out.println(maxNum+1);
				
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
				maxNum = rset.getInt("MAXRECIPENUM");
				System.out.println(maxNum);
			}
			
			
			
		}  catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return maxNum;
	}

}
