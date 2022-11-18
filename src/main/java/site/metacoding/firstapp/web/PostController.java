package site.metacoding.firstapp.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.category.Category;
import site.metacoding.firstapp.domain.category.CategoryDao;
import site.metacoding.firstapp.domain.post.PostDao;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.service.PostService;
import site.metacoding.firstapp.web.dto.request.PostSaveDto;

@RequiredArgsConstructor
@Controller
public class PostController {
	private final HttpSession session;
	private final PostDao postDao;
	private final CategoryDao categoryDao;
	private final PostService postService;

	@GetMapping("/post/detail/{postId}")
	public String detail(@PathVariable Integer postId, Model model) {
		return "/post/detailForm";
	}

	@GetMapping("/post/list/{userId}")
	public String list(@PathVariable Integer userId, Model model) {
		model.addAttribute("postList", postDao.findByUserId(userId));
		return "/post/listForm";
	}

	@GetMapping("/write/post")
	public String writeForm(Model model) {
		User principal = (User) session.getAttribute("principal");
		if (principal == null) {
			return "redirect:/login";
		}
		List<Category> titleDto = categoryDao.findByUserId(principal.getUserId());
		model.addAttribute("titleList", titleDto);
		return "/post/writeForm";
	}

	@PostMapping("/write/post")
	public String write(PostSaveDto postSaveDto) {
		postDao.insertSave(postSaveDto);
		return "redirect:/";
	}
}