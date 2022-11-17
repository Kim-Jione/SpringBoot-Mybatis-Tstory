package site.metacoding.firstapp.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.category.CategoryDao;
import site.metacoding.firstapp.domain.post.PostDao;
import site.metacoding.firstapp.domain.user.User;

@RequiredArgsConstructor
@Controller
public class PostController {
	private final HttpSession session;
	private final PostDao postDao;
	private final CategoryDao CategoryDao;

	@GetMapping("/post/detail/{postId}")
	public String detail(@PathVariable Integer postId) {
		return "/post/detailForm";
	}

	@GetMapping("/post/list/{userId}")
	public String list(@PathVariable Integer userId) {
		return "/post/listForm";
	}

	@GetMapping("/write/post")
	public String writeForm(Model model) {
		User principal = (User) session.getAttribute("principal");
		if (principal == null) {
			return "redirect:/login";
		}
		model.addAttribute("categoryTitle", CategoryDao.findByUserId(principal.getUserId()));
		return "/post/writeForm";
	}

}
