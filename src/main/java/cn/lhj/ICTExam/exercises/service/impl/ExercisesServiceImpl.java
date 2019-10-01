package cn.lhj.ICTExam.exercises.service.impl;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.lhj.ICTExam.answerrecord.model.AnswerRecord;
import cn.lhj.ICTExam.answerrecord.service.AnswerRecordService;
import cn.lhj.ICTExam.exercises.model.Exercises;
import cn.lhj.ICTExam.exercises.repository.ExercisesRepository;
import cn.lhj.ICTExam.exercises.service.ExercisesService;
import cn.lhj.ICTExam.util.GetRandomArray;
import cn.lhj.ICTExam.util.LayUIJSON;
import cn.lhj.ICTExam.util.RedisUtil;

@Service
public class ExercisesServiceImpl implements ExercisesService {

	@Autowired
	private ExercisesRepository exerRepo;
	
    @Resource
    private RedisUtil redisUtil;
	
    @Autowired
	private AnswerRecordService arServ;

	//查询题目条数
    @Override
	public long getCountAll()throws Exception{
		return exerRepo.count();
	}
	



	//根据分类查询条数
    @Override
	public Integer getCountByTypeOnRedis(Integer exerType)throws Exception{
    	int size = 0;
    	if(exerType==0) {
    		size=getSingleChoiceByRedis().size();
    	}else if(exerType==1) {
    		size=getMultipleChoiceByRedis().size();
    	}else if(exerType==2) {
    		size=getJudgeByRedis().size();
    	}else if(exerType==3) {
    		size=getFlagByRedis().size();
    	}
    	return size;
    }
	
    //根据分类查询题目编号
    @Override
    public Integer[]  getExersNoByType(Integer exerType)throws Exception{
    	List<Integer> exersNoArr=new ArrayList<>();
    	if(exerType==0) {
    		exersNoArr=getSingleChoiceByRedis();
    	}else if(exerType==1) {
    		exersNoArr=getMultipleChoiceByRedis();
    	}else if(exerType==2) {
    		exersNoArr=getJudgeByRedis();
    	}else if(exerType==3) {
    		exersNoArr=getFlagByRedis();
    	}
    	return exersNoArr.toArray(new Integer[exersNoArr.size()]);
    }
    
	//查询所有题目
	@Override
	public List<Exercises> getAll()throws Exception{
		List<Exercises> exerList=new ArrayList<>();
		String getExers = new String();
		if(redisUtil.hasKey("AllExerStr")) {
//			getExers=redisUtil.get("AllExerStr").toString();
//			exerList=JSONObject.parseArray(getExers, Exercises.class);
			exerList=(List<Exercises>) redisUtil.get("AllExerStr");
		}else {
			exerList=exerRepo.findAll();
//			getExers=JSON.toJSONString(exerList);
			redisUtil.set("AllExerStr", exerList);
		}
		return exerList;
	}
	
	//更新redis中AllExerStr
	@Override
	public void updateAllExerStrOnRedis()throws Exception{
		List<Exercises> exerList=exerRepo.findAll();
//		getExers=JSON.toJSONString(exerList);
		redisUtil.set("AllExerStr", exerList);
	}
	
	//查询所有题目并存入redis
	@Override
	public List<Exercises> getAllToRedis()throws Exception{
		List<Exercises> exerList=exerRepo.findAll();
		for(Exercises exer:exerList) {
			redisUtil.set(String.valueOf(exer.getId()), exer);
		}
		return exerList;
	}
	
	//根据ID查找题目
	@Override
	public Exercises getExercisesById(long id) throws Exception {
		Exercises exer=new Exercises();
		if(redisUtil.hasKey(String.valueOf(id))) {
			exer=(Exercises) redisUtil.get(String.valueOf(id));
//			exer=JSON.parseObject(redisUtil.hget("AllExersHash", String.valueOf(exer.getId())).toString(),Exercises.class);
		}else {
			exer=exerRepo.findById(id);
//			String JSONStr=JSON.toJSONString(exer);
			redisUtil.set(String.valueOf(exer.getId()), exer);
		}
		return exer;
	}

	//根据最大分值查找题目
	@Override
	public List<Exercises> getExercisesByMaxIntegral(Double maxIntegral) throws Exception {
		return exerRepo.findByMaxIntegral(maxIntegral);
	}
	
	//根据题目种类查询题目
	@Override
	public List<Exercises> getExercisesByExerciseType(Integer exerType) throws Exception{
		List <Exercises> exerList=new ArrayList<>();
//		if(exerType==0) {
//			exerList=getSingleChoiceByRedis();
//		}else if(exerType==1) {
//			exerList=getMultipleChoiceByRedis();
//		}else if(exerType==2) {
//			exerList=getJudgeByRedis();
//		}else if(exerType==3) {
//			exerList=getFlagByRedis();
//		}
		return exerList;
	}

	//查询单选题ID并存入redis
	@Override
	public List<Integer> getSingleChoiceByRedis()throws Exception{
		List<Exercises> exers=new ArrayList<>();
		List<Integer> exerNoArr=new ArrayList<>();
		int size=0;
		if(redisUtil.hasKey("SingleChoiceExersNo")) {
			exerNoArr=(List<Integer>) redisUtil.get("SingleChoiceExersNo");
			//System.out.println(exerNoArr);
//			exers= JSON.parseArray(jsonString,Exercises.class); 
		}else {
			exers=exerRepo.findByExerciseType(0);
			for(Exercises exer:exers) {
				exerNoArr.add((int) exer.getId());
			}
			redisUtil.set("SingleChoiceExersNo", exerNoArr);
		}
		return exerNoArr;
	}

	//查询多选题ID并存入redis
	@Override
	public List<Integer> getMultipleChoiceByRedis()throws Exception{
		List<Exercises> exers=new ArrayList<>();
		List<Integer> exerNoArr=new ArrayList<>();
		if(redisUtil.hasKey("MultipleChoiceExersNo")) {
			exerNoArr=(List<Integer>) redisUtil.get("MultipleChoiceExersNo");
			//System.out.println(exerNoArr);
//			exers= JSON.parseArray(jsonString,Exercises.class); 
		}else {
			exers=exerRepo.findByExerciseType(1);
			for(Exercises exer:exers) {
				exerNoArr.add((int) exer.getId());
			}
			redisUtil.set("MultipleChoiceExersNo", exerNoArr);
		}
		return exerNoArr;
	}

	//查询判断题数目并存入redis
	@Override
	public List<Integer> getJudgeByRedis()throws Exception{
		List<Exercises> exers=new ArrayList<>();
		List<Integer> exerNoArr=new ArrayList<>();
		if(redisUtil.hasKey("JudgeExersNo")) {
			exerNoArr=(List<Integer>) redisUtil.get("JudgeExersNo");
			//System.out.println(exerNoArr);
//			exers= JSON.parseArray(jsonString,Exercises.class); 
		}else {
			exers=exerRepo.findByExerciseType(2);
			for(Exercises exer:exers) {
				exerNoArr.add((int) exer.getId());
			}
			redisUtil.set("JudgeExersNo", exerNoArr);
		}
		return exerNoArr;
	}

	//查询flag题ID并存入redis
	@Override
	public List<Integer> getFlagByRedis()throws Exception{
		List<Exercises> exers=new ArrayList<>();
		List<Integer> exerNoArr=new ArrayList<>();
		if(redisUtil.hasKey("FlagExersNo")) {
			exerNoArr=(List<Integer>) redisUtil.get("FlagExersNo");
			//System.out.println(exerNoArr);
//			exers= JSON.parseArray(jsonString,Exercises.class); 
		}else {
			exers=exerRepo.findByExerciseType(3);
			for(Exercises exer:exers) {
				exerNoArr.add((int) exer.getId());
			}
			redisUtil.set("FlagExersNo", exerNoArr);
		}
		return exerNoArr;
	}
	

	//查询指定数量类型题目序号列表
	@Override
	public List<Integer> getExersByCountAndType(Integer exerType,Integer count)throws Exception{
		Integer max=getCountByTypeOnRedis(exerType);
		int[] exersNum=new GetRandomArray().getArray(count, max);
		Integer[] exersNoArr=getExersNoByType(exerType);
		//随机题目序号列表
		List<Integer> exerNoList=new ArrayList<>();
		List<Exercises> exers=new ArrayList<>();
		//System.out.println(exersNum);
		for(int key:exersNum) {
//			System.out.println(key);
//			System.out.println(exersNoArr[key]);
//			exers.add(getExercisesById(exersNoArr[key]));
			exerNoList.add(exersNoArr[key]);
		}
		return exerNoList;
	}
	
	//添加题目
	@Override
	public LayUIJSON<Exercises> addOne(Exercises exer) throws Exception{
		LayUIJSON<Exercises> msg=new LayUIJSON<Exercises>();
		System.out.println(exer.getAnswerOption());
		try {
			exer=exerRepo.save(exer);
			msg.setCode(1);
			msg.setMsg("添加成功");
//			System.out.println("=====================================");
//			System.out.println(exer.toString());
			redisUtil.set(String.valueOf(exer.getId()), exer);
			updateAllExerStrOnRedis();
			return msg;
		} catch (Exception e) {
			e.printStackTrace();
			msg.setCode(0);
			msg.setMsg("添加失败  ");
			return msg;
		}
	}
	

	//根据ID删除题目
	@Override
	public LayUIJSON<Exercises> delOne(long id) throws Exception{
		LayUIJSON<Exercises> msg=new LayUIJSON<Exercises>();
		try {
			Exercises exer=exerRepo.findById(id);
			exerRepo.deleteById(id);
			msg.setCode(1);
			msg.setMsg("删除成功");
			redisUtil.del(String.valueOf(exer.getId()));
			updateAllExerStrOnRedis();
			return msg;
		} catch (Exception e) {
			e.printStackTrace();
			msg.setCode(0);
			msg.setMsg("删除失败");
			return msg;
		}
	}

	//更新redis题目
	@Override
	public void updateExersInRedis(Integer exerType) throws Exception{
		List<Exercises> exers=getExercisesByExerciseType(exerType);
		String exersJSON=JSON.toJSONString(exers);
		for(Exercises exer:exers) {
			if(exerType==0) {
				getSingleChoiceByRedis();
			}else if(exerType==1) {
				getMultipleChoiceByRedis();
			}else if(exerType==2) {
				getJudgeByRedis();
			}else if(exerType==3) {
				getFlagByRedis();
			}
		}
	}
	
	//根据id和答案判断是否答对并返回分值
	@Override
	public Double checkByIdAndAnswer(String stuId,long id,String answer)throws Exception{
		Exercises exer=exerRepo.findById(id);
		String getAnswer=URLEncoder.encode(exer.getAnswer());
		Double score=0.00;
		AnswerRecord record=new AnswerRecord();
		record.setStuId(stuId);
		record.setExerciseId(id);
		if(getAnswer.equals(answer)) {
			record.setIsRight(1);
			if(exer.getExerciseType()==3) {
				int rightCountar=arServ.getRightRecordCountByExerId(id);
				System.out.println(rightCountar);
				score=exer.getMaxIntegral();
				if(exer.getDecType()==1) {
					if(rightCountar<exer.getDecNum()) {
						score-=rightCountar*exer.getIntegralDec();
					}else {
						score-=exer.getDecNum()*exer.getIntegralDec();
					}
				}
			}else {
				score=exer.getMaxIntegral();
				System.out.println(score);
			}
		}else {
			record.setIsRight(0);
		}
		arServ.setRecord(record);
		return score;
	}
	
	//将所有题目存入redis
	public int setAllToRedis()throws Exception{
		List<Exercises> exerList=exerRepo.findAll();
		for(Exercises exer:exerList) {
			redisUtil.set(String.valueOf(exer.getId()), exer);
		}
		return 0;
	}
}
