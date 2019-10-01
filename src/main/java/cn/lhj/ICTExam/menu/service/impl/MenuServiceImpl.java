package cn.lhj.ICTExam.menu.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lhj.ICTExam.menu.model.Menu;
import cn.lhj.ICTExam.menu.repository.MenuRepository;
import cn.lhj.ICTExam.menu.service.MenuService;
import cn.lhj.ICTExam.menu.vm.MenuVM;
import cn.lhj.ICTExam.util.LayUIJSON;
import cn.lhj.ICTExam.util.ResultMsg;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuRepository menuRep;
	

	//查询菜单总条数
	public long countAllMenu()throws Exception{
		return menuRep.count();
	}
	//查询所有菜单
	@Override
	public List<Menu> getAllmenu()throws Exception{
		return menuRep.findAll();
	}
	
	//根据ID获取菜单
	@Override
	public Menu getMenuById(long id) throws Exception {
		return menuRep.findById(id);
	}

	//获取所有菜单封装成vm
	@Override
	public List<MenuVM> getAllMenuVM() throws Exception {
		List<Menu> menus=menuRep.findByParentIdAndStatus(0, 1);
//		System.out.println("=====================取出的所有一级菜单=====================");
//		System.out.println(menus.toString());
		List<MenuVM> vms=new ArrayList();
		for(Menu menu:menus) {
			MenuVM menuVM=new MenuVM();
			BeanUtils.copyProperties(menuVM, menu);
//			System.out.println("=====================每个一级菜单=====================");
//			System.out.println(menu.toString());
//			System.out.println("=====================取出的菜单ID=====================");
//			System.out.println(menu.getId());
			List<Menu> sonMenu=menuRep.findByParentIdAndStatus(menu.getId(),1);
//			System.out.println("=====================取出的子菜单=====================");
//			System.out.println(sonMenu.toString());
			menuVM.setMenus(sonMenu);
			vms.add(menuVM);
		}
//		System.out.println("=====================整个MenuVM=====================");
//		System.out.println(vms.toString());
		return vms;
	}

	//根据父级ID查询菜单
	@Override
	public List<Menu> getByPid(long pId)throws Exception {
		return menuRep.findByParentId(pId);
	}
	
	//根据ID修改菜单状态
	@Override
	public ResultMsg setStatusById(Integer id,Integer status)throws Exception{
		ResultMsg msg=new ResultMsg();
		Menu menu=menuRep.findById(id);
		menu.setStatus(status);
		try {
			menuRep.save(menu);
			msg.setCode(1);
			msg.setMsg("修改成功");
		} catch (Exception e) {
			e.printStackTrace();
			msg.setCode(0);
			msg.setMsg("修改失败");
		}
		return msg;
	}
	

	//添加单条菜单
	@Override
	public LayUIJSON<Menu> addOne(Menu menu)throws Exception{
		LayUIJSON msg=new LayUIJSON();
		if(menu.getParentId()!=0) {
			menu.setParentName(menuRep.findById(menu.getParentId()).getMenuName());
		}else {
			menu.setParentName("顶级菜单");
		}
		try {
			menuRep.save(menu);
	 		msg.setCode(0);
	 		msg.setMsg("添加成功");
		} catch (Exception e) {
			e.printStackTrace();
	 		msg.setCode(1);
	 		msg.setMsg("添加失败");
		}
		return msg;
	}
	
	//根据ID删除菜单信息
	@Override
	public ResultMsg delMenuOneById(long id)throws Exception{
		ResultMsg msg=new ResultMsg();
		try {
			menuRep.deleteById(id);
			msg.setCode(1);
			msg.setMsg("删除成功");
		} catch (Exception e) {
			e.printStackTrace();
			msg.setCode(0);
			msg.setMsg("修改失败");
		}
		return msg;
	}
	//根据表单修改菜单信息
	@Override
	public ResultMsg setMenu(Menu menu)throws Exception{
		ResultMsg msg=new ResultMsg();
		try {
			menuRep.save(menu);
			msg.setCode(1);
			msg.setMsg("修改成功");
			
		} catch (Exception e) {
			e.printStackTrace();
			msg.setCode(0);
			msg.setMsg("修改失败");
		}
		return msg;
	}
	
}
