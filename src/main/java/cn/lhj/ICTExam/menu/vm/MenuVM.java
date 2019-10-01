package cn.lhj.ICTExam.menu.vm;

import java.util.List;

import cn.lhj.ICTExam.menu.model.Menu;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuVM extends Menu{
	
	private List<Menu> menus;
}
