package in.sp.main.service;

import java.util.List;

import in.sp.main.entity.Employee;

public interface EmpService {
	
	public Employee login(String email);
	
	public boolean addEmployeeservice(Employee emp);
	
	public List<Employee> getAllEmployeesService();
	
	boolean deleteEmployeeService(int empId);
	
	boolean  updateEmployeeService(Employee emp);
	Employee getEmployeeById(int id);



}
