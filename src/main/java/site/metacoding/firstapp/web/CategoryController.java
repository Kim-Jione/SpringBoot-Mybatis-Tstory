package site.metacoding.firstapp.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.category.CategoryDao;
import site.metacoding.firstapp.domain.post.Post;
import site.metacoding.firstapp.domain.post.PostDao;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.web.dto.response.post.PagingDto;
import site.metacoding.firstapp.web.dto.response.post.PostAllDto;

@RequiredArgsConstructor
@Controller
public class CategoryController {
	private final CategoryDao categoryDao;
	private final PostDao postDao;
	private final UserDao userDao;
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
	public String listForm(@PathVariable Integer categoryId, @PathVariable Integer userId, Model model, Integer page) {
		if (page == null) {
			page = 0;
		}
		Integer startNum = page * 5;
		PagingDto paging = postDao.pagingByCategory(page, userId, categoryId);
		paging.makeBlockInfo();
		Post postPS = postDao.postCount(userId);
		List<PostAllDto> postList = postDao.findPost(categoryId, userId, startNum);
		Post postPS2 = postDao.countCategory(categoryId);
		model.addAttribute("postList", postList);
		model.addAttribute("categoryCount", postPS2);
		model.addAttribute("postCount", postPS);
		model.addAttribute("paging", paging);
		model.addAttribute("user", userDao.findById(userId));
		model.addAttribute("category", categoryDao.findById(categoryId)); // 카테고리 제목 표시



		model.addAttribute("postList", postDao.findByCategoryId(categoryId)); // 카테고리 내부 게시글 헤더용 



		model.addAttribute("categoryList", categoryDao.findByUserId(userId)); // 사이드바 카테고리 이동 => 공통
		return "/category/listForm";
	}
}
