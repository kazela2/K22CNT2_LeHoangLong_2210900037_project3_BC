package com.springmvc.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.springmvc.beans.LHLDanhGia;
import com.springmvc.beans.LHLKhachHang;
import com.springmvc.beans.LHLSanPham;
import com.springmvc.dao.LHLDanhGiaDao;
import com.springmvc.dao.LHLKhachHangDao;
import com.springmvc.dao.LHLSanPhamDao;

@Controller
public class LHLDanhGiaController {

    @Autowired
    LHLDanhGiaDao danhGiaDao;

    @Autowired
    LHLSanPhamDao sanPhamDao; 

    @Autowired
    LHLKhachHangDao khachHangDao;
    
    // Hiển thị danh sách bảo hành
    @RequestMapping("/DanhGia/list")
    public String viewDanhGiaList(Model model) {
        List<LHLDanhGia> danhGias = danhGiaDao.getAllDanhGia();
        model.addAttribute("list",  danhGias);
        List<LHLSanPham> sanPhams = sanPhamDao.getAllSanPham();  
        model.addAttribute("sanPhams", sanPhams); 
        List<LHLKhachHang> khachHangs = khachHangDao.getAllKhachHang();  
        model.addAttribute("khachHangs", khachHangs); 
        return "DanhGia/list"; // Trả về view BaoHanh/list.jsp
    }

    // Form thêm bảo hành
    @RequestMapping("/DanhGia/add")
    public String showAddForm(Model model) {
        model.addAttribute("command", new LHLDanhGia());
        List<LHLSanPham> sanPhams = sanPhamDao.getAllSanPham();  
        model.addAttribute("sanPhams", sanPhams);  
        List<LHLKhachHang> khachHangs = khachHangDao.getAllKhachHang();  
        model.addAttribute("khachHangs", khachHangs);  
        return "DanhGia/add"; // Trả về view BaoHanh/add.jsp
    }

    // Lưu bảo hành mới
    @RequestMapping(value = "/DanhGia/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("command") LHLDanhGia danhgia) {
    	danhGiaDao.save(danhgia);
        return "redirect:/DanhGia/list"; // Redirect đến danh sách bảo hành
    }

    // Form chỉnh sửa bảo hành
    @RequestMapping("/DanhGia/edit/{id}")
    public String edit(@PathVariable int id, Model model) {
    	LHLDanhGia danhgia = danhGiaDao.getDanhGiaById(id);
        model.addAttribute("command", danhgia);
        List<LHLSanPham> sanPhams = sanPhamDao.getAllSanPham();  
        model.addAttribute("sanPhams", sanPhams); 
        List<LHLKhachHang> khachHangs = khachHangDao.getAllKhachHang();  
        model.addAttribute("khachHangs", khachHangs); 
        return "DanhGia/edit"; // Trả về view BaoHanh/edit.jsp
    }

    // Lưu chỉnh sửa bảo hành
    @RequestMapping(value = "/DanhGia/editsave", method = RequestMethod.POST)
    public String editsave(@ModelAttribute("command") LHLDanhGia danhgia) {
    	danhGiaDao.update(danhgia);
        return "redirect:/DanhGia/list"; // Redirect đến danh sách bảo hành
    }

    // Xóa bảo hành
    @RequestMapping("/DanhGia/delete/{id}")
    public String delete(@PathVariable int id) {
    	danhGiaDao.delete(id);
        return "redirect:/DanhGia/list"; // Redirect đến danh sách bảo hành
    }
    
}
