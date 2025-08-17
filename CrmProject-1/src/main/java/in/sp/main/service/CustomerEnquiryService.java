package in.sp.main.service;

import java.util.List;

import in.sp.main.entity.CustomerEnquiry;

public interface CustomerEnquiryService {

	
	public boolean addCustEnquiryDetailsService(CustomerEnquiry customerEnquiry);
	public boolean isphoneNumberExists(String phoneNumber);
	public List<CustomerEnquiry> getAllCustEnqHistory(String phoneno);
	
	
}
