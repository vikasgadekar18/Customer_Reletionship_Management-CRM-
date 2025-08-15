package in.sp.main.service;

import java.util.List;

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
	@Override
	public boolean isphoneNumberExists(String phoneNumber) {
		// TODO Auto-generated method stub
		return custEnquiryRepository.existsByPhoneno(phoneNumber);
	}
	@Override
	public List<CustomerEnquiry> getAllCustEnqHistory(String phoneno) {
		
		return custEnquiryRepository.findAllByPhoneno(phoneno);
	}

}
