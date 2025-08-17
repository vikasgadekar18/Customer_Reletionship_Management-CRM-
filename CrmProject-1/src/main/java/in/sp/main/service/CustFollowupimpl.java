package in.sp.main.service;

import java.util.List;

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
			
			CustFollowup custFollowup_db = custfollowRepository.findByPhoneno(custFollowup.getPhoneno());
			   if(custFollowup_db!= null) {
				   custFollowup_db.setFollowupdate(custFollowup.getFollowupdate());
				   custfollowRepository.save(custFollowup_db);
			   }
			   else {
				      custfollowRepository.save(custFollowup);
			   }
			   status =true;
			
		}
		
		
		catch (Exception e) {
			 
			e.printStackTrace();
			 status= false;
		
		}
		
		
		return status;
	}
	@Override
	public List<CustFollowup> getFollowupForProvidedDate(String date) {
		 return custfollowRepository.findByFollowupdate(date);
		
	}

}
