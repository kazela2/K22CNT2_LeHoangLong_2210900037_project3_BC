package com.springmvc.beans;

public class LHLGioHang {
    private int lhl_magiohang;  // Mã giỏ hàng, khóa chính
    private int lhl_makh;       // Mã khách hàng, khóa ngoại
    private int lhl_masp;       // Mã sản phẩm, khóa ngoại
    private int lhl_soluong;    // Số lượng sản phẩm

    // Constructor đầy đủ tham số
    public LHLGioHang(int lhl_magiohang, int lhl_makh, int lhl_masp, int lhl_soluong) {
        this.lhl_magiohang = lhl_magiohang;
        this.lhl_makh = lhl_makh;
        this.lhl_masp = lhl_masp;
        this.lhl_soluong = lhl_soluong;
    }

    // Constructor mặc định
    public LHLGioHang() {
        this.lhl_soluong = 1;  // Giá trị mặc định cho số lượng
    }

    // Getter và Setter
    public int getLhl_magiohang() {
        return lhl_magiohang;
    }

    public void setLhl_magiohang(int lhl_magiohang) {
        this.lhl_magiohang = lhl_magiohang;
    }

    public int getLhl_makh() {
        return lhl_makh;
    }

    public void setLhl_makh(int lhl_makh) {
        this.lhl_makh = lhl_makh;
    }

    public int getLhl_masp() {
        return lhl_masp;
    }

    public void setLhl_masp(int lhl_masp) {
        this.lhl_masp = lhl_masp;
    }

    public int getLhl_soluong() {
        return lhl_soluong;
    }

    public void setLhl_soluong(int lhl_soluong) {
        this.lhl_soluong = lhl_soluong;
    }
}
