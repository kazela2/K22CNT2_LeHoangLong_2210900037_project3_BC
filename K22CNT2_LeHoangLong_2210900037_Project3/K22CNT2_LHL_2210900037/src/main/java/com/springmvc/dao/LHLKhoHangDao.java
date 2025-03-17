package com.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import com.springmvc.beans.LHLKhoHang;

public class LHLKhoHangDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Thêm kho hàng
    public int save(LHLKhoHang khoHang) {
        String sql = "INSERT INTO lhl_khohang (lhl_masp, lhl_soluongton, lhl_ngaynhap) VALUES (?, ?, ?)";
        return template.update(sql, khoHang.getLhl_masp(), khoHang.getLhl_soluongton(), khoHang.getLhl_ngaynhap());
    }

    // Cập nhật kho hàng
    public int update(LHLKhoHang khoHang) {
        String sql = "UPDATE lhl_khohang SET lhl_masp = ?, lhl_soluongton = ?, lhl_ngaynhap = ? WHERE lhl_makho = ?";
        return template.update(sql,khoHang.getLhl_masp(), khoHang.getLhl_soluongton(), khoHang.getLhl_ngaynhap(), khoHang.getLhl_makho());
    }

    // Xóa kho hàng
    public int delete(int id) {
        String sql = "DELETE FROM lhl_khohang WHERE lhl_makho = ?";
        return template.update(sql, id);
    }

    // Lấy danh sách kho hàng
    public List<LHLKhoHang> getAllKhoHang() {
        return template.query("SELECT * FROM lhl_khohang", new RowMapper<LHLKhoHang>() {
            public LHLKhoHang mapRow(ResultSet rs, int rowNum) throws SQLException {
                LHLKhoHang khoHang = new LHLKhoHang();
                khoHang.setLhl_makho(rs.getInt("lhl_makho"));
                khoHang.setLhl_masp(rs.getInt("lhl_masp"));
                khoHang.setLhl_soluongton(rs.getInt("lhl_soluongton"));
                khoHang.setLhl_ngaynhap(rs.getDate("lhl_ngaynhap"));
                return khoHang;
            }
        });
    }

    // Lấy kho hàng theo ID
    public LHLKhoHang getKhoHangById(int id) {
        String sql = "SELECT * FROM lhl_khohang WHERE lhl_makho = ?";
        return template.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(LHLKhoHang.class));
    }
}
