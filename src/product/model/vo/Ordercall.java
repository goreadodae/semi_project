package product.model.vo;

public class Ordercall {	
	private int orderNo;
	private int totalFee;
	private int deliveryFee;
	private int discount;
	private int finalFee;
	private String ordererInfo;
	private String deliveryInfo;
	private int memberNo;
	
	public Ordercall() {}
	
	public Ordercall(int orderNo, int totalFee, int deliveryFee, int discount, int finalFee, String ordererInfo,
			String deliveryInfo, int memberNo) {
		super();
		this.orderNo = orderNo;
		this.totalFee = totalFee;
		this.deliveryFee = deliveryFee;
		this.discount = discount;
		this.finalFee = finalFee;
		this.ordererInfo = ordererInfo;
		this.deliveryInfo = deliveryInfo;
		this.memberNo = memberNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getTotalFee() {
		return totalFee;
	}

	public void setTotalFee(int totalFee) {
		this.totalFee = totalFee;
	}

	public int getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getFinalFee() {
		return finalFee;
	}

	public void setFinalFee(int finalFee) {
		this.finalFee = finalFee;
	}

	public String getOrdererInfo() {
		return ordererInfo;
	}

	public void setOrdererInfo(String ordererInfo) {
		this.ordererInfo = ordererInfo;
	}

	public String getDeliveryInfo() {
		return deliveryInfo;
	}

	public void setDeliveryInfo(String deliveryInfo) {
		this.deliveryInfo = deliveryInfo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	
	
}
