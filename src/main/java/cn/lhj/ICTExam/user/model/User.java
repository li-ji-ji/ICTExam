package cn.lhj.ICTExam.user.model;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class User implements Serializable{

	@Id 
	@Column(nullable=false,unique=true)
	private String stuId;
	@Column(nullable=false)
	private String username;
	@Column(nullable=false)
	private String password;
	@Column(nullable=false)
	private String salt;
	@Column(nullable=false)
	private Integer status;
	@Column(nullable=false,insertable = false,columnDefinition = "int default 0")
	private Double score;
	
	
}
