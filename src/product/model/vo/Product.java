package product.model.vo;

public class Product {
	private int product_no;
	private int product_quantity;
	private String product_name;
	private int product_price;
	private String product_1st_pic;
	private String product_spec_pic;
	private String product_intro;
	private String product_info;
	
	
	public Product() {}
	
	public Product(int product_no, int product_quantity, String product_name, int product_price, String product_1st_pic,
			String product_spec_pic, String product_intro, String product_info) {
		super();
		this.product_no = product_no;
		this.product_quantity = product_quantity;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_1st_pic = product_1st_pic;
		this.product_spec_pic = product_spec_pic;
		this.product_intro = product_intro;
		this.product_info = product_info;
	}
	
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_1st_pic() {
		return product_1st_pic;
	}
	public void setProduct_1st_pic(String product_1st_pic) {
		this.product_1st_pic = product_1st_pic;
	}
	public String getProduct_spec_pic() {
		return product_spec_pic;
	}
	public void setProduct_spec_pic(String product_spec_pic) {
		this.product_spec_pic = product_spec_pic;
	}
	public String getProduct_intro() {
		return product_intro;
	}
	public void setProduct_intro(String product_intro) {
		this.product_intro = product_intro;
	}
	public String getProduct_info() {
		return product_info;
	}
	public void setProduct_info(String product_info) {
		this.product_info = product_info;
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