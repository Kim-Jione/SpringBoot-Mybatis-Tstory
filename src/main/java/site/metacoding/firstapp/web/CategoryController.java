package site.metacoding.firstapp.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CategoryController {
	@GetMapping("/write/category")
	public String writeForm() {
		return "/category/writeForm";
	}
}
