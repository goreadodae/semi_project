package insertRecipe.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import common.JDBCTemplate;
import insertRecipe.model.vo.InsertRecipe;

public class InsertRecipeDao {

	public int insertRecipe(Connection conn, InsertRecipe ir) {
		
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

}
