package com.community.dao;

import com.community.dto.EmployeeDto;
import com.community.util.SqlMapper;
import com.community.vo.Employee;

public class EmployeeDao {
	
	public Employee getEmployeeByNo(int no) {
		return (Employee)SqlMapper.selectOne("emps.getEmployeeByno", no);
	}
	
	public EmployeeDto getEmployeeDtoByNo(int empNo) {
		return (EmployeeDto)SqlMapper.selectOne("mypages.getEmployeeDtoByNo", empNo);
	}

}
