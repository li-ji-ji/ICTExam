package cn.lhj.ICTExam.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lhj.ICTExam.admin.model.Admin;
import cn.lhj.ICTExam.admin.repository.AdminRepository;
import cn.lhj.ICTExam.admin.service.AdminService;

@Service
public class AdminSeviceImpl implements AdminService {

	@Autowired
	private AdminRepository adminRep;
	
	
	//根据管理员账号查找管理员
	@Override
	public Admin getByAdminName(String adminName) throws Exception {
		return adminRep.findByAdminName(adminName);
	}


	//判断管理员是否存在
	@Override
	public Admin checkAdmin(Admin admin) throws Exception{
		try {
			Admin getAdmin=adminRep.findByAdminName(admin.getAdminName());
			if(admin.getPassword().equals(getAdmin.getPassword())) {
				return getAdmin;
			}else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}

	}
	
}
