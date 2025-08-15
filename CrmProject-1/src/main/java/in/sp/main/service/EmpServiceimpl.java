package in.sp.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.sp.main.entity.Employee;
import in.sp.main.repository.EmpRepository;
@Service
public class EmpServiceimpl implements EmpService{
    @Autowired
	EmpRepository empRepository;
	@Transactional
	@Override
	public boolean addEmployeeservice(Employee emp) {
		boolean status =false;
		
		try {
			empRepository.save(emp);
			status=true;
		} 
		catch (Exception e) {
			status =false;
			e.printStackTrace();
			
		}
		return status;
	}

	
	@Override
	public List<Employee> getAllEmployeesService() {
		
		
		
		return empRepository.findAll();
	}

	@Override
	public Employee login(String email) {
		
	 Employee emp=empRepository.findByEmail(email);
		    return emp;
	}
    
	@Override
	public boolean deleteEmployeeService(int empId) {
	    try {
	        empRepository.deleteById(empId);
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	@Override
	public boolean updateEmployeeService(Employee emp) {
	    try {
	        System.out.println("Updating employee: " + emp);  // Log employee info
	        empRepository.save(emp);
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	@Override
	public Employee getEmployeeById(int id) {
	    return empRepository.findById(id).orElse(null);
	}






}
