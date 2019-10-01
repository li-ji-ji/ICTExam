package cn.lhj.ICTExam.exercises.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.lhj.ICTExam.exercises.model.Exercises;
import cn.lhj.ICTExam.util.LayUIJSON;
import cn.lhj.ICTExam.util.ResultMsg;

@Service
public interface ExercisesService{
	
	//查询题目条数
	public long getCountAll()throws Exception;
	


	//根据分类查询条数
	public Integer getCountByTypeOnRedis(Integer exerType)throws Exception;

    //根据分类查询题目编号
    public Integer[] getExersNoByType(Integer exerType)throws Exception;
    
	//查询所有题目
	public List<Exercises> getAll()throws Exception;
	
	//更新redis中AllExerStr
	public void updateAllExerStrOnRedis()throws Exception;
	
	//查询所有题目并存入redis
	public List<Exercises> getAllToRedis()throws Exception;
	
	//根据ID查找题目
	public Exercises getExercisesById(long id)throws Exception;
	
	//根据最大分值查找题目
	public List<Exercises> getExercisesByMaxIntegral(Double maxIntegral) throws Exception;
	
	//根据题目种类查询题目
	public List<Exercises> getExercisesByExerciseType(Integer exerType) throws Exception;

	//查询单选题ID并存入redis
	public List<Integer> getSingleChoiceByRedis()throws Exception;

	//查询多选题并存入redis
	public List<Integer> getMultipleChoiceByRedis()throws Exception;

	//查询判断题并存入redis
	public List<Integer> getJudgeByRedis()throws Exception;

	//查询flag题并存入redis
	public List<Integer> getFlagByRedis()throws Exception;
	
	//查询指定数量类型题目
	public List<Integer> getExersByCountAndType(Integer exerType,Integer count)throws Exception;
	
	//添加题目
	public LayUIJSON<Exercises> addOne(Exercises exer) throws Exception;
	
	//根据ID删除题目
	public LayUIJSON<Exercises> delOne(long id) throws Exception;
	
	//更新redis题目
	public void updateExersInRedis(Integer exerType) throws Exception;

	//根据id和答案判断是否答对并返回分值
	public Double checkByIdAndAnswer(String stuId,long id,String answer)throws Exception;
	
	//将所有题目存入redis
	public int setAllToRedis()throws Exception;
}
