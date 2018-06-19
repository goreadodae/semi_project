package main.model.vo;

import java.sql.Date;

public class MainProduct {

	private int product_no;
	private int product_quantity;
	private String product_name;
	private int product_price;
	private String product_1st_pic;
	private Date enroll_date;
	
	public MainProduct() {
		
	}
	
	public MainProduct(int product_no, int product_quantity, String product_name, int product_price,
			String product_1st_pic, Date enroll_date) {
		super();
		this.product_no = product_no;
		this.product_quantity = product_quantity;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_1st_pic = product_1st_pic;
		this.enroll_date = enroll_date;
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

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}
}
