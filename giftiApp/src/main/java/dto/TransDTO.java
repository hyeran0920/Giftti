package dto;

import java.util.Date;

public class TransDTO {

	private String userId;
	private int registerId;
	private int transNum;
	private String itemName;
	private int price;
	private int salePrice;
	private String buyId;
	private String category;
	private String brand;
	private Date inDate;
	private Date transDate;
	private Date availDate;
	private String isSale;
	private double discount;
	private int itemId;
	
	public int getTransNum() {
		return transNum;
	}
	public void setTransNum(int transNum) {
		this.transNum = transNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setIsSale(String isSale) {
		this.isSale = isSale;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public Date getAvailDate() {
		return availDate;
	}
	public void setAvailDate(Date availDate) {
		this.availDate = availDate;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public int getRegisterId() {
		return registerId;
	}
	public void setRegisterId(int registerId) {
		this.registerId = registerId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	
	public String getBuyId() {
		return buyId;
	}
	public void setBuyId(String buyId) {
		this.buyId = buyId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getInDate() {
		return inDate;
	}
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	public Date getTransDate() {
		return transDate;
	}
	public void setTransDate(Date transDate) {
		this.transDate = transDate;
	}
	public String getIsSale() {
		return isSale;
	}
	public void setSale(String isSale) {
		this.isSale = isSale;
	}
	
}
