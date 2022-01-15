package com.camping.controller.model.camp.dto;

public class CampImageDto {
	private int imageno;
	private int campno;
	private String org_file_name;
	private String save_file_name;
	private int file_size;
	private String del_chk="N";
	
	public CampImageDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CampImageDto(int imageno, int campno, String org_file_name, String save_file_name, int file_size,
			String del_chk) {
		super();
		this.imageno = imageno;
		this.campno = campno;
		this.org_file_name = org_file_name;
		this.save_file_name = save_file_name;
		this.file_size = file_size;
		this.del_chk = del_chk;
	}
	public int getImageno() {
		return imageno;
	}
	public void setImageno(int imageno) {
		this.imageno = imageno;
	}
	public int getCampno() {
		return campno;
	}
	public void setCampno(int campno) {
		this.campno = campno;
	}
	public String getOrg_file_name() {
		return org_file_name;
	}
	public void setOrg_file_name(String org_file_name) {
		this.org_file_name = org_file_name;
	}
	public String getSave_file_name() {
		return save_file_name;
	}
	public void setSave_file_name(String save_file_name) {
		this.save_file_name = save_file_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public String getDel_chk() {
		return del_chk;
	}
	public void setDel_chk(String del_chk) {
		this.del_chk = del_chk;
	}
	
	
}
