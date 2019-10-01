package cn.lhj.ICTExam.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

import cn.lhj.ICTExam.user.DTO.UserMsgAndExersList;
import cn.lhj.ICTExam.user.model.User;
import cn.lhj.ICTExam.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userServ;
	
	//跳转到用户列表
	@RequestMapping("/toTable")
	public String toTable() throws Exception{
		return "user/Table";
	}
	
	//跳转到用户添加 表单
	@RequestMapping("/toAdd")
	public String toAdd() throws Exception{
		return "user/Form";
	}
	
	//跳转到用户答题界面
	@RequestMapping("/toExam")
	public String toExam(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		HttpSession session=request.getSession();
		User getUser=(User) session.getAttribute("user");
		if(getUser!=null) {
            //设置session时效
			UserMsgAndExersList userMsg=userServ.getUserMsgAndExerListFromRedis(getUser.getStuId());
			String msgJSON=JSON.toJSONString(userMsg);
			session.setAttribute("userMsg", msgJSON);
            session.setMaxInactiveInterval(30*60);
            model.addAttribute("user",getUser);
    		return "user/exam";
		}else {
			return "redirect:/login/toStuLogin";
		}
	}
}
