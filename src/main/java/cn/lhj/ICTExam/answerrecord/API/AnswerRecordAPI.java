package cn.lhj.ICTExam.answerrecord.API;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.lhj.ICTExam.answerrecord.model.AnswerRecord;
import cn.lhj.ICTExam.answerrecord.service.AnswerRecordService;
import io.swagger.annotations.Api;

@RestController
@CrossOrigin
@Api
@RequestMapping("/record")
public class AnswerRecordAPI {
	
	@Autowired
	private AnswerRecordService recordServ;
	
	//获取所有答题记录
	@RequestMapping("/getAll")
	public List<AnswerRecord> getAll()throws Exception{
		return recordServ.getRecordAll();
	}
	
	//根据学生编号获取答题记录
	@RequestMapping("/getByStuId")
	public List<AnswerRecord> getByStuId(@RequestParam("stuId") String stuId)throws Exception{
		return recordServ.getRecordByStuId(stuId);
	}
	
	//根据学生编号获取正确状态的答题记录
	@RequestMapping("/getRightByStuId")
	public List<AnswerRecord> getRightByStuId(@RequestParam("stuId") String stuId) throws Exception{
		return recordServ.getRightRecordByStuId(stuId);
	}
	
	//添加答题记录
	@RequestMapping("/setRecord")
	public int setRecord()throws Exception{
		AnswerRecord record=new AnswerRecord();
		record.setExerciseId(62);
		record.setIsRight(1);
		record.setStuId("20160472");
		return recordServ.setRecord(record);
	}
}
