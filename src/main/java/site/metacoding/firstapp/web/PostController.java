package site.metacoding.firstapp.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.category.Category;
import site.metacoding.firstapp.domain.category.CategoryDao;
import site.metacoding.firstapp.domain.post.Post;
import site.metacoding.firstapp.domain.post.PostDao;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.web.dto.request.post.PostSaveDto;
import site.metacoding.firstapp.web.dto.response.main.HeaderDto;
import site.metacoding.firstapp.web.dto.response.post.PagingDto;
import site.metacoding.firstapp.web.dto.response.post.PostAllDto;
import site.metacoding.firstapp.web.dto.response.post.PostDetailDto;
import site.metacoding.firstapp.web.dto.response.post.PostUpdateDto;

@RequiredArgsConstructor
@Controller
public class PostController {
	private final HttpSession session;
	private final PostDao postDao;
	private final UserDao userDao;
	private final CategoryDao categoryDao;

	// 게시글 상세보기 페이지
	@GetMapping("/post/detailForm/{postId}/{userId}")
	public String detailForm(@PathVariable Integer postId, @PathVariable Integer userId, Model model) {
		PostDetailDto postDetail = postDao.findByIdAndUser(postId);
		model.addAttribute("post", postDetail);
		model.addAttribute("user", userDao.findById(userId));
		model.addAttribute("categoryList", categoryDao.findByUserId(userId)); // 사이드바 카테고리
		model.addAttribute("postList", postDao.findByUserId(userId)); // 블로그 전체게시글
		return "/post/detailForm";
	}

	// 게시글 수정하기 페이지
	@GetMapping("/post/updateForm/{categoryId}/{postId}")
	public String updateForm(@PathVariable Integer categoryId, @PathVariable Integer postId, Model model) {
		User principal = (User) session.getAttribute("principal");
		if (principal == null) {
			return "redirect:/user/loginForm";
		}
		PostUpdateDto postUpdateDto = postDao.findByIdUpdate(postId, categoryId, principal.getUserId());
		List<HeaderDto> titleDto = categoryDao.findByUserId(principal.getUserId());
		model.addAttribute("titleList", titleDto);
		model.addAttribute("post", postUpdateDto);
		return "/post/updateForm";
	}

	// 게시글 수정 응답
	@PostMapping("/post/update")
	public String update(PostUpdateDto postUpdateDto, RedirectAttributes redirect) {
		postDao.insertUpdate(postUpdateDto);
		User principal = (User) session.getAttribute("principal");
		redirect.addAttribute("userId", principal.getUserId());
		return "redirect:/post/listForm/{userId}";
	}

	// 게시글 삭제 응답
	@PostMapping("/post/delete")
	public String delete(Integer postId, RedirectAttributes redirect) {
		postDao.delete(postId);
		User principal = (User) session.getAttribute("principal");
		redirect.addAttribute("userId", principal.getUserId());
		return "redirect:/post/listForm/{userId}";
	}

	// 게시글 등록 페이지
	@GetMapping("/post/writeForm")
	public String writeForm(Model model) {
		User principal = (User) session.getAttribute("principal");
		if (principal == null) {
			return "redirect:/user/loginForm";
		}
		List<HeaderDto> titleDto = categoryDao.findByUserId(principal.getUserId());
		model.addAttribute("titleList", titleDto);
		return "/post/writeForm";
	}

	// 게시글 등록 응답
	@PostMapping("/post/write")
	public String write(PostSaveDto postSaveDto, RedirectAttributes redirect) {
		postDao.insertSave(postSaveDto);
		redirect.addAttribute("userId", postSaveDto.getUserId());
		return "redirect:/post/listForm/{userId}";
	}

	// 게시글 등록 응답
	@PostMapping("/write/post/{userId}")
	public String write(@PathVariable Integer userId, PostSaveDto postSaveDto) {
		postDao.insertSave(postSaveDto);
		return "redirect:/post/listForm/{userId}";
	}

	// 블로그 전체 게시글 목록 페이지
	@GetMapping("/post/listForm/{userId}")
	public String list(@PathVariable Integer userId, Integer page, Model model) {
		if (page == null) {
			page = 0;
		}
		Integer startNum = page * 5;
		PagingDto paging = postDao.paging(userId, page);
		paging.makeBlockInfo();

		model.addAttribute("postCount", postDao.postCount(userId)); // 전체게시글 개수
		model.addAttribute("paging", paging); // 페이징
		model.addAttribute("postList", postDao.findAllPost(userId, startNum)); // 블로그 전체게시글
		model.addAttribute("categoryList", categoryDao.findByUserId(userId)); // 사이드바 카테고리 이동 => 공통
		return "/post/listForm";
	}

}