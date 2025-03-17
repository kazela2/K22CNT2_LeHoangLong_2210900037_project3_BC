package com.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.springmvc.beans.LHLDanhGia;

public class LHLDanhGiaDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

  
    public int save(LHLDanhGia danhgia) {
        String sql = "INSERT INTO lhl_danhgia (lhl_masp, lhl_makh, lhl_danhgia, lhl_nhanxet) VALUES (?, ?, ?, ?)";
        return template.update(sql, danhgia.getLhl_masp(), danhgia.getLhl_makh(), danhgia.getLhl_danhgia(), danhgia.getLhl_nhanxet());
    }

 
    public int update(LHLDanhGia danhgia) {
        String sql = "UPDATE lhl_danhgia SET lhl_masp = ?, lhl_makh = ? , lhl_danhgia = ?, lhl_nhanxet = ? WHERE lhl_madanhgia = ?";
        return template.update(sql, danhgia.getLhl_masp(), danhgia.getLhl_makh(), danhgia.getLhl_danhgia(), danhgia.getLhl_nhanxet(), danhgia.getLhl_madanhgia());
    }

 
    public int delete(int id) {
        String sql = "DELETE FROM lhl_danhgia WHERE lhl_madanhgia = ?";
        return template.update(sql, id); 
    }


    public List<LHLDanhGia> getAllDanhGia() {
        return template.query("SELECT * FROM lhl_danhgia", new RowMapper<LHLDanhGia>() {
            public LHLDanhGia mapRow(ResultSet rs, int rowNum) throws SQLException {
            	LHLDanhGia danhgia = new LHLDanhGia();
            	danhgia.setLhl_madanhgia(rs.getInt("lhl_madanhgia"));
            	danhgia.setLhl_masp(rs.getInt("lhl_masp"));
                danhgia.setLhl_makh(rs.getInt("lhl_makh"));
                danhgia.setLhl_danhgia(rs.getInt("lhl_danhgia"));
                danhgia.setLhl_nhanxet(rs.getString("lhl_nhanxet"));
                return danhgia;
            }
        });
    }

 
    public LHLDanhGia getDanhGiaById(int id) {
        String sql = "SELECT * FROM lhl_danhgia WHERE lhl_madanhgia = ?";
        return template.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(LHLDanhGia.class));
    }
}
