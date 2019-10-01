package cn.lhj.ICTExam.exercises.dto;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import cn.lhj.ICTExam.exercises.model.Exercises;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ExercisesFormDto {

	private long id;
	
	private Integer exerciseType;
	
	private String content;
	
	private String contentImg;
	
	private String answer;
	
	private Double maxIntegral;
	
	private Double minIntegral;
	
	private Double integralDec;
	
	private Double decPercent;
	
	private Integer decType;
	
	private Integer decNum;
	
	private String answerOption;
}
