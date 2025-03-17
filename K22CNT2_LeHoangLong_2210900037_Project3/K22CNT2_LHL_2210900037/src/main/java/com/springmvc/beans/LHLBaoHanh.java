package com.springmvc.beans;

import java.util.Date;

public class LHLBaoHanh {
	private int lhl_mabaohanh;
	private int lhl_masp;
	private Date lhl_ngaybatdau;
	private Date lhl_ngayketthuc;
	private String lhl_trangthai;

	public LHLBaoHanh(int lhl_mabaohanh, int lhl_masp, Date lhl_ngaybatdau, Date lhl_ngayketthuc,
			String lhl_trangthai) {
		super();
		this.lhl_mabaohanh = lhl_mabaohanh;
		this.lhl_masp = lhl_masp;
		this.lhl_ngaybatdau = lhl_ngaybatdau;
		this.lhl_ngayketthuc = lhl_ngayketthuc;
		this.lhl_trangthai = lhl_trangthai;
	}

	public LHLBaoHanh() {
		super();
	}

	public int getLhl_mabaohanh() {
		return lhl_mabaohanh;
	}

	public void setLhl_mabaohanh(int lhl_mabaohanh) {
		this.lhl_mabaohanh = lhl_mabaohanh;
	}

	public int getLhl_masp() {
		return lhl_masp;
	}

	public void setLhl_masp(int lhl_masp) {
		this.lhl_masp = lhl_masp;
	}

	public Date getLhl_ngaybatdau() {
		return lhl_ngaybatdau;
	}

	public void setLhl_ngaybatdau(Date lhl_ngaybatdau) {
		this.lhl_ngaybatdau = lhl_ngaybatdau;
	}

	public Date getLhl_ngayketthuc() {
		return lhl_ngayketthuc;
	}

	public void setLhl_ngayketthuc(Date lhl_ngayketthuc) {
		this.lhl_ngayketthuc = lhl_ngayketthuc;
	}

	public String getLhl_trangthai() {
		return lhl_trangthai;
	}

	public void setLhl_trangthai(String lhl_trangthai) {
		this.lhl_trangthai = lhl_trangthai;
	}

}
