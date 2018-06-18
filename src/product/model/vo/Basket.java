package product.model.vo;

public class Basket {
	private int basketNo;
	private String productName;
	private String product1stPic;
	private int basketQuantity;
	private int productPrice;
	
	public Basket() {}
	
	public Basket(int basketNo, String productName, String product1stPic, int basketQuantity, int productPrice) {
		super();
		this.basketNo = basketNo;
		this.productName = productName;
		this.product1stPic = product1stPic;
		this.basketQuantity = basketQuantity;
		this.productPrice = productPrice;
	}
	
	public int getBasketNo() {
		return basketNo;
	}
	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProduct1stPic() {
		return product1stPic;
	}
	public void setProduct1stPic(String product1stPic) {
		this.product1stPic = product1stPic;
	}
	public int getBasketQuantity() {
		return basketQuantity;
	}
	public void setBasketQuantity(int basketQuantity) {
		this.basketQuantity = basketQuantity;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
}
