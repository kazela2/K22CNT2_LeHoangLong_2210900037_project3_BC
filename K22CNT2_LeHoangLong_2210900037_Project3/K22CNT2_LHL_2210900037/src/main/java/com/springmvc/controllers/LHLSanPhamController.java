	package com.springmvc.controllers;
	
	import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.ModelAttribute;
	import org.springframework.web.bind.annotation.PathVariable;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.beans.LHLDanhGia;
import com.springmvc.beans.LHLKhachHang;
import com.springmvc.beans.LHLSanPham;
import com.springmvc.beans.LHLTaiKhoan;
import com.springmvc.dao.LHLDanhGiaDao;
import com.springmvc.dao.LHLKhachHangDao;
import com.springmvc.dao.LHLSanPhamDao;
import com.springmvc.dao.LHLTaiKhoanDao;
	
	@Controller
	public class LHLSanPhamController {
	
	    @Autowired
	    LHLSanPhamDao dao;
	    
	    @Autowired
	    LHLDanhGiaDao danhGiadao;
	    
	    @Autowired
	    LHLKhachHangDao khachHangDao;
	    
	    @Autowired
	    LHLTaiKhoanDao taiKhoanDao;
	
	    // Hiển thị danh sách sản phẩm (đã sửa URL)
	    @RequestMapping("/SanPham/list")
	    public String viewSanPhamList(Model m) {
	        List<LHLSanPham> list = dao.getAllSanPham();
	        m.addAttribute("list", list);
	        return "SanPham/list";
	    }
	
	    // Form thêm sản phẩm
	    @RequestMapping("/SanPham/add")
	    public String showAddForm(Model m) {
	        m.addAttribute("command", new LHLSanPham());
	        return "SanPham/add"; // Trả về view sanpham/add.jsp
	    }
	
	    // Lưu sản phẩm mới
	    @RequestMapping(value = "/SanPham/save", method = RequestMethod.POST)
	    public String save(@ModelAttribute("sp") LHLSanPham sp) {
	        dao.save(sp);
	        return "redirect:/SanPham/list"; // Redirect đến danh sách sản phẩm
	    }
	
	    // Form chỉnh sửa sản phẩm
	    @RequestMapping("/SanPham/edit/{id}")
	    public String edit(@PathVariable int id, Model m) {
	        LHLSanPham sp = dao.getSanPhamById(id);
	        m.addAttribute("command", sp);
	        return "SanPham/edit"; // Trả về view sanpham/edit.jsp
	    }
	
	    // Lưu chỉnh sửa
	    @RequestMapping(value = "/SanPham/editsave", method = RequestMethod.POST)
	    public String editsave(@ModelAttribute("sp") LHLSanPham sp) {
	        dao.update(sp);
	        return "redirect:/SanPham/list"; // Redirect đến danh sách sản phẩm
	    }
	
	    // Xóa sản phẩm
	    @RequestMapping("/SanPham/delete/{id}")
	    public String delete(@PathVariable int id) {
	        dao.delete(id);
	        return "redirect:/SanPham/list"; // Redirect đến danh sách sản phẩm
	    }
	
	    // Ánh xạ đến trang menu
	    @RequestMapping("/menu")
	    public String showMenu() {
	        return "menu"; 
	    }
	    @RequestMapping("/gioithieu")
	    public String showGioiThieu() {
	        return "gioithieu"; // Trả về view gioithieu.jsp
	    }
	    
	    @RequestMapping("/dichvu")
	    public String showDichVu(Model model) {
	        // Lấy danh sách sản phẩm
	        List<LHLSanPham> sanPhamList = dao.getAllSanPham();
	        // Lấy danh sách đánh giá
	        List<LHLDanhGia> danhgia = danhGiadao.getAllDanhGia();
	        // Lấy danh sách khách hàng
	        List<LHLKhachHang> khachHangs = khachHangDao.getAllKhachHang();

	        // Gửi dữ liệu sản phẩm, đánh giá, khách hàng đến JSP
	        model.addAttribute("sanPhamList", sanPhamList);
	        model.addAttribute("danhgia", danhgia);
	        model.addAttribute("khachHangs", khachHangs);
	        
	        return "dichvu"; 
	    }
	    @RequestMapping("/login")
	    public String showLogin() {
	        return "login";
	    }
	    
	    @RequestMapping(value = "/login", method = RequestMethod.POST)
	    public String login(@RequestParam("lhl_tendangnhap") String tendangnhap,
	                        @RequestParam("lhl_matkhau") String matkhau, 
	                        Model model,
	                        HttpSession session) {
	        
	        // Kiểm tra tài khoản trong cơ sở dữ liệu
	        LHLTaiKhoan tk = taiKhoanDao.getTaiKhoanByTenDangNhap(tendangnhap);

	        if (tk != null && tk.getLhl_matkhau().equals(matkhau)) {
	            // Lưu thông tin người dùng vào session
	            session.setAttribute("user", tk);
	            session.setAttribute("lhl_makh", tk.getLhl_matk()); // Lưu mã khách hàng vào session

	            // Kiểm tra vai trò của người dùng
	            if (tk.getLhl_vaitro().equals("ADMIN")) {
	                return "redirect:/menu";
	            } else if (tk.getLhl_vaitro().equals("KHACHHANG")) {
	                return "redirect:/index.jsp"; 
	            }
	        } else {
	            model.addAttribute("error", "Sai tên đăng nhập hoặc mật khẩu.");
	            return "login"; 
	        }

	        return "login";
	    }



	    @RequestMapping("/logout")
	    public String logout(HttpSession session) {
	        session.invalidate(); // Xóa thông tin khỏi session
	        return "redirect:/login"; // Chuyển hướng về trang login sau khi đăng xuất
	    }
	    
	    @RequestMapping("/dangki")
	    public String showRegister() {
	        return "dangki";
	    }

	    @RequestMapping(value = "/dangki", method = RequestMethod.POST)
	    public String register(@RequestParam("lhl_tendangnhap") String tendangnhap,
	                           @RequestParam("lhl_matkhau") String matkhau,
	                           @RequestParam("lhl_email") String email,
	                           Model model) {
	        
	        // Kiểm tra tên đăng nhập đã tồn tại
	        if (taiKhoanDao.isUsernameExist(tendangnhap)) {
	            model.addAttribute("error", "Tên đăng nhập đã tồn tại");
	            return "dangki"; // Trả về trang đăng ký nếu tên đăng nhập đã tồn tại
	        }

	        // Tạo đối tượng tài khoản mới
	        LHLTaiKhoan tk = new LHLTaiKhoan();
	        tk.setLhl_tendangnhap(tendangnhap);
	        tk.setLhl_matkhau(matkhau);
	        tk.setLhl_email(email);
	        
	        // Gán vai trò mặc định là KHACHHANG
	        tk.setLhl_vaitro("KHACHHANG");

	        // Lưu tài khoản vào cơ sở dữ liệu
	        taiKhoanDao.save(tk);

	        return "redirect:/login"; // Sau khi đăng ký thành công, chuyển hướng đến trang login
	    }


}
	
