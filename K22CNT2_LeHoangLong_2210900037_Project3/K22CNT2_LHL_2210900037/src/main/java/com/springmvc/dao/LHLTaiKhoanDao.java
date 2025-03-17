package com.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import com.springmvc.beans.LHLTaiKhoan;

public class LHLTaiKhoanDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

 // Thêm tài khoản mới (Vai trò được chọn từ form)
    public int save(LHLTaiKhoan tk) {
        String sql = "INSERT INTO lhl_taikhoan (lhl_tendangnhap, lhl_matkhau, lhl_email, lhl_vaitro) VALUES (?, ?, ?, ?)";
        return template.update(sql, tk.getLhl_tendangnhap(), tk.getLhl_matkhau(), tk.getLhl_email(), tk.getLhl_vaitro());
    }

    // Cập nhật tài khoản
    public int update(LHLTaiKhoan tk) {
        String sql = "UPDATE lhl_taikhoan SET "
                + "lhl_matkhau = ?, "
                + "lhl_email = ?, "
                + "lhl_vaitro = ? "
                + "WHERE lhl_matk = ?";
        return template.update(sql, tk.getLhl_matkhau(), tk.getLhl_email(), tk.getLhl_vaitro(), tk.getLhl_matk());
    }

    // Xóa tài khoản
    public int delete(int matk) {
        String sql = "DELETE FROM lhl_taikhoan WHERE lhl_matk=?";
        return template.update(sql, matk);
    }

    // Lấy danh sách tài khoản
    public List<LHLTaiKhoan> getAllTaiKhoan() {
        return template.query("SELECT * FROM lhl_taikhoan", new RowMapper<LHLTaiKhoan>() {
            public LHLTaiKhoan mapRow(ResultSet rs, int rowNum) throws SQLException {
                LHLTaiKhoan tk = new LHLTaiKhoan();
                tk.setLhl_matk(rs.getInt("lhl_matk"));
                tk.setLhl_tendangnhap(rs.getString("lhl_tendangnhap"));
                tk.setLhl_matkhau(rs.getString("lhl_matkhau"));
                tk.setLhl_email(rs.getString("lhl_email"));
                tk.setLhl_vaitro(rs.getString("lhl_vaitro")); 
                return tk;
            }
        });
    }

    // Lấy tài khoản theo ID
    public LHLTaiKhoan getTaiKhoanById(int matk) {
        String sql = "SELECT * FROM lhl_taikhoan WHERE lhl_matk=?";
        return template.queryForObject(sql, new Object[]{matk}, new BeanPropertyRowMapper<>(LHLTaiKhoan.class));
    }

    public LHLTaiKhoan getTaiKhoanByTenDangNhap(String tendangnhap) {
        String sql = "SELECT * FROM lhl_taikhoan WHERE lhl_tendangnhap = ?";
        try {
            return template.queryForObject(sql, new Object[]{tendangnhap}, new BeanPropertyRowMapper<>(LHLTaiKhoan.class));
        } catch (Exception e) {
            return null; // Nếu không tìm thấy tài khoản thì trả về null
        }
    }
    
 // Kiểm tra tên đăng nhập đã tồn tại chưa
    public boolean isUsernameExist(String tendangnhap) {
        String sql = "SELECT COUNT(*) FROM lhl_taikhoan WHERE lhl_tendangnhap = ?";
        int count = template.queryForObject(sql, new Object[]{tendangnhap}, Integer.class);
        return count > 0; // Nếu count > 0, nghĩa là tên đăng nhập đã tồn tại
    }


}
