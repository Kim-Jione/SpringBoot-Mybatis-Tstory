package site.metacoding.firstapp.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.category.CategoryDao;
import site.metacoding.firstapp.domain.post.PostDao;
import site.metacoding.firstapp.domain.user.User;

@RequiredArgsConstructor
@Controller
public class CategoryController {
	private final CategoryDao categoryDao;
	private final PostDao postDao;
	private final HttpSession session;

	@GetMapping("/write/categoryForm")
	public String writeForm(Model model) {
		User principal = (User) session.getAttribute("principal");
		if (principal == null) {
			return "redirect:/loginForm";
		}
		model.addAttribute("principal", principal);
		return "/category/writeForm";
	}

	@PostMapping("/category/write/{userId}")
	public String write(String categoryTitle) {
		User principal = (User) session.getAttribute("principal");
		categoryDao.insertCategoryTitle(categoryTitle, principal.getUserId());
		return "redirect:/post/listForm/{userId}";
	}

	// 블로그 카테고리별 게시글 목록 페이지
	@GetMapping("/category/listForm/{categoryId}/{userId}")
	public String listForm(@PathVariable Integer categoryId, @PathVariable Integer userId, Model model) {
		model.addAttribute("category", categoryDao.findById(categoryId)); // 카테고리 제목 표시
		model.addAttribute("postList", postDao.findByCategoryId(categoryId)); // 카테고리 내부 게시글
		model.addAttribute("categoryList", categoryDao.findByUserId(userId)); // 유저 카테고리 내용
		return "/category/listForm"; 
	}
}
