package cn.lhj.ICTExam.answerrecord.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.lhj.ICTExam.answerrecord.model.AnswerRecord;

public interface AnswerRecordRepository extends JpaRepository<AnswerRecord, Long> {

	//根据学生编号查询答题记录 
	public List<AnswerRecord> findByStuId(String stuId) throws Exception;
	
	//根据学生编号和记录状态查询答题记录
	public List<AnswerRecord> findByStuIdAndIsRight(String stuId,Integer isRight)throws Exception;
	
	//根据题目编号查询答题记录
	public List<AnswerRecord> findByExerciseId(long exerId)throws Exception;
	
	//根据题目编号和记录状态查询答题记录
	public List<AnswerRecord> findByExerciseIdAndIsRight(long exerId,Integer isRight) throws Exception;
	
	//根据题目编号和记录状态查询答题记录数量
	public int countByExerciseIdAndIsRight(long exerId,Integer isRight) throws Exception;
	
}
