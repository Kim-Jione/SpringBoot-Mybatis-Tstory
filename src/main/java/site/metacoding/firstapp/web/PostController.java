package site.metacoding.firstapp.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class PostController {

	@GetMapping("/post/{id}")
	public String detail(@PathVariable Integer id, Model model) {
		return "/post/detail";
	}
}
