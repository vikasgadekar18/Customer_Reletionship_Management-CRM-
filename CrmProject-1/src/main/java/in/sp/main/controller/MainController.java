package in.sp.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@GetMapping("/")
	public String openindexpage()
	{ 
		return "index";
		
	}
	@GetMapping("/login")
	public String openloginpage()
	{ 
		return "login";
		
	}
	@GetMapping("/profile")
	public String openprofilepage()
	{ 
		return "profile";
		
	}
}



