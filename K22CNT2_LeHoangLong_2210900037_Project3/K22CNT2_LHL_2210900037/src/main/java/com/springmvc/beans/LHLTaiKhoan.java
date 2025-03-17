package com.springmvc.beans;

public class LHLTaiKhoan {
    private int lhl_matk;
    private String lhl_tendangnhap;
    private String lhl_matkhau;
    private String lhl_email;
    private String lhl_vaitro;

    public LHLTaiKhoan() {
        super();
    }

    public LHLTaiKhoan(int lhl_matk, String lhl_tendangnhap, String lhl_matkhau, String lhl_email, String lhl_vaitro) {
        super();
        this.lhl_matk = lhl_matk;
        this.lhl_tendangnhap = lhl_tendangnhap;
        this.lhl_matkhau = lhl_matkhau;
        this.lhl_email = lhl_email;
        this.lhl_vaitro = lhl_vaitro;
    }

    public int getLhl_matk() {
        return lhl_matk;
    }

    public void setLhl_matk(int lhl_matk) {
        this.lhl_matk = lhl_matk;
    }

    public String getLhl_tendangnhap() {
        return lhl_tendangnhap;
    }

    public void setLhl_tendangnhap(String lhl_tendangnhap) {
        this.lhl_tendangnhap = lhl_tendangnhap;
    }

    public String getLhl_matkhau() {
        return lhl_matkhau;
    }

    public void setLhl_matkhau(String lhl_matkhau) {
        this.lhl_matkhau = lhl_matkhau;
    }

    public String getLhl_email() {
        return lhl_email;
    }

    public void setLhl_email(String lhl_email) {
        this.lhl_email = lhl_email;
    }

    public String getLhl_vaitro() {
        return lhl_vaitro;
    }

    public void setLhl_vaitro(String lhl_vaitro) {
        this.lhl_vaitro = lhl_vaitro;
    }

}
