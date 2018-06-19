package product.model.vo;

public class Product {
	private int productNo;
	private int productQuantity;
	private String productName;
	private int productPrice;
	private String product1stPic;
	private String productSpecPic;
	private String productIntro;
	private String productInfo;
	
	
	public Product() {}


	public Product(int productNo, int productQuantity, String productName, int productPrice, String product1stPic,
			String productSpecPic, String productIntro, String productInfo) {
		super();
		this.productNo = productNo;
		this.productQuantity = productQuantity;
		this.productName = productName;
		this.productPrice = productPrice;
		this.product1stPic = product1stPic;
		this.productSpecPic = productSpecPic;
		this.productIntro = productIntro;
		this.productInfo = productInfo;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public int getProductQuantity() {
		return productQuantity;
	}


	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
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


	public String getProductSpecPic() {
		return productSpecPic;
	}


	public void setProductSpecPic(String productSpecPic) {
		this.productSpecPic = productSpecPic;
	}


	public String getProductIntro() {
		return productIntro;
	}


	public void setProductIntro(String productIntro) {
		this.productIntro = productIntro;
	}


	public String getProductInfo() {
		return productInfo;
	}


	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

}


//PRODUCT_NO       NOT NULL NUMBER         
//PRODUCT_QUANTITY NOT NULL NUMBER         
//PRODUCT_NAME     NOT NULL VARCHAR2(20)   
//PRODUCT_PRICE    NOT NULL NUMBER         
//PRODUCT_1ST_PIC  NOT NULL VARCHAR2(200)  
//PRODUCT_SPEC_PIC NOT NULL VARCHAR2(500)  
//PRODUCT_INTRO    NOT NULL VARCHAR2(1000) 
//PRODUCT_INFO     NOT NULL VARCHAR2(1000)