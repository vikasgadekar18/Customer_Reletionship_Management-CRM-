package in.sp.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class productsController {
	@GetMapping("/addproducts")
	public String openaddproductpage() {
		return "add-products";
	}

}
