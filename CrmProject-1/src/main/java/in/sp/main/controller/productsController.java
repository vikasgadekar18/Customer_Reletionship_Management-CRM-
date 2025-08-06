package in.sp.main.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.main.entity.Product;
import in.sp.main.entity.SaleCourse;
import in.sp.main.service.ProductService;

@Controller
public class productsController {

    @Autowired
    ProductService productService;

    @GetMapping("/addproducts")
    public String openAddProductPage(Model model,
                                     @RequestParam(name = "redirect_attr_success", required = false) String success,
                                     @RequestParam(name = "redirect_attr_error", required = false) String error) {

        model.addAttribute("productAttr", new Product());
        model.addAttribute("model_success", success);
        model.addAttribute("model_error", error);

        return "add-products";
    }

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
    
    
    
    private boolean saveImage(MultipartFile file) {
        boolean status = false;
        try {
            String filename = file.getOriginalFilename();
            if (filename == null || filename.isEmpty()) return false;

            // This is the folder that Spring Boot serves static files from
            Path uploadPath = Paths.get("target/classes/static/uploads");
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            Path filepath = uploadPath.resolve(filename);
            Files.copy(file.getInputStream(), filepath, StandardCopyOption.REPLACE_EXISTING);
            System.out.println("Image saved to: " + filepath);

            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
     
    @GetMapping("/productslist")
    public String openProductListPage(Model model) {
        List<Product> list_product = productService.getallproductsListService();
        model.addAttribute("model_products_list", list_product);
        return "products-list";
    }
    @GetMapping("/salecourse")
    public String opensalecoursepage(Model model) {
    	  List<String> courseNames = productService.getAllCourseNameService();
          model.addAttribute("model_coursename_list", courseNames); 
          model.addAttribute("modelSaleCourseAttr",new SaleCourse());
    	return "sale-course";
    }
}
