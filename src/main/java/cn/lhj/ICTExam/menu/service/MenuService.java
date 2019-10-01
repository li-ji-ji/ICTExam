package cn.lhj.ICTExam.menu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.lhj.ICTExam.menu.model.Menu;
import cn.lhj.ICTExam.menu.vm.MenuVM;
import cn.lhj.ICTExam.util.LayUIJSON;
import cn.lhj.ICTExam.util.ResultMsg;

@Service
public interface MenuService {

	//查询菜单总条数
	public long countAllMenu()throws Exception;
	//查询所有菜单
	public List<Menu> getAllmenu()throws Exception;
	//根据ID查询菜单
	public Menu getMenuById(long id)throws Exception;
	//查询菜单封装成VM
	public List<MenuVM> getAllMenuVM()throws Exception;
	//根据父级ID查询菜单
	public List<Menu> getByPid(long pId)throws Exception; 
	//添加单条菜单
	public LayUIJSON<Menu> addOne(Menu menu)throws Exception;
	//根据ID修改菜单信息
	public ResultMsg setStatusById(Integer id,Integer status)throws Exception;
	//根据ID删除菜单信息
	public ResultMsg delMenuOneById(long id)throws Exception;
	//根据表单修改菜单信息
	public ResultMsg setMenu(Menu menu)throws Exception;
	
}
