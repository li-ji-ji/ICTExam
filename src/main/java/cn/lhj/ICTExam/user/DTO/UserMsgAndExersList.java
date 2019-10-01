package cn.lhj.ICTExam.user.DTO;

import java.util.List;

import cn.lhj.ICTExam.user.model.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserMsgAndExersList extends User{
	List<Integer> singleChoiceNoArr;
	List<Integer> multipleChoiceNoArr;
	List<Integer> judgeExersNoArr;
	List<Integer> FlagExersNoArr;
	String singleChoiceNo;
	String multipleChoiceNo;
	String judgeExersNo;
	String FlagExersNo;
	Integer nowExerType;
	Integer nowExerNo;
}
