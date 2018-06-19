package qna.model.vo;

import java.sql.Date;

public class InquiryOrder {
	private int buyingNo;
	private Date orderDate;
	private String productName;
	private int buyingQuantity;
	private int productPrice;
	

	public InquiryOrder() {
		super();
		
	}
	
	public InquiryOrder(int buyingNo, Date orderDate, String productName, int buyingQuantity, int productPrice) {
		super();
		this.buyingNo = buyingNo;
		this.orderDate = orderDate;
		this.productName = productName;
		this.buyingQuantity = buyingQuantity;
		this.productPrice = productPrice;
	}

	public int getBuyingNo() {
		return buyingNo;
	}
	public void setBuyingNo(int buyingNo) {
		this.buyingNo = buyingNo;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getBuyingQuantity() {
		return buyingQuantity;
	}
	public void setBuyingQuantity(int buyingQuantity) {
		this.buyingQuantity = buyingQuantity;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	
	

}
