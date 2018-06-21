package insertRecipe.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import insertRecipe.model.dao.InsertRecipeDao;
import insertRecipe.model.vo.InsertRecipe;
import recipe.model.vo.Process;
import recipe.model.vo.Recipe;

public class InsertRecipeService {

	public int insertRecipe(Recipe ir, ArrayList<Process> stepValuelist) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result =0;
		Process pr = new Process();
		int insertProcessResult=0;
		
		int maxNum = new InsertRecipeDao().insertRecipeMaxNum(conn);
		int insertRecipeResult = new InsertRecipeDao().insertRecipe(conn,ir,maxNum);
		
		
		for(int i=0; i<stepValuelist.size();i++) {
			
			pr.setProcessOrder(stepValuelist.get(i).getProcessOrder());
			pr.setProcessExplain(stepValuelist.get(i).getProcessExplain());
			pr.setProcessPic(stepValuelist.get(i).getProcessPic());
			pr.setIngre(stepValuelist.get(i).getIngre());
			pr.setTools(stepValuelist.get(i).getTools());
			pr.setFireLevel(stepValuelist.get(i).getFireLevel());
			pr.setTip(stepValuelist.get(i).getTip());
			pr.setRecipeNo(maxNum+1);
			
			insertProcessResult = new InsertRecipeDao().insertRecipeProcess(conn,pr);
		}
		
		
		if(insertRecipeResult>0 && insertProcessResult>0) {
			JDBCTemplate.commit(conn);
			result = maxNum+1; //커밋완료시 레시피 번호를 리턴
		}else {
			JDBCTemplate.rollback(conn);
			result = -1;
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	

	

}
