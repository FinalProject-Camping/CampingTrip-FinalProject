package com.camping.controller.model.camp.dto;

public class WriterInfo {

	private double total;
	private double service;
	private double cleanliness;
	private double cost;
	private double location;
	private int totalcnt;
	private int man;
	private int woman;
	private int ten;
	private int twenty;
	private int thirty;
	private int fourty;
	private int fifty;
	public WriterInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public WriterInfo(double total, double service, double cleanliness, double cost, double location, int totalcnt,
			int man, int woman, int ten, int twenty, int thirty, int fourty, int fifty) {
		super();
		this.total = total;
		this.service = service;
		this.cleanliness = cleanliness;
		this.cost = cost;
		this.location = location;
		this.totalcnt = totalcnt;
		this.man = man;
		this.woman = woman;
		this.ten = ten;
		this.twenty = twenty;
		this.thirty = thirty;
		this.fourty = fourty;
		this.fifty = fifty;
	}

	public int getTotalcnt() {
		return totalcnt;
	}

	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}

	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public double getService() {
		return service;
	}
	public void setService(double service) {
		this.service = service;
	}
	public double getCleanliness() {
		return cleanliness;
	}
	public void setCleanliness(double cleanliness) {
		this.cleanliness = cleanliness;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public double getLocation() {
		return location;
	}
	public void setLocation(double location) {
		this.location = location;
	}
	public int getMan() {
		return man;
	}
	public void setMan(int man) {
		this.man = man;
	}
	public int getWoman() {
		return woman;
	}
	public void setWoman(int woman) {
		this.woman = woman;
	}
	public int getTen() {
		return ten;
	}
	public void setTen(int ten) {
		this.ten = ten;
	}
	public int getTwenty() {
		return twenty;
	}
	public void setTwenty(int twenty) {
		this.twenty = twenty;
	}
	public int getThirty() {
		return thirty;
	}
	public void setThirty(int thirty) {
		this.thirty = thirty;
	}
	public int getFourty() {
		return fourty;
	}
	public void setFourty(int fourty) {
		this.fourty = fourty;
	}
	public int getFifty() {
		return fifty;
	}
	public void setFifty(int fifty) {
		this.fifty = fifty;
	}

	@Override
	public String toString() {
		return "WriterInfo [total=" + total + ", service=" + service + ", cleanliness=" + cleanliness + ", cost=" + cost
				+ ", location=" + location + ", totalcnt=" + totalcnt + ", man=" + man + ", woman=" + woman + ", ten="
				+ ten + ", twenty=" + twenty + ", thirty=" + thirty + ", fourty=" + fourty + ", fifty=" + fifty + "]";
	}
	
	
	
}
