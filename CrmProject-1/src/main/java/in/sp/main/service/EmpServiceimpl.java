package in.sp.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.entity.Employee;
import in.sp.main.repsitory.EmpRepository;
@Service
public class EmpServiceimpl implements EmpService{
    @Autowired
	EmpRepository empRepository;
	
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

}
