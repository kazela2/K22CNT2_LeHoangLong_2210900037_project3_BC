package com.springmvc.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springmvc.beans.LHLGioHang;
import com.springmvc.beans.LHLSanPham;
import com.springmvc.dao.LHLGioHangDao;
import com.springmvc.dao.LHLSanPhamDao;


@Controller
public class LHLGioHangController {

    @Autowired
    private LHLGioHangDao gioHangDao;

    @Autowired
    private LHLSanPhamDao sanPhamDao;

    // Hiển thị danh sách giỏ hàng theo khách hàng
    @RequestMapping("/giohang")
    public String viewGioHangList(Model model, HttpSession session) {
        Integer makh = (Integer) session.getAttribute("lhl_makh");
        if (makh == null) {
            return "redirect:/login"; // Nếu chưa đăng nhập, chuyển đến trang đăng nhập
        }
        List<LHLGioHang> gioHangs = gioHangDao.getGioHangByMaKH(makh);
        model.addAttribute("list", gioHangs);
        List<LHLSanPham> sanPhams = sanPhamDao.getAllSanPham();
        model.addAttribute("sanPhams", sanPhams);
        return "giohang";
    }

    @RequestMapping("/giohang/add/{masp}")
    public String addToCart(@PathVariable int masp, HttpSession session) {
        Integer makh = (Integer) session.getAttribute("lhl_makh");

        // Debug: In ra console xem session có giá trị không
        System.out.println("Session lhl_makh: " + makh);

        if (makh == null) {
            return "redirect:/login"; // Nếu chưa đăng nhập, chuyển đến trang đăng nhập
        }

        LHLGioHang gioHang = gioHangDao.getGioHangByMaKHAndMaSP(makh, masp);
        if (gioHang != null) {
            gioHang.setLhl_soluong(gioHang.getLhl_soluong() + 1);
            gioHangDao.update(gioHang);	
        } else {
            gioHang = new LHLGioHang();
            gioHang.setLhl_makh(makh);
            gioHang.setLhl_masp(masp);
            gioHang.setLhl_soluong(1);
            gioHangDao.save(gioHang);
        }
        return "redirect:/giohang";
    }
    
    @RequestMapping("/thanhtoan")
    public String checkout(HttpSession session, Model model) {
        Integer makh = (Integer) session.getAttribute("lhl_makh");
        if (makh == null) {
            return "redirect:/login"; // Nếu chưa đăng nhập, chuyển đến trang đăng nhập
        }

        // Lấy giỏ hàng của khách hàng
        List<LHLGioHang> gioHangs = gioHangDao.getGioHangByMaKH(makh);
        if (gioHangs != null && !gioHangs.isEmpty()) {
            // Xử lý thanh toán (ví dụ: lưu thông tin thanh toán vào cơ sở dữ liệu)

            // Sau khi thanh toán thành công, xóa tất cả sản phẩm trong giỏ hàng
        	gioHangDao.deleteByMaKH(makh, makh); // Cung cấp đầy đủ tham số

            // Thêm thông báo thành công vào model
            model.addAttribute("message", "Thanh toán thành công! Giỏ hàng của bạn đã được thanh toán.");
        } else {
            // Nếu giỏ hàng trống
            model.addAttribute("message", "Giỏ hàng của bạn trống. Vui lòng thêm sản phẩm vào giỏ hàng.");
        }

        return "giohang"; // Quay lại trang giỏ hàng (hoặc trang khác nếu bạn muốn)
    }




    // Xóa sản phẩm khỏi giỏ hàng (chỉ xóa của khách hàng hiện tại)
    @RequestMapping("/giohang/delete/{magiohang}")
    public String deleteFromCart(@PathVariable int magiohang, HttpSession session) {
        Integer makh = (Integer) session.getAttribute("lhl_makh");
        if (makh == null) {
            return "redirect:/login"; // Nếu chưa đăng nhập, chuyển đến trang đăng nhập
        }
        gioHangDao.deleteByMaKH(makh, magiohang);
        return "redirect:/giohang";
    }
}
