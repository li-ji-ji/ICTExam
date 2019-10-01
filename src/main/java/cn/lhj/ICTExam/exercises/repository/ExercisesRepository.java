package cn.lhj.ICTExam.exercises.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.lhj.ICTExam.exercises.model.Exercises;


public interface ExercisesRepository extends JpaRepository<Exercises, Long> {
	
	//根据ID查找题目
	public Exercises findById(long id)throws Exception;
	
	//根据最大分值查找题目
	public List<Exercises> findByMaxIntegral(Double maxIntegral) throws Exception;
	
	//根据题目种类查询题目
	public List<Exercises> findByExerciseType(Integer exerType) throws Exception;
}
