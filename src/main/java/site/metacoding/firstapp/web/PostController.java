package site.metacoding.firstapp.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class PostController {
	@GetMapping("/post/detail/{postId}")
	public String detail(@PathVariable Integer postId) {
		return "/post/detailForm";
	}

	@GetMapping("/post/list/{userId}")
	public String list(@PathVariable Integer userId) {
		return "/post/listForm";
	}

	@GetMapping("/write/post/{userId}")
	public String writeForm(@PathVariable Integer userId) {
		return "/post/writeForm";
	}

}
