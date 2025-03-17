package com.springmvc.beans;

public class LHLNhanVien {
	private int lhl_manv;
	private String lhl_hoten;
	private String lhl_sodienthoai;
	private String lhl_chucvu;
	
	
	
	public LHLNhanVien() {
		super();
	}
	public LHLNhanVien(int lhl_manv, String lhl_hoten, String lhl_sodienthoai, String lhl_chucvu) {
		super();
		this.lhl_manv = lhl_manv;
		this.lhl_hoten = lhl_hoten;
		this.lhl_sodienthoai = lhl_sodienthoai;
		this.lhl_chucvu = lhl_chucvu;
	}
	public int getLhl_manv() {
		return lhl_manv;
	}
	public void setLhl_manv(int lhl_manv) {
		this.lhl_manv = lhl_manv;
	}
	public String getLhl_hoten() {
		return lhl_hoten;
	}
	public void setLhl_hoten(String lhl_hoten) {
		this.lhl_hoten = lhl_hoten;
	}
	public String getLhl_sodienthoai() {
		return lhl_sodienthoai;
	}
	public void setLhl_sodienthoai(String lhl_sodienthoai) {
		this.lhl_sodienthoai = lhl_sodienthoai;
	}
	public String getLhl_chucvu() {
		return lhl_chucvu;
	}
	public void setLhl_chucvu(String lhl_chucvu) {
		this.lhl_chucvu = lhl_chucvu;
	}
	
	
}
