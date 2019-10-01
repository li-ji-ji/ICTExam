package cn.lhj.ICTExam.answerrecord.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lhj.ICTExam.answerrecord.model.AnswerRecord;
import cn.lhj.ICTExam.answerrecord.repository.AnswerRecordRepository;
import cn.lhj.ICTExam.answerrecord.service.AnswerRecordService;

@Service
public class AnswerRecordServiceImpl implements AnswerRecordService {

	@Autowired
	private AnswerRecordRepository recordRep;
	
	//查询所有答题记录
	@Override
	public List<AnswerRecord> getRecordAll() throws Exception {
		return recordRep.findAll();
	}

	//根据学生编号查询答题记录
	@Override
	public List<AnswerRecord> getRecordByStuId(String stuId) throws Exception {
		return recordRep.findByStuId(stuId);
	}

	//根据学生编号查询正确答题记录
	@Override
	public List<AnswerRecord> getRightRecordByStuId(String stuId) throws Exception {
		return recordRep.findByStuIdAndIsRight(stuId, 1);
	}

	//根据题目编号查询答题记录
	@Override
	public List<AnswerRecord> getRecordByExerId(long exerId) throws Exception {
		return recordRep.findByExerciseId(exerId);
	}

	//根据题目编号查询正确答题记录
	@Override
	public List<AnswerRecord> getRightRecordByExerId(long exerId) throws Exception {
		List<AnswerRecord> records=new ArrayList<>();
		try {
			records=recordRep.findByExerciseIdAndIsRight(exerId, 1);
		} catch (Exception e) {
			e.printStackTrace();
			records=null;
		}
		return records;
	}

	//根据题目编号查询正确答题记录数量
	@Override
	public int getRightRecordCountByExerId(long exerId) throws Exception{
		int count=0;
		try {
			count=recordRep.countByExerciseIdAndIsRight(exerId, 1);
		} catch (Exception e) {
			e.printStackTrace();
			count=0;
		}
		return count;
	}
	
	//添加答题记录
	@Override
	public int setRecord(AnswerRecord record)throws Exception{
		try {
			recordRep.saveAndFlush(record);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
