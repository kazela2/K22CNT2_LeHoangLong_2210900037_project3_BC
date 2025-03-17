package com.springmvc.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.springmvc.beans.LHLKhoHang;
import com.springmvc.beans.LHLSanPham;
import com.springmvc.dao.LHLKhoHangDao;
import com.springmvc.dao.LHLSanPhamDao;


@Controller
public class LHLKhoHangController {

    @Autowired
    LHLKhoHangDao khoHangDao;

    @Autowired
    LHLSanPhamDao sanPhamDao; 
 

    // Hiển thị danh sách kho hàng
    @RequestMapping("/KhoHang/list")
    public String viewKhoHangList(Model model) {
        List<LHLKhoHang> khoHangs = khoHangDao.getAllKhoHang();
        model.addAttribute("list", khoHangs);
        List<LHLSanPham> sanPhams = sanPhamDao.getAllSanPham();  
        model.addAttribute("sanPhams", sanPhams); 
        return "KhoHang/list"; // Trả về view khohang/list.jsp
    }

    // Form thêm kho hàng
    @RequestMapping("/KhoHang/add")
    public String showAddForm(Model model) {
        model.addAttribute("command", new LHLKhoHang());
        List<LHLSanPham> sanPhams = sanPhamDao.getAllSanPham();  
        model.addAttribute("sanPhams", sanPhams);  
        
        return "KhoHang/add"; 
    }

    // Lưu kho hàng mới
    @RequestMapping(value = "/KhoHang/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("command") LHLKhoHang khoHang) {
        khoHangDao.save(khoHang);
        return "redirect:/KhoHang/list"; // Redirect đến danh sách kho hàng
    }

    // Form chỉnh sửa kho hàng
    @RequestMapping("/KhoHang/edit/{id}")
    public String edit(@PathVariable int id, Model model) {
        LHLKhoHang khoHang = khoHangDao.getKhoHangById(id);
        model.addAttribute("command", khoHang);
        List<LHLSanPham> sanPhams = sanPhamDao.getAllSanPham();  
        model.addAttribute("sanPhams", sanPhams); 
        return "KhoHang/edit"; // Trả về view khohang/edit.jsp
    }

    // Lưu chỉnh sửa kho hàng
    @RequestMapping(value = "/KhoHang/editsave", method = RequestMethod.POST)
    public String editsave(@ModelAttribute("command") LHLKhoHang khoHang) {
        khoHangDao.update(khoHang);
        return "redirect:/KhoHang/list"; // Redirect đến danh sách kho hàng
    }

    // Xóa kho hàng
    @RequestMapping("/KhoHang/delete/{id}")
    public String delete(@PathVariable int id) {
        khoHangDao.delete(id);
        return "redirect:/KhoHang/list"; // Redirect đến danh sách kho hàng
    }
}
