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
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.web.dto.response.post.PagingDto;

@RequiredArgsConstructor
@Controller
public class CategoryController {
	private final CategoryDao categoryDao;
	private final PostDao postDao;
	private final UserDao userDao;
	private final HttpSession session;

	// 카테고리 등록 페이지
	@GetMapping("/category/writeForm")
	public String writeForm(Model model) {
		User principal = (User) session.getAttribute("principal");
		if (principal == null) {
			return "redirect:/user/loginForm";
		}
		model.addAttribute("principal", principal);
		return "/category/writeForm";
	}

	// 카테고리 등록 응답
	@PostMapping("/category/write")
	public String write(String categoryTitle) {
		User principal = (User) session.getAttribute("principal");
		categoryDao.insertCategoryTitle(categoryTitle, principal.getUserId());
		return "redirect:/";
	}

	// 블로그 카테고리별 게시글 목록 페이지
	@GetMapping("/category/listForm/{categoryId}/{userId}")
	public String listForm(@PathVariable Integer categoryId, @PathVariable Integer userId, Model model, Integer page) {
		if (page == null) {
			page = 0;
		}
		Integer startNum = page * 5;
		PagingDto paging = postDao.pagingByCategory(page, userId, categoryId);
		paging.makeBlockInfo();

		model.addAttribute("postList", postDao.findPost(categoryId, userId, startNum));
		model.addAttribute("categoryCount", postDao.countCategory(categoryId)); // 카테고리내 게시글 개수
		model.addAttribute("paging", paging); // 페이징
		model.addAttribute("category", categoryDao.findById(categoryId)); // 카테고리 제목 표시
		model.addAttribute("categoryList", categoryDao.findByUserId(userId)); // 사이드바 카테고리 이동 => 공통
		return "/category/listForm";
	}
}
