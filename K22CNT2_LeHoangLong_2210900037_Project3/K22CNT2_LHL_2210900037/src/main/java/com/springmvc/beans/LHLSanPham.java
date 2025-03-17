package com.springmvc.beans;


public class LHLSanPham {
	private int lhl_masp;
	private String lhl_tensp;
	private String lhl_hinhanh;
	private String lhl_danhmuc;
	private String lhl_mota;
	private int lhl_gia;




	public LHLSanPham(int lhl_masp, String lhl_tensp, String lhl_danhmuc, String lhl_mota, int lhl_gia,
			String lhl_hinhanh) {
		super();
		this.lhl_masp = lhl_masp;
		this.lhl_tensp = lhl_tensp;
		this.lhl_danhmuc = lhl_danhmuc;
		this.lhl_mota = lhl_mota;
		this.lhl_gia = lhl_gia;
	}
	
	public LHLSanPham() {
		super();
	}

	// getter and setter
	
	public int getLhl_masp() {
		return lhl_masp;
	}

	public String getLhl_danhmuc() {
		return lhl_danhmuc;
	}

	public void setLhl_danhmuc(String lhl_danhmuc) {
		this.lhl_danhmuc = lhl_danhmuc;
	}

	public void setLhl_masp(int lhl_masp) {
		this.lhl_masp = lhl_masp;
	}

	public String getLhl_tensp() {
		return lhl_tensp;
	}

	public void setLhl_tensp(String lhl_tensp) {
		this.lhl_tensp = lhl_tensp;
	}

	public String getLhl_mota() {
		return lhl_mota;
	}

	public void setLhl_mota(String lhl_mota) {
		this.lhl_mota = lhl_mota;
	}

	public int getLhl_gia() {
		return lhl_gia;
	}

	public void setLhl_gia(int lhl_gia) {
		this.lhl_gia = lhl_gia;
	}

	public String getLhl_hinhanh() {
		return lhl_hinhanh;
	}

	public void setLhl_hinhanh(String lhl_hinhanh) {
		this.lhl_hinhanh = lhl_hinhanh;
	}
	
}
