package in.sp.main.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


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

    // Open Customer Enquiry Page (Generic)
    @GetMapping("/customerenquirypage")
    public String openCustomerEnquiryPage(Model model,
                                          @RequestParam(name = "redirct_success", required = false) String success,
                                          @RequestParam(name = "redirct_error", required = false) String error) {
        List<String> list_coursename = productService.getAllCourseNameService();
        model.addAttribute("model_coursename_list", list_coursename);
        model.addAttribute("modelCustEnquiryAttr", new CustEnquiryModel());

        // Show success/error messages
        model.addAttribute("redirect_success", success);
        model.addAttribute("redirect_error", error);

        return "customer-enquiry";
    }

    // Handle Customer Enquiry Form Submission
    @PostMapping("/customerenquiryform")
    public String saveCustomerEnquiry(@ModelAttribute("modelCustEnquiryAttr") CustEnquiryModel customerEnquiryModel,
                                      HttpSession session) {

        String date = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        String time = LocalTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss"));

        Employee employee = (Employee) session.getAttribute("session_emp");
        String empEmail = (employee != null) ? employee.getEmail() : "";

        String phoneno = customerEnquiryModel.getPhoneno();

        CustomerEnquiry enquiry = customerEnquiryModel.getCustomerEnquiry();
        enquiry.setPhoneno(phoneno);
        enquiry.setEnquirydate(date);
        enquiry.setEnquirytime(time);
        enquiry.setEmpemail(empEmail);

        CustFollowup followup = customerEnquiryModel.getCustFollowup();
        followup.setPhoneno(phoneno);

        // Save both enquiry and followup
        customerEnquiryService.addCustEnquiryDetailsService(enquiry);
        custFollowupService.addCustFollwupDateService(followup);

        // Redirect to history page
        return "redirect:/custEnquiryHistoryPage?phno=" + phoneno;
    }

    // Check if phone number already exists
    @GetMapping("/checkphonenumberavailable")
    @ResponseBody
    public String checkPhoneNumber(@RequestParam("phoneNumber") String phoneno) {
        boolean exists = customerEnquiryService.isphoneNumberExists(phoneno);
        return exists ? "exist" : "not_exists";
    }

    // Customer Follow-up Page (basic)
    @GetMapping("/customerfollowuppage")
    public String openCustomerFollowupPage(Model model,
            @RequestParam(name = "selectedDate", required = false) String selectedDate) {

        String dateToUse;

        if (selectedDate != null && !selectedDate.trim().isEmpty()) {
            // Use selected date from the user
            dateToUse = selectedDate;
        } else {
            // Use current date if no date is selected
            LocalDate today = LocalDate.now();
            dateToUse = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        }

        // Fetch follow-up list for the determined date
        List<CustFollowup> list_followups = custFollowupService.getFollowupForProvidedDate(dateToUse);
        model.addAttribute("model_followups", list_followups);

        return "customer-followups";  // JSP file name (customer-followups.jsp)
    }

    @GetMapping("/custEnquiryHistoryPage")
    public String openCustomerEnquiryHistoryPage(@RequestParam("phoneno") String phoneno, Model model) {
        List<CustomerEnquiry> enquiryHistory = customerEnquiryService.getAllCustEnqHistory(phoneno);
        List<String> courseNames = productService.getAllCourseNameService();

        model.addAttribute("model_custenquiry", enquiryHistory);  // used in table
        model.addAttribute("model_coursename_list", courseNames); // for course dropdown
        model.addAttribute("modelCustEnquiryAttr", new CustEnquiryModel()); // for form

        return "custenq-history"; 
    }

 
}
