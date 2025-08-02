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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.main.entity.CustFollowup;
import in.sp.main.entity.CustomerEnquiry;
import in.sp.main.entity.Employee;
import in.sp.main.model.CustEnquiryModel;
import in.sp.main.service.CustFollowupService;
import in.sp.main.service.CustomerEnquiryService;
import in.sp.main.service.ProductService;
import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerEnquiryController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CustomerEnquiryService customerEnquiryService;
    
    

    @Autowired
    private CustFollowupService custFollowupService;
    

    // Open Customer Enquiry Page
    @GetMapping("/customerenquirypage")
    public String opencustomerenquirypage(Model model,
            @RequestParam(name = "redirct_success", required = false) String success,
            @RequestParam(name = "redirct_error", required = false) String error) {

        List<String> list_coursename = productService.getAllCourseNameService();
        model.addAttribute("model_coursename_list", list_coursename);
        model.addAttribute("modelCustEnquiryAttr", new CustEnquiryModel());

        // Feedback messages
        model.addAttribute("redirect_success", success);
        model.addAttribute("redirect_error", error);

        return "customer-enquiry";
    }

    // Handle Customer Enquiry Form Submission
    @PostMapping("/customerenquiryform")
    public String custenquiryform(HttpSession session,
            @ModelAttribute("modelCustEnquiryAttr") CustEnquiryModel customerEnquiryModel,
            RedirectAttributes redirectAttributes) {

        String date1 = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        String time1 = LocalTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss"));

        Employee employee = (Employee) session.getAttribute("session_emp");
        String empemail = (employee != null) ? employee.getEmail() : "";

        String phoneno = customerEnquiryModel.getPhoneno();

        CustomerEnquiry customerEnquiry = customerEnquiryModel.getCustomerEnquiry();
        customerEnquiry.setPhoneno(phoneno);
        customerEnquiry.setEnquirydate(date1);
        customerEnquiry.setEnquirytime(time1);
        customerEnquiry.setEmpemail(empemail);

        CustFollowup custfollowup = customerEnquiryModel.getCustFollowup();
        custfollowup.setPhoneno(phoneno);

        boolean status1 = customerEnquiryService.addCustEnquiryDetailsService(customerEnquiry);
        boolean status2 = custFollowupService.addCustFollwupDateService(custfollowup);

        if (status1 && status2) {
            redirectAttributes.addAttribute("redirct_success", "Customer Enquiry Details Added Successfully");
        } else {
        	
        
            redirectAttributes.addAttribute("redirct_error", "Customer Enquiry Details Not Added Due To Error");
        }

        return "redirect:/customerenquirypage";
    }

    // Customer Follow-up Page
    @GetMapping("/customerfollowuppage")
    public String opencustomerfollowuppage() {
        return "customer-followups";
    }

    // Check if phone number already exists
    @GetMapping("/checkphonenumberavailable")
    @ResponseBody
    public String checkphonenumber(@RequestParam("phoneNumber") String phoneno) {
        boolean status = customerEnquiryService.isphoneNumberExists(phoneno);
        return status ? "exist" : "not_exists";
    }

    // Customer Enquiry History Page
    @GetMapping("/custEnquiryHistoryPage")
    public String opencustomerEnquiryHistorypage(@RequestParam("phno") String phoneno, Model model) {
        List<CustomerEnquiry> list_custenq = customerEnquiryService.getAllCustEnqHistory(phoneno);
        model.addAttribute("model_custenquiry", list_custenq);
        return "custenq-history";  // Must match the JSP name
    }
}
