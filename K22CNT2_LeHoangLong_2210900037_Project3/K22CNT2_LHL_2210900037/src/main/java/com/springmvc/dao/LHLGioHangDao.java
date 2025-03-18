package com.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.springmvc.beans.LHLGioHang;

public class LHLGioHangDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Lấy giỏ hàng theo mã khách hàng
    public List<LHLGioHang> getGioHangByMaKH(int makh) {
        String sql = "SELECT * FROM lhl_giohang WHERE lhl_makh = ?";
        return template.query(sql, new Object[]{makh}, new RowMapper<LHLGioHang>() {
            public LHLGioHang mapRow(ResultSet rs, int rowNum) throws SQLException {
                LHLGioHang gh = new LHLGioHang();
                gh.setLhl_magiohang(rs.getInt("lhl_magiohang"));
                gh.setLhl_makh(rs.getInt("lhl_makh"));
                gh.setLhl_masp(rs.getInt("lhl_masp"));
                gh.setLhl_soluong(rs.getInt("lhl_soluong"));
                return gh;
            }
        });
    }

    // Lấy sản phẩm trong giỏ hàng theo khách hàng & sản phẩm
    public LHLGioHang getGioHangByMaKHAndMaSP(int makh, int masp) {
        String sql = "SELECT * FROM lhl_giohang WHERE lhl_makh = ? AND lhl_masp = ?";
        List<LHLGioHang> result = template.query(sql, new Object[]{makh, masp}, new RowMapper<LHLGioHang>() {
            public LHLGioHang mapRow(ResultSet rs, int rowNum) throws SQLException {
                LHLGioHang gh = new LHLGioHang();
                gh.setLhl_magiohang(rs.getInt("lhl_magiohang"));
                gh.setLhl_makh(rs.getInt("lhl_makh"));
                gh.setLhl_masp(rs.getInt("lhl_masp"));
                gh.setLhl_soluong(rs.getInt("lhl_soluong"));
                return gh;
            }
        });
        return result.isEmpty() ? null : result.get(0);
    }

    // Thêm sản phẩm vào giỏ hàng
    public int save(LHLGioHang gh) {
        String sql = "INSERT INTO lhl_giohang (lhl_makh, lhl_masp, lhl_soluong) VALUES (?, ?, ?)";
        return template.update(sql, gh.getLhl_makh(), gh.getLhl_masp(), gh.getLhl_soluong());
    }

    // Cập nhật số lượng sản phẩm trong giỏ hàng
    public int update(LHLGioHang gh) {
        String sql = "UPDATE lhl_giohang SET lhl_soluong = ? WHERE lhl_magiohang = ?";
        return template.update(sql, gh.getLhl_soluong(), gh.getLhl_magiohang());
    }

    // Xóa sản phẩm khỏi giỏ hàng theo mã khách hàng
    public int deleteByMaKH(int makh, int magiohang) {
        String sql = "DELETE FROM lhl_giohang WHERE lhl_makh = ? AND lhl_magiohang = ?";
        return template.update(sql, makh, magiohang);
    }
}
