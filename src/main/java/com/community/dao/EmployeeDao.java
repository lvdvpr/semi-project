package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.dto.EmployeeDto;
import com.community.dto.EmplyListDto;
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
  
	@SuppressWarnings("unchecked")                                      // by admin
	public List<Employee> getAllEmployees() {
		return (List<Employee>) SqlMapper.selectList("getAllEmployees");
	}
	
	public void insertEmployee(Employee employee) {                      // by admin
		SqlMapper.insert("insertEmployee", employee);
	}
	
	@SuppressWarnings("unchecked")                                        // by admin
	public List<EmplyListDto> getAllEmplyList(Map<String, Object> param) {
		return (List<EmplyListDto>) SqlMapper.selectList("getAllEmplyList", param);
	}
	
	public int getTotalRows() {                                           // by admin
		return (Integer) SqlMapper.selectOne("getTotalRows");
	}
	
	public void updateEmployee(Employee employee) {                       // by admin
		SqlMapper.update("updateEmployee", employee);
	}
	
	public Employee getEmployeeByEmpNo(int no) {                           // by admin
		return (Employee) SqlMapper.selectOne("getEmployeeByEmpNo", no);
	}
  
}
