package cn.lhj.ICTExam.user.API;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.lhj.ICTExam.user.DTO.UserMsgAndExersList;
import cn.lhj.ICTExam.user.model.User;
import cn.lhj.ICTExam.user.service.UserService;
import cn.lhj.ICTExam.util.LayUIJSON;
import io.swagger.annotations.Api;
import io.swagger.models.Model;

@RestController
@CrossOrigin
@Api
@RequestMapping("/userAPI")
public class UserAPI {

	@Autowired
	private UserService userServ;
	
	private String stuId; 
	
	//根据学生学号查询用户信息
	@RequestMapping("/getByStuId")
	public User getByStuId(@RequestParam("stuId")String stuId) throws Exception{
		return userServ.getByStuId(stuId);
	}
	
	//查询所有用户信息
	 @RequestMapping("/getAll")
	 public LayUIJSON<User> getAll()throws Exception{
		 LayUIJSON<User> msg=new LayUIJSON<>();
		 msg.setData(userServ.getAll());
		 msg.setCount(userServ.countAll());
		 msg.setCode(0);
		 return msg;
	 }
	 
	 //根据用户ID修改用户状态
	 @RequestMapping("/setStatusById")
	 public LayUIJSON<User> setStatusById(String stuId,Integer status)throws Exception{
		 return userServ.setOneStatusByStuId(stuId, status);
	 }
	 
	 //添加用户
	 @RequestMapping("/addOne")
	 public LayUIJSON<User> addOne(@RequestBody User user)throws Exception{
		 return userServ.addOne(user);
	 }
	 
	 //根据用户ID删除用户
	 @RequestMapping("/delByStuId")
	 public LayUIJSON<User> delOneByStuId(String stuId)throws Exception{
		 return userServ.delOne(stuId);
	 }
	 
	 //修改单个用户信息
	 @RequestMapping("/setOne")
	 public LayUIJSON<User> setOne(@RequestBody User user)throws Exception{
		 return userServ.setOne(user);
	 }
	 
	 //根据用户编号查询用户信息并获取题目
	 @RequestMapping("/getUserMsgAndExerListFromRedis")
	 public UserMsgAndExersList getUserMsgAndExerListFromRedis(HttpServletRequest request,HttpServletResponse response)throws Exception{
		 User getUser=getUserMsg(request, response);
		 return userServ.getUserMsgAndExerListFromRedis(getUser.getStuId());
	 }
	 
	 //从session中获取用户信息
	 public User getUserMsg(HttpServletRequest request,HttpServletResponse response)throws Exception{
		 HttpSession session=request.getSession();
		 User getUser=new User();
	     getUser = (User) session.getAttribute("user");
	     if (getUser == null){
	        response.sendRedirect("/ICT/login/toStuLogin");
	        return null;
	     }else {
	    	 return getUser;
	     }
	 }
}
