package product.model.vo;

import java.sql.Date;

public class Buying {
	private int productNo;
	private int buyingNo;
	private int buyingQuantity;
	private Date buyingDate;
	private String productName;
	private int productPrice;
	private String product1stPic;
	
	public Buying() {}
	
	public Buying(int productNo, int buyingNo, int buyingQuantity, Date buyingDate, String productName,
			int productPrice, String product1stPic) {
		super();
		this.productNo = productNo;
		this.buyingNo = buyingNo;
		this.buyingQuantity = buyingQuantity;
		this.buyingDate = buyingDate;
		this.productName = productName;
		this.productPrice = productPrice;
		this.product1stPic = product1stPic;
	}
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getBuyingNo() {
		return buyingNo;
	}
	public void setBuyingNo(int buyingNo) {
		this.buyingNo = buyingNo;
	}
	public int getBuyingQuantity() {
		return buyingQuantity;
	}
	public void setBuyingQuantity(int buyingQuantity) {
		this.buyingQuantity = buyingQuantity;
	}
	public Date getBuyingDate() {
		return buyingDate;
	}
	public void setBuyingDate(Date buyingDate) {
		this.buyingDate = buyingDate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProduct1stPic() {
		return product1stPic;
	}
	public void setProduct1stPic(String product1stPic) {
		this.product1stPic = product1stPic;
	}
	
	
}
