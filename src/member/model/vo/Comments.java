package member.model.vo;

import java.sql.Timestamp;

public class Comments {
   
   private int commentNo;
   private int recipeNo;
   private String recipeName;
   private String commentContents;
   private Timestamp commentEnrollDate;
   
   public Comments() {}
   
   
   
   
   public int getCommentNo() {
	return commentNo;
}

public void setCommentNo(int commentNo) {
	this.commentNo = commentNo;
}

public int getRecipeNo() {
      return recipeNo;
   }

   public void setRecipeNo(int recipeNo) {
      this.recipeNo = recipeNo;
   }

   public String getRecipeName() {
      return recipeName;
   }

   public void setRecipeName(String recipeName) {
      this.recipeName = recipeName;
   }

   public String getCommentContents() {
      return commentContents;
   }

   public void setCommentContents(String commentContents) {
      this.commentContents = commentContents;
   }

   public Timestamp getCommentEnrollDate() {
      return commentEnrollDate;
   }

   public void setCommentEnrollDate(Timestamp commentEnrollDate) {
      this.commentEnrollDate = commentEnrollDate;
   }
   
   
}