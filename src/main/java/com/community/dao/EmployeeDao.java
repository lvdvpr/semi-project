package com.community.dao;
import com.community.dto.EmployeeDto;
import com.community.util.SqlMapper;
import com.community.vo.Employee;

public class EmployeeDao {
	public EmployeeDto getEmployeeDtoByNo(int empNo) {
		return (EmployeeDto)SqlMapper.selectOne("mypages.getEmployeeDtoByNo", empNo);
	}
  
	private static EmployeeDao instance = new EmployeeDao();
	private EmployeeDao() {}
	public static EmployeeDao getInstance() {
		return instance;
	}
	public Employee getEmployeeByNo(int no) {
		return (Employee)SqlMapper.selectOne("emps.getEmployeeByNo", no);
	}
}
