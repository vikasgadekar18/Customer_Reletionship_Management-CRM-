package in.sp.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
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

	@GetMapping("/emplist")
	public String openEmplistpage() {
		return "employees-list";

	}

	@GetMapping("/profileadmin")
	public String openprofilepage() {
		return "profile-admin";

	}

	@PostMapping("/loginform")
	public String loginform(

			@RequestParam("email1") String myemail, @RequestParam("pass1") String mypass,
			Model model
			
			) {
		
		
		String page = "login";

		if (myemail.equals("admin@gmail.com") && mypass.equals("admin123")) {
			page = "profile-admin";

		} else {
            model.addAttribute("model_error", "Email id and Password are didnt match");
			page = "login";

		}

		return page;

	}
}
