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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.category.CategoryDao;
import site.metacoding.firstapp.domain.love.Love;
import site.metacoding.firstapp.domain.post.PostDao;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.domain.visit.VisitDao;
import site.metacoding.firstapp.service.PostService;
import site.metacoding.firstapp.service.SubscribeService;
import site.metacoding.firstapp.web.dto.CMRespDto;
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
	private final PostService postService;
	private final PostDao postDao;
	private final VisitDao visitDao;
	private final UserDao userDao;
	private final CategoryDao categoryDao;
	private final SubscribeService subscribeService;

	// 게시글 수정하기 페이지
	@GetMapping("/s/api/post/updateForm/{categoryId}/{postId}")
	public String updateForm(@PathVariable Integer categoryId, @PathVariable Integer postId, Model model) {
		User principal = (User) session.getAttribute("principal");
		PostUpdateDto postUpdateDto = postDao.findByIdUpdate(postId, categoryId, principal.getUserId());
		List<HeaderDto> titleDto = categoryDao.findByUserId(principal.getUserId());
		model.addAttribute("user", userDao.findById(principal.getUserId()));
		model.addAttribute("titleList", titleDto);
		model.addAttribute("post", postUpdateDto);
		return "/post/updateForm";
	}

	// 게시글 수정 응답
	@PutMapping("/s/api/post/update")
	public @ResponseBody CMRespDto<?> update(
			@RequestPart("file") MultipartFile file,
			@RequestPart("postUpdateDto") PostUpdateDto postUpdateDto) throws Exception {

		User principal = (User) session.getAttribute("principal");
		postService.게시글수정하기(postUpdateDto, principal.getUserId(), file);
		return new CMRespDto<>(1, "게시글 수정 성공", null);
	}

	// 게시글 등록 페이지
	@GetMapping("/s/api/post/writeForm")
	public String writeForm(Model model) {
		User principal = (User) session.getAttribute("principal");
		List<HeaderDto> titleDto = categoryDao.findByUserId(principal.getUserId());
		model.addAttribute("user", userDao.findById(principal.getUserId()));
		model.addAttribute("titleList", titleDto);
		return "/post/writeForm";
	}

	// 게시글 등록 응답
	@PostMapping("/s/api/post/write")
	public @ResponseBody CMRespDto<?> write(@RequestPart("file") MultipartFile file,
			@RequestPart("postSaveDto") PostSaveDto postSaveDto) throws Exception {

		User principal = (User) session.getAttribute("principal");
		postService.게시글등록하기(postSaveDto, principal.getUserId(), file);
		return new CMRespDto<>(1, "게시글 등록 성공", null);
	}

	// 블로그 전체 게시글 목록 페이지
	@GetMapping("/post/listForm/{userId}")
	public String list(@PathVariable Integer userId, Integer page, Model model, String keyword) {
		User principal = (User) session.getAttribute("principal");

		if (page == null) {
			page = 0;
		}

		Integer startNum = page * 5;

		if (keyword == null || keyword.isEmpty()) {

			PagingDto paging = postDao.paging(page, userId, null);
			paging.makeBlockInfo();

			model.addAttribute("postCount", postDao.postCount(userId, null)); // 전체게시글 개수
			model.addAttribute("paging", paging); // 페이징
			model.addAttribute("postList", postDao.findAllPost(userId, null, startNum)); // 블로그 전체게시글
			model.addAttribute("categoryList", categoryDao.findByUserId(userId)); // 사이드바 카테고리 이동 => 공통
			model.addAttribute("visit", visitDao.findByVisitCount(userId));

			model.addAttribute("user", userDao.findById(userId));
			if (principal != null) {
				model.addAttribute("userImg", userDao.findById(principal.getUserId()));
			}
		}

		if (principal != null) {
			Integer subscribeId = subscribeService.구독Id불러오기(principal.getUserId(), userId); // 구독 하는 사람, 구독 받는 사람
			model.addAttribute("subscribeId", subscribeId);

			List<PostAllDto> postList = postDao.findAllPost(userId, keyword, startNum);
			model.addAttribute("postList", postList); // 블로그 전체게시글
			PagingDto paging = postDao.paging(page, userId, keyword);
			paging.makeBlockInfoByPostAll(keyword);
			model.addAttribute("postCount", postDao.postCount(userId, keyword)); // 전체게시글 개수
			model.addAttribute("paging", paging); // 페이징
			model.addAttribute("categoryList", categoryDao.findByUserId(userId)); // 사이드바 카테고리 이동 => 공통
			model.addAttribute("user", userDao.findById(userId));
			model.addAttribute("userImg", userDao.findById(principal.getUserId()));
			model.addAttribute("visit", visitDao.findByVisitCount(userId));
		}

		else {
			List<PostAllDto> postList = postDao.findAllPost(userId, keyword, startNum);
			model.addAttribute("postList", postList); // 블로그 전체게시글
			PagingDto paging = postDao.paging(page, userId, keyword);
			paging.makeBlockInfoByPostAll(keyword);
			model.addAttribute("postCount", postDao.postCount(userId, keyword)); // 전체게시글 개수
			model.addAttribute("paging", paging); // 페이징
			model.addAttribute("categoryList", categoryDao.findByUserId(userId)); // 사이드바 카테고리 이동 => 공통
			model.addAttribute("visit", visitDao.findByVisitCount(userId));

		}

		return "/post/listForm";
	}

	// 게시글 상세보기 페이지
	@GetMapping("/post/detailForm/{postId}/{userId}")
	public String detailForm(@PathVariable Integer postId, @PathVariable Integer userId, Model model) {
		User principal = (User) session.getAttribute("principal");

		// 좋아요 화면에 넣는용도
		if (principal == null) {
			visitDao.countByVisit(userId);
			PostDetailDto postDetail = postDao.findByIdAndUser(postId, null);
			model.addAttribute("post", postDetail);
			model.addAttribute("user", userDao.findById(userId));
			model.addAttribute("categoryList", categoryDao.findByUserId(userId)); // 사이드바 카테고리
			model.addAttribute("postList", postDao.findByUserId(userId)); // 블로그 전체게시글
			model.addAttribute("visit", visitDao.findByVisitCount(userId));
		} else {
			visitDao.countByVisit(userId);
			PostDetailDto postDetail = postDao.findByIdAndUser(postId, principal.getUserId());
			model.addAttribute("post", postDetail);
			if (principal != null) {
				model.addAttribute("userImg", userDao.findById(principal.getUserId()));
			}
			model.addAttribute("categoryList", categoryDao.findByUserId(userId)); // 사이드바 카테고리
			model.addAttribute("user", userDao.findById(userId));
			model.addAttribute("postList", postDao.findByUserId(userId)); // 블로그 전체게시글
			model.addAttribute("visit", visitDao.findByVisitCount(userId));
		}
		return "/post/detailForm";
	}

	// 게시글 삭제 응답
	@DeleteMapping("/s/api/post/{postId}")
	public @ResponseBody CMRespDto<?> delete(@PathVariable Integer postId) {
		postDao.delete(postId);
		return new CMRespDto<>(1, "게시글 삭제 성공", null);
	}

	// 게시글 좋아요 응답
	@PostMapping("/s/api/post/love/{postId}")
	public @ResponseBody CMRespDto<?> insertLove(@PathVariable Integer postId) {

		User principal = (User) session.getAttribute("principal");

		Love love = new Love(principal.getUserId(), postId);

		postService.좋아요(love);
		return new CMRespDto<>(1, "좋아요 성공", love);
	}

	// 게시글 싫어요 응답
	@DeleteMapping("/s/api/post/love/{postId}/{loveId}")
	public @ResponseBody CMRespDto<?> deleteLove(@PathVariable Integer postId, @PathVariable Integer loveId) {
		postService.좋아요취소(loveId);

		return new CMRespDto<>(1, "좋아요 취소 성공", null);
	}

}