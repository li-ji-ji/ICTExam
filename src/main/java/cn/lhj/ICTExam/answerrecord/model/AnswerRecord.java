package cn.lhj.ICTExam.answerrecord.model;

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
public class AnswerRecord {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@Column(nullable=false)
	private String stuId;
	@Column(nullable=false)
	private long exerciseId;
	@Column(nullable=false,columnDefinition="int default 0")
	private Integer isRight;
	
}
