package com.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.springmvc.beans.LHLSanPham;

public class LHLSanPhamDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Thêm sản phẩm
    public int save(LHLSanPham sp) {
        String sql = "INSERT INTO lhl_sanpham (lhl_tensp, lhl_danhmuc, lhl_mota, lhl_gia, lhl_hinhanh) VALUES (?, ?, ?, ?, ?)";
        return template.update(sql, sp.getLhl_tensp(), sp.getLhl_danhmuc(), sp.getLhl_mota(), sp.getLhl_gia(), sp.getLhl_hinhanh());
    }

    // Cập nhật sản phẩm
    public int update(LHLSanPham sp) {
        String sql = "UPDATE lhl_sanpham SET "
                + "lhl_tensp = ?, "
                + "lhl_danhmuc = ?, "
                + "lhl_mota = ?, "
                + "lhl_gia = ?, "
                + "lhl_hinhanh = ? "
                + "WHERE lhl_masp = ?";

        return template.update(sql, sp.getLhl_tensp(), sp.getLhl_danhmuc(), sp.getLhl_mota(), sp.getLhl_gia(), sp.getLhl_hinhanh(), sp.getLhl_masp());
    }

    // Xóa sản phẩm
    public int delete(int id) {
        String sql = "DELETE FROM lhl_sanpham WHERE lhl_masp=?";
        return template.update(sql, id);
    }

    // Lấy danh sách sản phẩm
    public List<LHLSanPham> getAllSanPham() {
        return template.query("SELECT * FROM lhl_sanpham", new RowMapper<LHLSanPham>() {
            public LHLSanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
                LHLSanPham sp = new LHLSanPham();
                sp.setLhl_masp(rs.getInt("lhl_masp"));
                sp.setLhl_tensp(rs.getString("lhl_tensp"));
                sp.setLhl_danhmuc(rs.getString("lhl_danhmuc"));
                sp.setLhl_mota(rs.getString("lhl_mota"));
                sp.setLhl_gia(rs.getInt("lhl_gia"));
                sp.setLhl_hinhanh(rs.getString("lhl_hinhanh")); // ánh xạ hình ảnh
                return sp;
            }
        });
    }

    // Lấy sản phẩm theo ID
    public LHLSanPham getSanPhamById(int id) {
        String sql = "SELECT * FROM lhl_sanpham WHERE lhl_masp=?";
        return template.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<>(LHLSanPham.class));
    }
}
