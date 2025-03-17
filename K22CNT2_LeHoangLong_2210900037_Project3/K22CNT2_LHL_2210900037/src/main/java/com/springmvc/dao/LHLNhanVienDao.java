package com.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.springmvc.beans.LHLNhanVien;

public class LHLNhanVienDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Thêm nhân viên
    public int save(LHLNhanVien nv) {
        String sql = "INSERT INTO lhl_nhanvien (lhl_hoten, lhl_sodienthoai, lhl_chucvu) VALUES (?, ?, ?)";
        return template.update(sql, nv.getLhl_hoten(), nv.getLhl_sodienthoai(), nv.getLhl_chucvu());
    }

    // Cập nhật nhân viên
    public int update(LHLNhanVien nv) {
        String sql = "UPDATE lhl_nhanvien SET lhl_hoten = ?, lhl_sodienthoai = ?, lhl_chucvu = ? WHERE lhl_manv = ?";
        return template.update(sql, nv.getLhl_hoten(), nv.getLhl_sodienthoai(), nv.getLhl_chucvu(), nv.getLhl_manv());
    }

    // Xóa nhân viên
    public int delete(int id) {
        String sql = "DELETE FROM lhl_nhanvien WHERE lhl_manv=?";
        return template.update(sql, id);
    }

    // Lấy danh sách nhân viên
    public List<LHLNhanVien> getAllNhanVien() {
        return template.query("SELECT * FROM lhl_nhanvien", new RowMapper<LHLNhanVien>() {
            public LHLNhanVien mapRow(ResultSet rs, int rowNum) throws SQLException {
                LHLNhanVien nv = new LHLNhanVien();
                nv.setLhl_manv(rs.getInt("lhl_manv"));
                nv.setLhl_hoten(rs.getString("lhl_hoten"));
                nv.setLhl_sodienthoai(rs.getString("lhl_sodienthoai"));
                nv.setLhl_chucvu(rs.getString("lhl_chucvu"));
                return nv;
            }
        });
    }

    // Lấy nhân viên theo ID
    public LHLNhanVien getNhanVienById(int id) {
        String sql = "SELECT * FROM lhl_nhanvien WHERE lhl_manv=?";
        return template.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(LHLNhanVien.class));
    }
}
