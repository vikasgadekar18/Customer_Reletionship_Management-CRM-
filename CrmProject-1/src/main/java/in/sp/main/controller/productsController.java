package in.sp.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import in.sp.main.entity.Product;


@Controller
public class productsController {
	@GetMapping("/addproducts")
	public String openaddproductpage(Model model) {
		model.addAttribute("productAttr",new Product());
		return "add-products";
	}

	@GetMapping("/addcourseform")
	public String addcoursedetails(   
			
			 @ModelAttribute("productAttr")  Product product,
			 @RequestParam("courseimage") MultipartFile courseimgurl,
			 @RequestParam("trainersimage") MultipartFile trainerimgurl)
	      
     {
		        
		           return "";
	}

}
