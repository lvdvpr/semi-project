package com.community.dao;

import java.util.List;

import com.community.util.SqlMapper;
import com.community.vo.Department; 

public class DepartmentDao {

	@SuppressWarnings("unchecked")
	public List<Department> getAllDepartments() {
		return (List<Department>) SqlMapper.selectList("getAllDepartments");
	}
	
	public void updateDepartment(Department department) {
		SqlMapper.update("updateDepartment", department);
	}
	
	public Department getDepartmentByNo(int deptNo) {
		return (Department) SqlMapper.selectOne("getDepartmentByNo", deptNo);
	}
}
