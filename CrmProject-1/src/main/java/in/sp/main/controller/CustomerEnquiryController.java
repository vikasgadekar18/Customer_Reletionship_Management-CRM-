package in.sp.main.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.main.entity.CustomerEnquiry;
import in.sp.main.entity.Employee;
import in.sp.main.service.CustomerEnquiryService;
import in.sp.main.service.ProductService;
import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerEnquiryController {

	ProductService productService;
	@Autowired
	CustomerEnquiryService customerEnquiryService;

	@GetMapping("/customerenquirypage")
	public String opencustomerenquirypage(Model model,
			                  @RequestParam(name="redirct_success",required = false) String success,
			                  @RequestParam(name="redirct_error",required = false) String error
			                                          ) {
		
	    List<String>list_coursename=productService.getAllCourseNameService();
	    model.addAttribute("model_coursename_list",list_coursename);
		 model.addAttribute("modelCustEnquiryAttr",new CustomerEnquiry());
		 model.addAttribute("redirect_success",success);
		 model.addAttribute("redirect_error",error);
		 
		 return"customer-enquiry";
	}
   
	@PostMapping("/customerenquiryform")
	public String custenquiryform(HttpSession session,  @ModelAttribute("modelCustEnquiryAttr") CustomerEnquiry customerEnquiry
			,RedirectAttributes redirectAttributes) {
		
		LocalDate date =LocalDate.now();
		String date1 =date.format(DateTimeFormatter.ofPattern("dd/mm/yyyy"));
		LocalTime time =LocalTime.now();
		String time1 =time.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
		 Employee employee = (Employee)session.getAttribute("session_emp");
		 String empemail="";
		 if(employee!=null) {
			 empemail=employee.getEmail();	  
		 }
		 customerEnquiry.setEnquirydate(date1);
		 customerEnquiry.setEnquirytime(time1);
		 customerEnquiry.setEmpemail(empemail);
		 
	 boolean status=customerEnquiryService.addCustEnquiryDetailsService(customerEnquiry);
		 if(status) {
			 redirectAttributes.addAttribute("redirct_success","Customer Enquiry Details Added Successfully");
			 
		 }
		 else {
			 redirectAttributes.addAttribute("redirct_error","Customer Enquiry Details Not Added Due To Error");
		 }
		 
		return "redirect:/customerenquirypage";
	}
	
	
	
	@GetMapping("customerfollowuppage")
	public String opencustomerfollowuppage() {
		 return"customer-followup";
	}
}
