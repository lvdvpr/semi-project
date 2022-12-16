package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Employee;

public class EmployeeDao {

	public Employee getEmployeeByNo(int no) {
		return (Employee) SqlMapper.selectOne("emps.getEmployeeByNo", no);
	}
	
	public void updateEmployee(Employee employee) {
		SqlMapper.update("emps.updateEmployee", employee);
	}
}
