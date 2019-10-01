package cn.lhj.ICTExam.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import cn.lhj.ICTExam.admin.model.Admin;
import cn.lhj.ICTExam.admin.service.AdminService;
import cn.lhj.ICTExam.menu.service.MenuService;
import cn.lhj.ICTExam.menu.vm.MenuVM;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	private MenuService menuServ;

	@Autowired
	private AdminService adminServ;
	
	@RequestMapping("/toIndex")
	public String toIndex(Model model,HttpServletRequest request) throws Exception{
		List<MenuVM> menus=menuServ.getAllMenuVM();
		model.addAttribute("menus",menus);
		HttpSession session=request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
		if(admin==null) {
			session.invalidate();
			return "redirect:/login/toLogin";
		}
        model.addAttribute("admin",admin);
		return "admin/admin";
	}
	
	//跳转到欢迎页
	@RequestMapping("/toWelcome")
	public String toWelcome(@RequestParam("name") String name,Model model)throws Exception{
		model.addAttribute("name", name);
		return "admin/welcome";
	}



}
