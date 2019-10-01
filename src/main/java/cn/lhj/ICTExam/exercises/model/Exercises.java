package cn.lhj.ICTExam.exercises.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@Entity
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Exercises {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@Column(nullable=false,columnDefinition="int default 0")
	private Integer exerciseType;
	
	@Column(columnDefinition="mediumtext")
	private String content;
	
	@Column(columnDefinition="mediumtext")
	private String contentImg;
	
	@Column(nullable=false)
	private String answer;
	
	private String answerOption;
	
	@Column(nullable = false)
	private Double maxIntegral;
	
	private Double minIntegral;
	
	private Double integralDec;
	
	private Double decPercent;
	
	@Column(nullable = false)
	private Integer decType;
	
	private Integer decNum;
}
