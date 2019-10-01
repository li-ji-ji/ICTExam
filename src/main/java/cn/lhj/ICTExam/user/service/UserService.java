package cn.lhj.ICTExam.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.lhj.ICTExam.user.DTO.UserMsgAndExersList;
import cn.lhj.ICTExam.user.model.User;
import cn.lhj.ICTExam.util.LayUIJSON;

@Service
public interface UserService {

	//查询所有用户信息条数
	public long countAll()throws Exception;
	
	//查询所有用户信息
	public List<User> getAll()throws Exception;
	
	//根据学生学号查询用户信息
	public User getByStuId(String stuId) throws Exception;
	
	//根据学生学号判断用户是否存在
	public User checkUser(User user) throws Exception;
	
	//添加一个用户
	public LayUIJSON<User> addOne(User user)throws Exception;
	
	//更新一个用户信息
	public LayUIJSON<User> setOne(User user) throws Exception;
	
	//设置用户状态
	public LayUIJSON<User> setOneStatusByStuId(String stuId,Integer status) throws Exception;
	
	//删除一个用户
	public LayUIJSON<User> delOne(String stuId)throws Exception;
	
	//给出用户题目序列并存入redis
	public UserMsgAndExersList getUserMsgAndExerListToRedis(String stuId)throws Exception;
	
	//根据用户编号查询用户信息并获取题目
	public UserMsgAndExersList getUserMsgAndExerListFromRedis(String stuId)throws Exception;
	
	//更新用户答题信息
	public UserMsgAndExersList updateUserMsgAndExersList(User user)throws Exception;
}
