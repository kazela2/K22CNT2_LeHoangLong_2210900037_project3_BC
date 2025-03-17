package com.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.springmvc.beans.LHLBaoHanh;

public class LHLBaoHanhDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Thêm bảo hành
    public int save(LHLBaoHanh baoHanh) {
        String sql = "INSERT INTO lhl_baohanh (lhl_masp, lhl_ngaybatdau, lhl_ngayketthuc, lhl_trangthai) VALUES (?, ?, ?, ?)";
        return template.update(sql, baoHanh.getLhl_masp(), baoHanh.getLhl_ngaybatdau(), baoHanh.getLhl_ngayketthuc(), baoHanh.getLhl_trangthai());
    }

    // Cập nhật bảo hành
    public int update(LHLBaoHanh baoHanh) {
        String sql = "UPDATE lhl_baohanh SET lhl_masp = ?, lhl_ngaybatdau = ?, lhl_ngayketthuc = ?, lhl_trangthai = ? WHERE lhl_mabaohanh = ?";
        return template.update(sql,baoHanh.getLhl_masp(), baoHanh.getLhl_ngaybatdau(), baoHanh.getLhl_ngayketthuc(), baoHanh.getLhl_trangthai(), baoHanh.getLhl_mabaohanh());
    }

    // Xóa bảo hành
    public int delete(int id) {
        String sql = "DELETE FROM lhl_baohanh WHERE lhl_mabaohanh = ?";
        return template.update(sql, id);
    }

    // Lấy danh sách bảo hành
    public List<LHLBaoHanh> getAllBaoHanh() {
        return template.query("SELECT * FROM lhl_baohanh", new RowMapper<LHLBaoHanh>() {
            public LHLBaoHanh mapRow(ResultSet rs, int rowNum) throws SQLException {
                LHLBaoHanh baoHanh = new LHLBaoHanh();
                baoHanh.setLhl_mabaohanh(rs.getInt("lhl_mabaohanh"));
                baoHanh.setLhl_masp(rs.getInt("lhl_masp"));
                baoHanh.setLhl_ngaybatdau(rs.getDate("lhl_ngaybatdau"));
                baoHanh.setLhl_ngayketthuc(rs.getDate("lhl_ngayketthuc"));
                baoHanh.setLhl_trangthai(rs.getString("lhl_trangthai"));
                return baoHanh;
            }
        });
    }

    // Lấy bảo hành theo ID
    public LHLBaoHanh getBaoHanhById(int id) {
        String sql = "SELECT * FROM lhl_baohanh WHERE lhl_mabaohanh = ?";
        return template.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(LHLBaoHanh.class));
    }
}
