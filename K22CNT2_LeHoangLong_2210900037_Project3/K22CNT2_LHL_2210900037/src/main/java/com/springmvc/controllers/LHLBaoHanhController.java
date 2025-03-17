package com.springmvc.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.beans.LHLBaoHanh;
import com.springmvc.beans.LHLSanPham;
import com.springmvc.dao.LHLBaoHanhDao;
import com.springmvc.dao.LHLSanPhamDao;

@Controller
public class LHLBaoHanhController {

    @Autowired
    LHLBaoHanhDao baoHanhDao;

    @Autowired
    LHLSanPhamDao sanPhamDao; 

    // Hiển thị danh sách bảo hành
    @RequestMapping("/BaoHanh/list")
    public String viewBaoHanhList(Model model) {
        List<LHLBaoHanh> baoHanhs = baoHanhDao.getAllBaoHanh();
        model.addAttribute("list", baoHanhs);
        List<LHLSanPham> sanPhams = sanPhamDao.getAllSanPham();  
        model.addAttribute("sanPhams", sanPhams); 
        return "BaoHanh/list"; // Trả về view BaoHanh/list.jsp
    }

    // Form thêm bảo hành
    @RequestMapping("/BaoHanh/add")
    public String showAddForm(Model model) {
        model.addAttribute("command", new LHLBaoHanh());
        List<LHLSanPham> sanPhams = sanPhamDao.getAllSanPham();  
        model.addAttribute("sanPhams", sanPhams);  
        return "BaoHanh/add"; // Trả về view BaoHanh/add.jsp
    }

    // Lưu bảo hành mới
    @RequestMapping(value = "/BaoHanh/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("command") LHLBaoHanh baoHanh) {
        baoHanhDao.save(baoHanh);
        return "redirect:/BaoHanh/list"; // Redirect đến danh sách bảo hành
    }

    // Form chỉnh sửa bảo hành
    @RequestMapping("/BaoHanh/edit/{id}")
    public String edit(@PathVariable int id, Model model) {
        LHLBaoHanh baoHanh = baoHanhDao.getBaoHanhById(id);
        model.addAttribute("command", baoHanh);
        List<LHLSanPham> sanPhams = sanPhamDao.getAllSanPham();  
        model.addAttribute("sanPhams", sanPhams); 
        return "BaoHanh/edit"; // Trả về view BaoHanh/edit.jsp
    }

    // Lưu chỉnh sửa bảo hành
    @RequestMapping(value = "/BaoHanh/editsave", method = RequestMethod.POST)
    public String editsave(@ModelAttribute("command") LHLBaoHanh baoHanh) {
        baoHanhDao.update(baoHanh);
        return "redirect:/BaoHanh/list"; // Redirect đến danh sách bảo hành
    }

    // Xóa bảo hành
    @RequestMapping("/BaoHanh/delete/{id}")
    public String delete(@PathVariable int id) {
        baoHanhDao.delete(id);
        return "redirect:/BaoHanh/list"; // Redirect đến danh sách bảo hành
    }
}
