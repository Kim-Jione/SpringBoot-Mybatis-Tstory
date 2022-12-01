package site.metacoding.firstapp.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.category.CategoryDao;
import site.metacoding.firstapp.domain.post.PostDao;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.web.dto.CMRespDto;
import site.metacoding.firstapp.web.dto.request.category.UpdateCategoryTitleDto;
import site.metacoding.firstapp.web.dto.response.post.PagingDto;
import site.metacoding.firstapp.web.dto.response.post.PostAllDto;

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

	// 카테고리명 등록 응답
	@PostMapping("/user/categoryTitle")
	public @ResponseBody CMRespDto<?> write(@RequestBody UpdateCategoryTitleDto updateCategoryTitleDto) {
		categoryDao.insertCategoryTitle(updateCategoryTitleDto.getCategoryTitle(), updateCategoryTitleDto.getUserId());

		return new CMRespDto<>(1, "성공", null);
	}

	// 블로그 카테고리별 게시글 목록 페이지
	@GetMapping("/category/listForm/{categoryId}/{userId}")
	public String listForm(@PathVariable Integer categoryId, @PathVariable Integer userId, Model model, Integer page,
			String keyword) {
		if (page == null) {
			page = 0;
		}
		Integer startNum = page * 5;

		if (keyword == null || keyword.isEmpty()) {
			PagingDto paging = postDao.pagingByCategory(page, userId, categoryId, null);
			paging.makeBlockInfo();

			model.addAttribute("postList", postDao.findPost(categoryId, userId, startNum, null));
			model.addAttribute("categoryCount", postDao.categoryCount(categoryId, null)); // 카테고리내 게시글 개수
			model.addAttribute("paging", paging); // 페이징
			model.addAttribute("category", categoryDao.findById(categoryId)); // 카테고리 제목 표시
			model.addAttribute("categoryList", categoryDao.findByUserId(userId));
			model.addAttribute("user", userDao.findById(userId)); // 사이드바 카테고리 이동 => 공통
		} else {

			List<PostAllDto> postList = postDao.findPost(categoryId, userId, startNum, keyword);
			PagingDto paging = postDao.pagingByCategory(page, userId, categoryId, keyword);
			paging.makeBlockInfoByCategoryPostAll(keyword);

			model.addAttribute("postList", postList);
			model.addAttribute("categoryCount", postDao.categoryCount(categoryId, keyword)); // 카테고리내 게시글 개수
			model.addAttribute("paging", paging); // 페이징
			model.addAttribute("category", categoryDao.findById(categoryId)); // 카테고리 제목 표시
			model.addAttribute("categoryList", categoryDao.findByUserId(userId));
			model.addAttribute("user", userDao.findById(userId)); // 사이드바 카테고리 이동 => 공통
		}

		return "/category/listForm";
	}

	// 게시글 삭제 응답
	@DeleteMapping("/category/{categoryId}")
	public @ResponseBody CMRespDto<?> delete(@PathVariable Integer categoryId) {
		System.out.println("디버그: categoryId "+categoryId);
		categoryDao.deleteAll(categoryId);
		return new CMRespDto<>(1, "게시글 삭제 성공", null);
	}

	// 카테고리 수정 페이지
	@GetMapping("/category/updateForm/{categoryId}")
	public String updateForm(Model model, @PathVariable Integer categoryId) {
		User principal = (User) session.getAttribute("principal");
		if (principal == null) {
			return "redirect:/user/loginForm";
		}
		model.addAttribute("category", categoryDao.findByCategoryTitleId(categoryId, principal.getUserId()));
		return "/category/updateForm";
	}

	// 카테고리명 수정 응답
	@PutMapping("/user/categoryTitle")
	public @ResponseBody CMRespDto<?> update(@RequestBody UpdateCategoryTitleDto updateCategoryTitleDto) {
		categoryDao.updateCategoryTitle(updateCategoryTitleDto.getCategoryTitle(), updateCategoryTitleDto.getUserId(),
				updateCategoryTitleDto.getCategoryId());

		return new CMRespDto<>(1, "성공", null);
	}

	

}
