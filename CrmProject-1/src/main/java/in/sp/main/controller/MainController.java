package in.sp.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import in.sp.main.CrmProject1Application;
import in.sp.main.entity.Employee;
import in.sp.main.service.EmpService;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

    private final CrmProject1Application crmProject1Application;
	@Autowired
	EmpService empService;

    MainController(CrmProject1Application crmProject1Application) {
        this.crmProject1Application = crmProject1Application;
    }
	@GetMapping("/")
	public String openindexpage() {
		return "index";

	}

	@GetMapping("/home")
	public String openhomepage() {
		return "index";

	}

	@GetMapping("/login")
	public String openloginpage() {
		return "login";

	}
  int page_size=10;
	@GetMapping("/emplist")
	public String openEmplistpage( Model model, @RequestParam(defaultValue = "1")int page) {
			
	List<Employee> list_emp = empService.getAllEmployeesService();
	int total_products=list_emp.size();
	int total_pages= (int) Math.ceil((double)total_products/page_size);
	
	int List_Start_Index=(page-1)*page_size;
	int List_End_Index=  Math.min( List_Start_Index+page_size,total_products);
	List<Employee> new_list_emp=list_emp.subList(List_Start_Index, List_End_Index);
	
	
	model.addAttribute("model_list_emp", new_list_emp);
	model.addAttribute("model_total_pages",total_pages);
	model.addAttribute("model_current_page", new_list_emp);
	   
		return "employees-list";

	}

	@GetMapping("/profileadmin")
	public String openprofilepage() {
		return "profile-admin";

	}
	@GetMapping("/addemployee")
	public String openaddEmployeepage() {
		return "add-employee";
	}

	@PostMapping("/loginform")
	public String loginform(

			@RequestParam("email1") String myemail, @RequestParam("pass1") String mypass,
			Model model,
			HttpSession session
			
			) {
		
		
		String page = "login";

		if (myemail.equals("admin@gmail.com") && mypass.equals("admin123")) {
			page = "profile-admin";

		} else {
			 Employee emp = empService.login(myemail);
			 if(emp!=null && emp.getPassword().equals(mypass)) {
				 session.setAttribute("session_emp", emp);
				 page="profile-employee";
				 
			 }
			 
			 else {
				 model.addAttribute("model_error", "Email id and Password are didnt match");
					page = "login";
			 }

		}

		return page;

	}
	
	
	@PostMapping("/addempform")
	public String registeremployeeform(
			@RequestParam("name1") String empname,
			@RequestParam("email1") String empemail,
			@RequestParam("pass1") String emppass,
			@RequestParam("phone1") String empphone,
			Model model  ) 
	{
		Employee emp =new Employee();
		emp.setName(empname);
		emp.setEmail(empemail);
		emp.setPassword(emppass);
		emp.setPhoneno(empphone);
		
		
		 boolean status =empService.addEmployeeservice(emp);
		  if(status) {
			  model.addAttribute("model_success", "Employee Added Successfully");
		  }
		  else {
			  model.addAttribute("model_error", "Employee Not Add Error");
		}
		
		return "add-employee";
	}

	@GetMapping("/logout")
	public String logut( HttpSession session) {
		session.invalidate();
		return "login";
	}
}
