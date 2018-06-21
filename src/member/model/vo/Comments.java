package member.model.vo;

import java.sql.Timestamp;

public class Comments {
   
   private int commentNo;
   private String recipeName;
   private String commentContents;
   private Timestamp commentEnrollDate;
   
   public Comments() {}
   
   public int getCommentNo() {
      return commentNo;
   }

   public void setCommentNO(int commentNo) {
      this.commentNo = commentNo;
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