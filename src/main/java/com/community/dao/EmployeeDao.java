package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.dto.EmplyListDto;
import com.community.vo.Employee;
import com.sample.util.SqlMapper;

public class EmployeeDao {
	
	@SuppressWarnings("unchecked")
	public List<Employee> getAllEmployees() {
		return (List<Employee>) SqlMapper.selectList("getAllEmployees");
	}
	
	public void insertEmployee(Employee employee) {
		SqlMapper.insert("insertEmployee", employee);
	}
	
	@SuppressWarnings("unchecked")
	public List<EmplyListDto> getAllEmplyList(Map<String, Object> param) {
		return (List<EmplyListDto>) SqlMapper.selectList("getAllEmplyList", param);
	}
	
	public int getTotalRows() {
		return (Integer) SqlMapper.selectOne("getTotalRows");
	}
	
	/*
	 * public void deleteEmployeeByNo(int empNo) {
	 * SqlMapper.delete("deleteEmployeeByNo", empNo); }
	 */
	
	public void updateEmployee(Employee employee) {
		SqlMapper.update("updateEmployee", employee);
	}
	
	public Employee getEmployeeByEmpNo(int no) {
		return (Employee) SqlMapper.selectOne("getEmployeeByEmpNo", no);
	}
	
	
}
