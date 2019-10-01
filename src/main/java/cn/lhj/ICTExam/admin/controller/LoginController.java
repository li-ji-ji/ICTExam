package cn.lhj.ICTExam.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.lhj.ICTExam.admin.model.Admin;
import cn.lhj.ICTExam.admin.service.AdminService;
import cn.lhj.ICTExam.user.model.User;
import cn.lhj.ICTExam.user.service.UserService;

import org.springframework.ui.Model;

@RequestMapping("/login")
@Controller
public class LoginController {
	
	@Autowired
	private AdminService adminServ;
	
	@Autowired
	private UserService userServ;
	
	//跳转登录页
	@RequestMapping("/toLogin")
	public String toLogin()throws Exception{
		return "admin/login";
	}
	
	//管理员登录密码验证
	@RequestMapping("/adminCheck")
	public String adminCheck(Admin admin,HttpServletRequest request ,HttpServletResponse response,Model model)throws Exception{
		HttpSession session=request.getSession();
		System.out.println(admin.toString());
		Admin getAdmin=new Admin();
		getAdmin=adminServ.checkAdmin(admin);
		if(getAdmin!=null) {
            session.setAttribute("admin", getAdmin);
            //设置session时效
            session.setMaxInactiveInterval(30*60);
    		return "redirect:/admin/toIndex";
		}else {
			return "redirect:/login/toLogin";
		}
	}
	//用户登录密码验证
	@RequestMapping("/userCheck")
	public String userCheck(User user,HttpServletRequest request ,HttpServletResponse response,Model model)throws Exception{
		HttpSession session=request.getSession();
		System.out.println(user.toString());
		User getUser=new User();
		getUser=userServ.checkUser(user);
		if(getUser!=null) {
            session.setAttribute("user", getUser);
            //设置session时效
            session.setMaxInactiveInterval(30*60);
    		return "redirect:/user/toExam";
		}else {
			return "redirect:/login/toStuLogin";
		}
	}
	//退出登录
	@RequestMapping("/toLogout")
	public String toLogout(HttpServletRequest request)throws Exception{
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:/login/toLogin";
	}
	
	//跳转用户登录页
	@RequestMapping("/toStuLogin")
	public String toStuLogin(HttpServletRequest request,HttpServletResponse response,Model model)throws Exception{
		return "user/login";
	}
}
