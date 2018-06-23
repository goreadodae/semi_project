package admin.model.vo;

public class AdminProduct {
	private String recipeTitle;
	private String productName;
	private String recipeWriter;
	private int price;
	private int sellQuantity;
	private int totalSales;
	private int recipeNo;
	public AdminProduct(String recipeTitle, String productName, String recipeWriter, int price, int sellQuantity,
			int totalSales, int recipeNo, int productNo) {
		super();
		this.recipeTitle = recipeTitle;
		this.productName = productName;
		this.recipeWriter = recipeWriter;
		this.price = price;
		this.sellQuantity = sellQuantity;
		this.totalSales = totalSales;
		this.recipeNo = recipeNo;
		this.productNo = productNo;
	}
	private int productNo;
	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public AdminProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}
	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getRecipeWriter() {
		return recipeWriter;
	}
	public void setRecipeWriter(String recipeWriter) {
		this.recipeWriter = recipeWriter;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSellQuantity() {
		return sellQuantity;
	}
	public void setSellQuantity(int sellQuantity) {
		this.sellQuantity = sellQuantity;
	}
	public int getTotalSales() {
		return totalSales;
	}
	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}
	
	
}
