package com.springmvc.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.beans.LHLNhanVien;
import com.springmvc.dao.LHLNhanVienDao;

@Controller
public class LHLNhanVienController {

    @Autowired
    LHLNhanVienDao dao;

    // Hiển thị danh sách nhân viên
    @RequestMapping("/NhanVien/list")
    public String viewNhanVienList(Model m) {
        List<LHLNhanVien> list = dao.getAllNhanVien();
        m.addAttribute("list", list);
        return "NhanVien/list";
    }

    // Form thêm nhân viên
    @RequestMapping("/NhanVien/add")
    public String showAddForm(Model m) {
        m.addAttribute("command", new LHLNhanVien());
        return "NhanVien/add"; // Trả về view NhanVien/add.jsp
    }

    // Lưu nhân viên mới
    @RequestMapping(value = "/NhanVien/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("nv") LHLNhanVien nv) {
        dao.save(nv);
        return "redirect:/NhanVien/list"; // Redirect đến danh sách nhân viên
    }

    // Form chỉnh sửa nhân viên
    @RequestMapping("/NhanVien/edit/{id}")
    public String edit(@PathVariable int id, Model m) {
        LHLNhanVien nv = dao.getNhanVienById(id);
        m.addAttribute("command", nv);
        return "NhanVien/edit"; // Trả về view NhanVien/edit.jsp
    }

    // Lưu chỉnh sửa nhân viên
    @RequestMapping(value = "/NhanVien/editsave", method = RequestMethod.POST)
    public String editsave(@ModelAttribute("nv") LHLNhanVien nv) {
        dao.update(nv);
        return "redirect:/NhanVien/list"; // Redirect đến danh sách nhân viên
    }

    // Xóa nhân viên
    @RequestMapping("/NhanVien/delete/{id}") 
    public String delete(@PathVariable int id) {
        dao.delete(id);
        return "redirect:/NhanVien/list"; // Redirect đến danh sách nhân viên
    }
}
