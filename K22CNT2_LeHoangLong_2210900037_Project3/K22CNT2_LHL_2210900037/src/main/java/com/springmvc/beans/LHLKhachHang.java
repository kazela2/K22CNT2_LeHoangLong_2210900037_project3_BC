package com.springmvc.beans;

public class LHLKhachHang {
    private int lhl_makh;
    private String lhl_hoten;
    private String lhl_email;
    private String lhl_sodienthoai;
    private String lhl_matkhau;
    
    
	public LHLKhachHang(int lhl_makh, String lhl_hoten, String lhl_email, String lhl_sodienthoai) {
		super();
		this.lhl_makh = lhl_makh;
		this.lhl_hoten = lhl_hoten;
		this.lhl_email = lhl_email;
		this.lhl_sodienthoai = lhl_sodienthoai;
	}
	
	public LHLKhachHang() {
		super();
	}

	public int getLhl_makh() {
		return lhl_makh;
	}
	public void setLhl_makh(int lhl_makh) {
		this.lhl_makh = lhl_makh;
	}
	public String getLhl_hoten() {
		return lhl_hoten;
	}
	public void setLhl_hoten(String lhl_hoten) {
		this.lhl_hoten = lhl_hoten;
	}
	public String getLhl_email() {
		return lhl_email;
	}
	public void setLhl_email(String lhl_email) {
		this.lhl_email = lhl_email;
	}
	public String getLhl_sodienthoai() {
		return lhl_sodienthoai;
	}
	public void setLhl_sodienthoai(String lhl_sodienthoai) {
		this.lhl_sodienthoai = lhl_sodienthoai;
	}

	public String getLhl_matkhau() {
		return lhl_matkhau;
	}

	public void setLhl_matkhau(String lhl_matkhau) {
		this.lhl_matkhau = lhl_matkhau;
	}
	
}