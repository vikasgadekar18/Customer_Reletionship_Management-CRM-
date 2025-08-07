package in.sp.main.controller;

import java.nio.file.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.main.entity.Employee;
import in.sp.main.entity.Product;
import in.sp.main.entity.SaleCourse;
import in.sp.main.service.ProductService;
import jakarta.servlet.http.HttpSession;

@Controller
public class productsController {

    @Autowired
    ProductService productService;

    // 1. Show Add Product Page
    @GetMapping("/addproducts")
    public String openAddProductPage(Model model,
                                     @RequestParam(name = "redirect_attr_success", required = false) String success,
                                     @RequestParam(name = "redirect_attr_error", required = false) String error) {

        model.addAttribute("productAttr", new Product());
        model.addAttribute("model_success", success);
        model.addAttribute("model_error", error);

        return "add-products";
    }

    // 2. Handle Add Product Form Submission
    @PostMapping("/addcourseform")
    public String addCourseDetails(@ModelAttribute("productAttr") Product product,
                                   @RequestParam("courseimage") MultipartFile courseimage,
                                   @RequestParam("trainersimage") MultipartFile trainerimage,
                                   RedirectAttributes redirectAttributes) {

        boolean status1 = saveImage(courseimage);
        if (!status1) {
            redirectAttributes.addAttribute("redirect_attr_error", "Course Image Upload Failed");
        } else {
            product.setCourseimage(courseimage);
        }

        boolean status2 = saveImage(trainerimage);
        if (!status2) {
            redirectAttributes.addAttribute("redirect_attr_error", "Trainer Image Upload Failed");
        } else {
            product.setTrainersimage(trainerimage);
        }

        boolean status = productService.addProductService(product);
        if (status) {
            redirectAttributes.addAttribute("redirect_attr_success", "Product Added Successfully");
        } else {
            redirectAttributes.addAttribute("redirect_attr_error", "Product Not Added Due to DB Error");
        }

        return "redirect:/addproducts";
    }

    // Helper: Save Uploaded Image
    private boolean saveImage(MultipartFile file) {
        try {
            String filename = file.getOriginalFilename();
            if (filename == null || filename.isEmpty()) return false;

            Path uploadPath = Paths.get("target/classes/static/uploads");
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            Path filepath = uploadPath.resolve(filename);
            Files.copy(file.getInputStream(), filepath, StandardCopyOption.REPLACE_EXISTING);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 3. Show All Products List
    @GetMapping("/productslist")
    public String openProductListPage(Model model) {
        List<Product> list_product = productService.getallproductsListService();
        model.addAttribute("model_products_list", list_product);
        return "products-list";
    }

    // 4. Open Sale Course Page
    @GetMapping("/salecourse")
    public String opensalecoursepage(Model model,
                                     HttpSession session,
                                     @RequestParam(name = "redirectAttr_success", required = false) String success,
                                     @RequestParam(name = "redirectAttr_error", required = false) String error) {

        List<String> courseNames = productService.getAllCourseNameService();
        model.addAttribute("model_coursename_list", courseNames);
        model.addAttribute("modelSaleCourseAttr", new SaleCourse());
        model.addAttribute("model_success", success);
        model.addAttribute("model_error", error);

        // ✅ Pass employee to model to prevent null in JSP
        Employee employee = (Employee) session.getAttribute("session_employee");
        if (employee != null) {
            model.addAttribute("employee", employee);
        }

        return "sale-course";
    }

    // 5. Handle Sale Course Form Submission
    @PostMapping("/salecourseForm")
    public String salecourseForm(HttpSession session,
                                 @ModelAttribute("modelSaleCourseAttr") SaleCourse saleCourse,
                                 RedirectAttributes redirectAttributes) {

        Employee employee = (Employee) session.getAttribute("session_employee");

        if (employee == null) {
            redirectAttributes.addAttribute("redirectAttr_error", "Session expired. Please log in again.");
            return "redirect:/salecourse";
        }

        String empemail = employee.getEmail();

        String date1 = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        String time1 = LocalTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss"));

        saleCourse.setEmpemailid(empemail);
        saleCourse.setDate(date1);
        saleCourse.setTime(time1);

        boolean status = productService.addsaleCourseDetailsService(saleCourse);

        if (status) {
            redirectAttributes.addAttribute("redirectAttr_success", "Course sold successfully");
        } else {
            redirectAttributes.addAttribute("redirectAttr_error", "Course sale failed due to error");
        }

        return "redirect:/salecourse";
    }

    // 6. AJAX: Get Course Price and Duration by Course Name
    @GetMapping("/getCoursePrices")
    @ResponseBody
    public Product getCoursePrices(@RequestParam("selectedcourse") String selectedcourse) {
        return productService.getSelectedCourseDetailsService(selectedcourse);
    }
}
