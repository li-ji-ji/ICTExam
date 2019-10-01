package cn.lhj.ICTExam.user.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;

import cn.lhj.ICTExam.exercises.service.ExercisesService;
import cn.lhj.ICTExam.user.DTO.UserMsgAndExersList;
import cn.lhj.ICTExam.user.model.User;
import cn.lhj.ICTExam.user.repository.UserRepository;
import cn.lhj.ICTExam.user.service.UserService;
import cn.lhj.ICTExam.util.LayUIJSON;
import cn.lhj.ICTExam.util.RedisUtil;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRep;
	
	@Autowired
	private ExercisesService exerServ;
	
	@Autowired
	private RedisUtil redisUtil;
	
	//查询所有用户信息条数
	@Override
	public long countAll()throws Exception{
		return userRep.count();
	}

	//查询所有用户信息
	@Override
	public List<User> getAll()throws Exception{
		return userRep.findAll();
	}
	
	//根据学生学号查询用户信息
	@Override
	public User getByStuId(String stuId) throws Exception {
		return userRep.findByStuId(stuId);
	}
	

	//根据学生学号判断用户是否存在
	@Override
	public User checkUser(User user) throws Exception{
		try {
			User getUser=getByStuId(user.getStuId());
			if(getUser.getPassword().equals(user.getPassword())) {
				return getUser;
			}else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}
	
	//添加一个用户
	@Override
	public LayUIJSON<User> addOne(User user)throws Exception{
		LayUIJSON<User> msg=new LayUIJSON<User>();
		try {
			user=userRep.save(user);
			msg.setCode(1);
			msg.setMsg("添加成功");
//			System.out.println("=====================================");
//			System.out.println(exer.toString());
			return msg;
		} catch (Exception e) {
			e.printStackTrace();
			msg.setCode(0);
			msg.setMsg("添加失败  ");
			return msg;
		}
	}
	
	//更新一个用户信息
	@Override
	public LayUIJSON<User> setOne(User user) throws Exception{
		LayUIJSON<User> msg=new LayUIJSON<User>();
		try {
			user=userRep.saveAndFlush(user);
			msg.setCode(1);
			msg.setMsg("修改成功");
//			System.out.println("=====================================");
//			System.out.println(exer.toString());
			return msg;
		} catch (Exception e) {
			e.printStackTrace();
			msg.setCode(0);
			msg.setMsg("修改失败  ");
			return msg;
		}
	}

	
	//设置用户状态
	@Override
	public LayUIJSON<User> setOneStatusByStuId(String stuId,Integer status) throws Exception{
		LayUIJSON<User> msg=new LayUIJSON<User>();
		User user=userRep.findByStuId(stuId);
		user.setStatus(status);
		try {
			user=userRep.saveAndFlush(user);
			System.out.println(user.toString());
			msg.setCode(1);
			msg.setMsg("修改成功");
//			System.out.println("=====================================");
//			System.out.println(exer.toString());
			return msg;
		} catch (Exception e) {
			e.printStackTrace();
			msg.setCode(0);
			msg.setMsg("修改失败  ");
			return msg;
		}
	}
	
	//删除一个用户
	@Override
	public LayUIJSON<User> delOne(String stuId)throws Exception{
		LayUIJSON<User> msg=new LayUIJSON<User>();
		try {
			userRep.deleteById(stuId);
			msg.setCode(1);
			msg.setMsg("删除成功");
//			System.out.println("=====================================");
//			System.out.println(exer.toString());
			return msg;
		} catch (Exception e) {
			e.printStackTrace();
			msg.setCode(0);
			msg.setMsg("删除失败  ");
			return msg;
		}
	}
	
	//给出用户题目序列并存入redis
	@Override
	public UserMsgAndExersList getUserMsgAndExerListToRedis(String stuId)throws Exception{
		UserMsgAndExersList userMsg=new UserMsgAndExersList();
		User user=userRep.getOne(stuId);
		BeanUtils.copyProperties(userMsg, user);
		userMsg.setSingleChoiceNoArr(exerServ.getExersByCountAndType(0, 3));
		userMsg.setMultipleChoiceNoArr(exerServ.getExersByCountAndType(1, 2));
		userMsg.setJudgeExersNoArr(exerServ.getExersByCountAndType(2, 2));
		userMsg.setFlagExersNoArr(exerServ.getExersByCountAndType(3, 2));
		if(userMsg.getNowExerType()==null) {
			userMsg.setNowExerType(0);
		}
		if(userMsg.getNowExerNo()==null) {
			userMsg.setNowExerNo(0);
		}
		redisUtil.set(stuId, userMsg,86400);
		return userMsg;
	}
	

	
	//根据用户编号查询用户信息并获取题目
	@Override
	public UserMsgAndExersList getUserMsgAndExerListFromRedis(String stuId)throws Exception{
		UserMsgAndExersList userMsg=new UserMsgAndExersList();
		if(redisUtil.hasKey(stuId)) {
//			System.out.println("from Redis");
			userMsg=(UserMsgAndExersList) redisUtil.get(stuId);
		}else {
//			System.out.println("not from Redis");
			userMsg=getUserMsgAndExerListToRedis(stuId);
		}
		return userMsg;
	}
	
	//更新用户答题信息
	@Override
	public UserMsgAndExersList updateUserMsgAndExersList(User user)throws Exception{
		UserMsgAndExersList userMsg=getUserMsgAndExerListFromRedis(user.getStuId());
		int nowExerNo=userMsg.getNowExerNo();
		List<Integer> nowExerList=new ArrayList<Integer>();
		if(userMsg.getNowExerType()==0) {
			nowExerList=userMsg.getSingleChoiceNoArr();
			if(nowExerNo<nowExerList.size()-1){
				nowExerNo++;
				userMsg.setNowExerNo(nowExerNo);
			}else {
				nowExerNo=0;
				userMsg.setNowExerNo(nowExerNo);
				userMsg.setNowExerType(userMsg.getNowExerType()+1);
			}
		}else if(userMsg.getNowExerType()==1) {
			nowExerList=userMsg.getMultipleChoiceNoArr();
			if(nowExerNo<nowExerList.size()-1) {
				nowExerNo++;
				userMsg.setNowExerNo(nowExerNo);
			}else {
				nowExerNo=0;
				userMsg.setNowExerNo(nowExerNo);
				userMsg.setNowExerType(userMsg.getNowExerType()+1);
			}
		}else if(userMsg.getNowExerType()==2) {
			nowExerList=userMsg.getJudgeExersNoArr();
			if(nowExerNo<nowExerList.size()-1) {
				nowExerNo++;
				userMsg.setNowExerNo(nowExerNo);
			}else {
				nowExerNo=0;
				userMsg.setNowExerNo(nowExerNo);
				userMsg.setNowExerType(userMsg.getNowExerType()+1);
			}
		}else if(userMsg.getNowExerType()==3) {
			nowExerList=userMsg.getFlagExersNoArr();
			if(nowExerNo<nowExerList.size()-1) {
				nowExerNo++;
				userMsg.setNowExerNo(nowExerNo);
			}else {
				nowExerNo=0;
				userMsg.setNowExerType(null);
			}
		}
		redisUtil.set(user.getStuId(), userMsg,86400);
		return userMsg;
	}
}
