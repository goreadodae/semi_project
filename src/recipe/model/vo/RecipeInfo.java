package recipe.model.vo;

import java.util.ArrayList;

public class RecipeInfo {
	private Recipe recipe;
	private ArrayList <Process> processList;
	public ArrayList<Process> getProcessList() {
		return processList;
	}
	public void setProcessList(ArrayList<Process> processList) {
		this.processList = processList;
	}
	public Recipe getRecipe() {
		return recipe;
	}
	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}
	public RecipeInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
}
