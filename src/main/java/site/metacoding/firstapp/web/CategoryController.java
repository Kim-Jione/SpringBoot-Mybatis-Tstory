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
import site.metacoding.firstapp.domain.user.User;

@RequiredArgsConstructor
@Controller
public class CategoryController {
	private final CategoryDao categoryDao;
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
}
