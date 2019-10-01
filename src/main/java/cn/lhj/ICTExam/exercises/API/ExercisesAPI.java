package cn.lhj.ICTExam.exercises.API;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.lhj.ICTExam.exercises.dto.ExercisesFormDto;
import cn.lhj.ICTExam.exercises.model.Exercises;
import cn.lhj.ICTExam.exercises.service.ExercisesService;
import cn.lhj.ICTExam.user.DTO.UserMsgAndExersList;
import cn.lhj.ICTExam.user.model.User;
import cn.lhj.ICTExam.user.service.UserService;
import cn.lhj.ICTExam.util.LayUIJSON;
import cn.lhj.ICTExam.util.RedisUtil;
import io.swagger.annotations.Api;

@RestController
@CrossOrigin
@Api
@RequestMapping("/exerAPI")
public class ExercisesAPI {
	
	@Autowired
	private ExercisesService exerSer;

	@Autowired 
	private UserService userSer;
	
    @Resource
    private RedisUtil redisUtil;
    
	@RequestMapping("/getAll")
	public LayUIJSON<Exercises> getAll() throws Exception{
		LayUIJSON<Exercises> resultMsg=new LayUIJSON<>();
		resultMsg.setCode(0);
		resultMsg.setCount(exerSer.getCountAll());
		resultMsg.setData(exerSer.getAll());
		return resultMsg;
	}
	
	@RequestMapping("/getAllToRedis")
	public LayUIJSON<Exercises> getAllToRedis() throws Exception{
		LayUIJSON<Exercises> resultMsg=new LayUIJSON<>();
		resultMsg.setCode(0);
		resultMsg.setCount(exerSer.getCountAll());
		resultMsg.setData(exerSer.getAllToRedis());
		return resultMsg;
	}
	
	@RequestMapping("/getById")
	public Exercises getById(@RequestParam("id") long id)throws Exception{
		return exerSer.getExercisesById(id);
	}
	
	@RequestMapping("/addOne")
	public LayUIJSON<Exercises> addOne(@RequestBody ExercisesFormDto exerDto) throws Exception{
		System.out.println(exerDto);
		Exercises exer=new Exercises();
		BeanUtils.copyProperties(exerDto,exer);
		exer.setContentImg(exerDto.getContentImg().toString());
		exer.setAnswerOption(exerDto.getAnswerOption().toString());
		System.out.println(exerDto.getAnswerOption());
		System.out.println(exerDto.getAnswerOption().toString());
//		System.out.println(exer.toString());
		return exerSer.addOne(exer);//exerSer.addOne(exer)
	}
	
	@RequestMapping("/delOne")
	public LayUIJSON<Exercises> delOne(@RequestParam("id") long id) throws Exception{
		return exerSer.delOne(id);
	}
	
	@RequestMapping("/getByExerType")
	public List<Exercises> getByExerType(@RequestParam("exerType") Integer exerType) throws Exception{
		return exerSer.getExercisesByExerciseType(exerType);
	}
	
	//查询单选题
	@RequestMapping("/getSingleChoiceExers")
	public List<Exercises> getSingleChoiceExers()throws Exception{
		return null;
	}
	
	//查询单选题
	@RequestMapping("/getMultipleChoiceExers")
	public List<Exercises> getMultipleChoiceExers()throws Exception{
		return null;
	}
	
	//查询单选题
	@RequestMapping("/getJudgeExers")
	public List<Exercises> getJudgeExers()throws Exception{
		return null;
	}
	
	//查询单选题
	@RequestMapping("/getFlagExers")
	public List<Exercises> getFlagExers()throws Exception{
		return null;
	}
	
	//根据题目种类及数量查询题目
	@RequestMapping("/getExersByTypeAndCount")
	public List<Integer> getExersByTypeAndCount(@RequestParam("exerType")Integer exerType,@RequestParam("count")Integer count)throws Exception{
		return exerSer.getExersByCountAndType(exerType, count);
	}
	

	//根据id和答案判断是否答对并更新用户数据
	@RequestMapping("/checkByIdAndAnswer")
	public UserMsgAndExersList checkByIdAndAnswer(HttpServletRequest request,HttpServletResponse response,@RequestParam("id")long id,@RequestParam("answer")String answer)throws Exception{
		User user=getUserMsg(request, response);
		Double score=exerSer.checkByIdAndAnswer(user.getStuId(), id, answer);
		User getUser=userSer.getByStuId(user.getStuId());
		System.out.println("======================================");
		System.out.println(getUser.getScore());
		System.out.println(score);
		getUser.setScore(getUser.getScore()+score);
		System.out.println(getUser.getScore());
		System.out.println("======================================");
		userSer.setOne(getUser);
		UserMsgAndExersList userMsg=userSer.updateUserMsgAndExersList(user);
		return userMsg;
	}
	
	//将所有题目存入redis
	@RequestMapping("/setAllToRedis")
	public int setAllToRedis()throws Exception{
		return exerSer.setAllToRedis();
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
