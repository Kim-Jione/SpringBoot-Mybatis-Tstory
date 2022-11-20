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
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.web.dto.request.PostSaveDto;
import site.metacoding.firstapp.web.dto.response.PostDetailDto;
import site.metacoding.firstapp.web.dto.response.PostUpdateDto;

@RequiredArgsConstructor
@Controller
public class PostController {
	private final HttpSession session;
	private final PostDao postDao;
	private final UserDao userDao;
	private final CategoryDao categoryDao;

	// 게시글 상세보기 페이지
	@GetMapping("/post/detailForm/{postId}")
	public String detailForm(@PathVariable Integer postId, Model model) {
		PostDetailDto postDetail = postDao.findByIdAndUser(postId);
		model.addAttribute("post", postDetail);
		return "/post/detailForm";
	}

	// 게시글 수정하기 페이지
	@GetMapping("/{categoryId}/{postId}/updateForm")
	public String updateForm(@PathVariable Integer categoryId, @PathVariable Integer postId, Model model) {
		User principal = (User) session.getAttribute("principal");
		if (principal == null) {
			return "redirect:/loginForm";
		}
		PostUpdateDto postUpdateDto = postDao.findByIdUpdate(postId, categoryId, principal.getUserId());
		List<Category> titleDto = categoryDao.findByUserId(principal.getUserId());
		model.addAttribute("titleList", titleDto);
		model.addAttribute("post", postUpdateDto);
		return "/post/updateForm";
	}

	// 게시글 수정 응답
	@PostMapping("/update/post")
	public String update(PostUpdateDto postUpdateDto) {
		postDao.insertUpdate(postUpdateDto);
		return "redirect:/";
	}

	// 게시글 삭제
	@PostMapping("/delete/{postId}")
	public String delete(@PathVariable Integer postId) {
		postDao.delete(postId);
		;
		return "redirect:/";
	}

	// 블로그 전체 게시글 목록 페이지
	@GetMapping("/post/listForm/{userId}")
	public String list(@PathVariable Integer userId, Model model) {
		model.addAttribute("user", userDao.findById(userId));
		model.addAttribute("categoryList", categoryDao.findByUserId(userId)); // 사이드바 카테고리
		model.addAttribute("postList", postDao.findByUserId(userId)); // 블로그 전체게시글
		return "/post/listForm";
	}

	// 게시글 등록 페이지
	@GetMapping("/write/postForm")
	public String writeForm(Model model) {
		User principal = (User) session.getAttribute("principal");
		if (principal == null) {
			return "redirect:/loginForm";
		}
		List<Category> titleDto = categoryDao.findByUserId(principal.getUserId());
		model.addAttribute("titleList", titleDto);
		return "/post/writeForm";
	}

	// 게시글 등록 응답
	@PostMapping("/write/post/{userId}")
	public String write(@PathVariable Integer userId, PostSaveDto postSaveDto) {
		postDao.insertSave(postSaveDto);
		return "redirect:/post/listForm/{userId}";
	}

}