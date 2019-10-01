package cn.lhj.ICTExam.admin.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.lhj.ICTExam.admin.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, Long> {
	
	//根据管理员账号查询管理员
	public Admin findByAdminName(String adminName) throws Exception;
	
}
