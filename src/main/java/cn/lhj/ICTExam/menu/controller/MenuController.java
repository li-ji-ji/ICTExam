package cn.lhj.ICTExam.menu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.lhj.ICTExam.menu.model.Menu;
import cn.lhj.ICTExam.menu.service.MenuService;
import cn.lhj.ICTExam.menu.vm.MenuVM;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Autowired
	private MenuService menuServ;
	

	@RequestMapping("/toTable")
	public String toTable()throws Exception{
		return "menu/Table";
	}

	
	@RequestMapping("/toAdd")
	public String toAdd(Model model)throws Exception{
		List<Menu> menus=menuServ.getByPid(0);
		model.addAttribute("menus",menus);
		return "menu/Form";
	}

}
