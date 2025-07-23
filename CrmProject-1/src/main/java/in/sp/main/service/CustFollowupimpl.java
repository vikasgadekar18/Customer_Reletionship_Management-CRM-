package in.sp.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.entity.CustFollowup;
import in.sp.main.repository.CustfollowRepository;
@Service
public class CustFollowupimpl implements CustFollowupService {
	@Autowired
    CustfollowRepository custfollowRepository;
	@Override
	public boolean addCustFollwupDateService(CustFollowup custFollowup) {
		boolean status=false;
		
		try {
			
			custfollowRepository.save(custFollowup);
			status=true;
			
		} catch (Exception e) {
			 status= false;
			 
			e.printStackTrace();
			// TODO: handle exception
		}
		
		
		return status;
	}

}
