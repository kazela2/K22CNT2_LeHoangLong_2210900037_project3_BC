package com.springmvc.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.springmvc.beans.LHLTaiKhoan;
import com.springmvc.dao.LHLTaiKhoanDao;

@Controller
public class LHLTaiKhoanController {

    @Autowired
    LHLTaiKhoanDao dao;

    // Hiển thị danh sách tài khoản
    @RequestMapping("/TaiKhoan/list")
    public String viewTaiKhoanList(Model m) {
        List<LHLTaiKhoan> list = dao.getAllTaiKhoan();
        m.addAttribute("list", list);
        return "TaiKhoan/list";
    }

    // Hiển thị form thêm tài khoản
    @RequestMapping("/TaiKhoan/add")
    public String showAddForm(Model m) {
        m.addAttribute("command", new LHLTaiKhoan());
        return "TaiKhoan/add";
    }

    // Lưu tài khoản mới (mặc định vai trò KHACHHANG)
    @RequestMapping(value = "/TaiKhoan/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("tk") LHLTaiKhoan tk) {
        dao.save(tk);
        return "redirect:/TaiKhoan/list";
    }

    // Hiển thị form chỉnh sửa tài khoản
    @RequestMapping("/TaiKhoan/edit/{id}")
    public String edit(@PathVariable int id, Model m) {
        LHLTaiKhoan tk = dao.getTaiKhoanById(id);
        m.addAttribute("command", tk);
        return "TaiKhoan/edit";
    }

    // Cập nhật tài khoản
    @RequestMapping(value = "/TaiKhoan/editsave", method = RequestMethod.POST)
    public String editsave(@ModelAttribute("tk") LHLTaiKhoan tk) {
        dao.update(tk);
        return "redirect:/TaiKhoan/list";
    }

    // Xóa tài khoản
    @RequestMapping("/TaiKhoan/delete/{id}")
    public String delete(@PathVariable int id) {
        dao.delete(id);
        return "redirect:/TaiKhoan/list";
    }
}
