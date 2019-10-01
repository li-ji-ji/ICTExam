package cn.lhj.ICTExam.menu.API;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.lhj.ICTExam.menu.model.Menu;
import cn.lhj.ICTExam.menu.service.MenuService;
import cn.lhj.ICTExam.util.LayUIJSON;
import cn.lhj.ICTExam.util.ResultMsg;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@CrossOrigin
@RequestMapping("/menuAPI")
@Api
public class MenuAPI {

	@Autowired
	private MenuService menuServ;
	

    @ApiOperation(value="查询所有菜单条数")
	@RequestMapping("/getMenuAll")
	public LayUIJSON getMenuAll()throws Exception{
		LayUIJSON menus=new LayUIJSON();
		menus.setCode(0);
		menus.setCount(menuServ.countAllMenu());
		menus.setData(menuServ.getAllmenu());
		return menus;
	}
    
    @ApiOperation(value="添加单条菜单")
 	@RequestMapping("/addOne")
 	public LayUIJSON getMenuAll(@RequestBody Menu menu)throws Exception{
 		return menuServ.addOne(menu);
 	}
    
    @ApiOperation(value="根据ID修改菜单状态")
	@RequestMapping("/setStatusById")
	public ResultMsg setStatusById(@RequestParam("id")Integer id,@RequestParam("status")Integer status)throws Exception{
		return menuServ.setStatusById(id, status);
	}
    
    @ApiOperation(value="根据ID删除单个菜单")
	@RequestMapping("/delMenuOneById")
	public ResultMsg delMenuOneById(@RequestParam("id")long id)throws Exception{
		return menuServ.delMenuOneById(id);
	}
    
    @ApiOperation(value="更新菜单信息")
	@RequestMapping("/setMenu")
	public ResultMsg setMenu(@RequestBody Menu menu)throws Exception{
		return menuServ.setMenu(menu);
	}
}
