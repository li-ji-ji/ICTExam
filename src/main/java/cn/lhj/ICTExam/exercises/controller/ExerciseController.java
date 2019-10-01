package cn.lhj.ICTExam.exercises.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.lhj.ICTExam.exercises.service.ExercisesService;

@Controller
@RequestMapping("/exer")
public class ExerciseController {
	
	@Autowired
	private ExercisesService exerService;

	//跳转到题目列表
	@RequestMapping("/toTable")
	public String toTable(Model model)throws Exception{
		return "exercises/Table";
	}

	//跳转到题目添加界面
	@RequestMapping("/toAdd")
	public String toAdd(Model model)throws Exception{
		return "exercises/Add";
	}
}
