package member.model.vo;

public class BuyProduct {

   private String product_img;
   private String product_name;
   private String buying_send_yn;
   
   public BuyProduct() {}

   public String getProduct_img() {
      return product_img;
   }

   public void setProduct_img(String product_img) {
      this.product_img = product_img;
   }

   public String getProduct_name() {
      return product_name;
   }

   public void setProduct_name(String product_name) {
      this.product_name = product_name;
   }

   public String getBuying_send_yn() {
      return buying_send_yn;
   }

   public void setBuying_send_yn(String buying_send_yn) {
      this.buying_send_yn = buying_send_yn;
   }
   
   
}