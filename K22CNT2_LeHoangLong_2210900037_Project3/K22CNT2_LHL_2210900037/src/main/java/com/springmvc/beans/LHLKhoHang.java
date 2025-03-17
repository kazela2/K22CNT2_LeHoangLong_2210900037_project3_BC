package com.springmvc.beans;

import java.util.Date;

public class LHLKhoHang {
    private int lhl_makho;
    private int lhl_masp;
    private int lhl_soluongton;
    private Date lhl_ngaynhap;

    // Constructor mặc định
    public LHLKhoHang() {}

    // Constructor có tham số
    public LHLKhoHang(int lhl_makho, int lhl_masp, int lhl_soluongton, Date lhl_ngaynhap) {
        this.lhl_makho = lhl_makho;
        this.lhl_masp = lhl_masp;
        this.lhl_soluongton = lhl_soluongton;
        this.lhl_ngaynhap = lhl_ngaynhap;
    }

    // Getter và Setter
    public int getLhl_makho() {
        return lhl_makho;
    }

    public void setLhl_makho(int lhl_makho) {
        this.lhl_makho = lhl_makho;
    }

    public int getLhl_masp() {
        return lhl_masp;
    }

    public void setLhl_masp(int lhl_masp) {
        this.lhl_masp = lhl_masp;
    }

    public int getLhl_soluongton() {
        return lhl_soluongton;
    }

    public void setLhl_soluongton(int lhl_soluongton) {
        this.lhl_soluongton = lhl_soluongton;
    }

    public Date getLhl_ngaynhap() {
        return lhl_ngaynhap;
    }

    public void setLhl_ngaynhap(Date lhl_ngaynhap) {
        this.lhl_ngaynhap = lhl_ngaynhap;
    }

}
