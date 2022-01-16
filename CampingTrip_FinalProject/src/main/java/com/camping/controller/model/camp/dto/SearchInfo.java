package com.camping.controller.model.camp.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SearchInfo {
	private String camp_type;
	private String address;
	private String sort;
	private String low_price;
	private String high_price;
	private String keyword=" ";
	private List<String> type_list=new ArrayList<String>();
	private List<String> keyword_list=new ArrayList<String>();
	public SearchInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SearchInfo(String camp_type, String address, String sort, String low_price, String high_price, Date date,
			String keyword) {
		super();
		this.camp_type = camp_type;
		this.address = address;
		this.sort = sort;
		this.low_price = low_price;
		this.high_price = high_price;
		this.keyword = keyword;
	}

	public String getCamp_type() {
		return camp_type;
	}
	public void setCamp_type(String camp_type) {
		this.camp_type = camp_type;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getLow_price() {
		return low_price;
	}

	public void setLow_price(String low_price) {
		this.low_price = low_price;
	}

	public String getHigh_price() {
		return high_price;
	}

	public void setHigh_price(String high_price) {
		this.high_price = high_price;
	}

	@Override
	public String toString() {
		return "SearchInfo [camp_type=" + camp_type + ", address=" + address + ", sort=" + sort + ", low_price="
				+ low_price + ", high_price=" + high_price + ", keyword=" + keyword + "]";
	}
	
	public void setType_lists() {
		if(camp_type != null && !camp_type.equals("")) {
			String[] tmp =camp_type.split(",");
			for(int i = 0 ; i<tmp.length;i++) {
				type_list.add(tmp[i]);
			}
		}
	}

	public List<String> getType_list() {
		return type_list;
	}

	public void setType_list(List<String> type_list) {
		this.type_list = type_list;
	}

	public List<String> getKeyword_list() {
		return keyword_list;
	}

	public void setKeyword_list(List<String> keyword_list) {
		this.keyword_list = keyword_list;
	}
	
}
