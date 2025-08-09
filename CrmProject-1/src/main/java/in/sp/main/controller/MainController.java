package in.sp.main.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.main.entity.Employee;
import in.sp.main.service.EmpService;
import in.sp.main.service.ProductService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController {

    @Autowired
    EmpService empService;

    private final int page_size = 5;

    @GetMapping("/")
    public String openIndexPage() {
        return "index";
    }

    @GetMapping("/home")
    public String openHomePage() {
        return "index";
    }

    @GetMapping("/login")
    public String openLoginPage() {
        return "login";
    }

    @GetMapping("/profileadmin")
    public String openProfilePage() {
        return "profile-admin";
    }

    @GetMapping("/addemployee")
    public String openAddEmployeePage(Model model) {
        model.addAttribute("employee", new Employee());
        return "add-employee";
    }
    @PostMapping("/loginform")
    public String loginForm(
            @RequestParam("email1") String email,
            @RequestParam("pass1") String password,
            Model model,
            HttpSession session
            
            
            
    ) {
        if (email.equals("admin@gmail.com") && password.equals("admin123")) {
            return "profile-admin";
        } else {
            Employee emp = empService.login(email);
            if (emp != null && emp.getPassword().equals(password)) {
                session.setAttribute("session_emp", emp);
                return "profile-employee";
            } else {
                model.addAttribute("model_error", "Email ID and Password do not match");
                return "login";
            }
        }
    }

    @PostMapping("/addempform")
    public String registerEmployeeForm(
            @ModelAttribute("employee") @Valid Employee emp,
            BindingResult result,
            Model model
    ) {
        if (result.hasErrors()) {
            model.addAttribute("model_error", result.getFieldError().getDefaultMessage());
            return "add-employee";
        }

        boolean status = empService.addEmployeeservice(emp);
        if (status) {
            model.addAttribute("model_success", "Employee Added Successfully");
        } else {
            model.addAttribute("model_error", "Employee Not Added. Try again.");
        }

        return "add-employee";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }

    @GetMapping("/emplist")
    public String openEmployeeListPage(Model model, @RequestParam(defaultValue = "1") int page) {
        List<Employee> allEmployees = empService.getAllEmployeesService();
        int totalEmployees = allEmployees.size();
        int totalPages = (int) Math.ceil((double) totalEmployees / page_size);

        if (page < 1) page = 1;
        if (page > totalPages) page = totalPages;

        int start = (page - 1) * page_size;
        int end = Math.min(start + page_size, totalEmployees);
        List<Employee> paginatedList = allEmployees.subList(start, end);

        model.addAttribute("model_list_emp", paginatedList);
        model.addAttribute("model_total_pages", totalPages);
        model.addAttribute("model_current_page", page);

        return "employees-list";
    }

    @PostMapping("/deleteemployee")
    public String deleteEmployee(@RequestParam("empId") int empId, RedirectAttributes redirectAttributes) {
        boolean status = empService.deleteEmployeeService(empId);
        if (status) {
            redirectAttributes.addFlashAttribute("success", "Employee deleted successfully.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to delete employee.");
        }
        return "redirect:/emplist";
    }
    
 
    @PostMapping("/updateemployee")
    public String updateEmployee(@ModelAttribute Employee employee, RedirectAttributes redirectAttributes) {
        // Ensure password is not null
        Employee existingEmp = empService.getEmployeeById(employee.getId());
        employee.setPassword(existingEmp.getPassword());

        boolean status = empService.updateEmployeeService(employee);

        if (status) {
            redirectAttributes.addFlashAttribute("message", "Employee updated successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Employee update failed!");
        }

        return "redirect:/emplist";
    }
    @Autowired
    ProductService productService;
    @GetMapping("employeehome")
    public String openemphome(Model model) {
    List<Object[]> list	=productService.getcountbypurchasedcourseservice();
       model.addAttribute("model_count_course_sale",list);
    	return"profile-employee";
    }
    

}
