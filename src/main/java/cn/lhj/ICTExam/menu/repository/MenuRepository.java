package cn.lhj.ICTExam.menu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.lhj.ICTExam.menu.model.Menu;

public interface MenuRepository extends JpaRepository<Menu, Long> {
	
	// 根据ID获取菜单
	public Menu findById(long id)throws Exception;
	//根据pId获取菜单
	public List<Menu> findByParentId(long parentId)throws Exception;
	//根据pId获取已启用菜单
	public List<Menu> findByParentIdAndStatus(long parentId,Integer status)throws Exception;
}
