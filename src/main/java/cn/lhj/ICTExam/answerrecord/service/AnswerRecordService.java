package cn.lhj.ICTExam.answerrecord.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.lhj.ICTExam.answerrecord.model.AnswerRecord;


@Service
public interface AnswerRecordService {
	
	//查询所有答题记录
	public List<AnswerRecord> getRecordAll()throws Exception;
	
	//根据学生编号查询答题记录
	public List<AnswerRecord> getRecordByStuId(String stuId) throws Exception;
	
	//根据学生编号查询正确答题记录
	public List<AnswerRecord> getRightRecordByStuId(String stuId) throws Exception;
	
	//根据题目编号查询答题记录
	public List<AnswerRecord> getRecordByExerId(long exerId) throws Exception;
	
	//根据题目编号查询正确答题记录
	public List<AnswerRecord> getRightRecordByExerId(long exerId) throws Exception;

	//根据题目编号查询正确答题记录数量
	public int getRightRecordCountByExerId(long exerId) throws Exception;
	
	//添加答题记录
	public int setRecord(AnswerRecord record)throws Exception;
}
