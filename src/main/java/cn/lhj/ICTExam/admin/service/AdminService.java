package cn.lhj.ICTExam.admin.service;

import org.springframework.stereotype.Service;

import cn.lhj.ICTExam.admin.model.Admin;

@Service
public interface AdminService {

	//根据管理员账号查找管理员
	public Admin getByAdminName(String adminName) throws Exception;
	
	//判断管理员是否存在
	public Admin checkAdmin(Admin admin) throws Exception;
	
}
