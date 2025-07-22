package in.sp.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.entity.CustomerEnquiry;
import in.sp.main.repository.CustEnquiryRepository;
@Service
public class CustomerEnquiryServiceImpl implements CustomerEnquiryService {
     @Autowired
	CustEnquiryRepository custEnquiryRepository;
	@Override
	public boolean addCustEnquiryDetailsService(CustomerEnquiry customerEnquiry) {
	   boolean status=false;
	   try {
        custEnquiryRepository.save(customerEnquiry);
        status=true;
		  
	} catch (Exception e) {
		status=false;
		e.printStackTrace();
	}
	   
	   
		return status;
	}

}
