package com.springmvc.beans;

public class LHLDanhGia {
	private int lhl_madanhgia;
	private int lhl_masp;
	private int lhl_makh;
	private int lhl_danhgia;
	private String lhl_nhanxet;

	public LHLDanhGia(int lhl_madanhgia, int lhl_masp, int lhl_makh, int lhl_danhgia, String lhl_nhanxet) {
		super();
		this.lhl_madanhgia = lhl_madanhgia;
		this.lhl_masp = lhl_masp;
		this.lhl_makh = lhl_makh;
		this.lhl_danhgia = lhl_danhgia;
		this.lhl_nhanxet = lhl_nhanxet;
	}

	public LHLDanhGia() {
		super();
	}

	public int getLhl_madanhgia() {
		return lhl_madanhgia;
	}

	public void setLhl_madanhgia(int lhl_madanhgia) {
		this.lhl_madanhgia = lhl_madanhgia;
	}

	public int getLhl_masp() {
		return lhl_masp;
	}

	public void setLhl_masp(int lhl_masp) {
		this.lhl_masp = lhl_masp;
	}

	public int getLhl_makh() {
		return lhl_makh;
	}

	public void setLhl_makh(int lhl_makh) {
		this.lhl_makh = lhl_makh;
	}

	public int getLhl_danhgia() {
		return lhl_danhgia;
	}

	public void setLhl_danhgia(int lhl_danhgia) {
		this.lhl_danhgia = lhl_danhgia;
	}

	public String getLhl_nhanxet() {
		return lhl_nhanxet;
	}

	public void setLhl_nhanxet(String lhl_nhanxet) {
		this.lhl_nhanxet = lhl_nhanxet;
	}

}
