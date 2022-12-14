package com.community.dao;

import java.util.List;

import com.community.vo.Department; 
import com.sample.util.SqlMapper;

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
