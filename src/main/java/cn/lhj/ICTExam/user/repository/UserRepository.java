package cn.lhj.ICTExam.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.lhj.ICTExam.user.model.User;

public interface UserRepository extends JpaRepository<User, String> {

	
	//根据学生学号查询用户信息
	public User findByStuId(String stuId)throws Exception;

	//根据学生学号删除用户
	public int deleteByStuId(String stuId);
	
}
