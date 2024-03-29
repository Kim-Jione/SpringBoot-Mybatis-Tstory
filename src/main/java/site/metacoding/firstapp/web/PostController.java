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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.category.Category;
import site.metacoding.firstapp.domain.love.Love;
import site.metacoding.firstapp.service.PostService;
import site.metacoding.firstapp.service.SubscribeService;
import site.metacoding.firstapp.service.UserService;
import site.metacoding.firstapp.service.VisitService;
import site.metacoding.firstapp.web.dto.CMRespDto;
import site.metacoding.firstapp.web.dto.SessionUserDto;
import site.metacoding.firstapp.web.dto.request.post.PostSaveDto;
import site.metacoding.firstapp.web.dto.request.post.PostUpdateDto;
import site.metacoding.firstapp.web.dto.response.main.HeaderDto;
import site.metacoding.firstapp.web.dto.response.post.PagingDto;
import site.metacoding.firstapp.web.dto.response.post.PostAllDto;
import site.metacoding.firstapp.web.dto.response.post.PostBeChangedDto;
import site.metacoding.firstapp.web.dto.response.post.PostDetailDto;

@RequiredArgsConstructor
@Controller
public class PostController {
	private final HttpSession session;
	private final PostService postService;
	private final VisitService visitService;
	private final UserService userService;
	private final SubscribeService subscribeService;

	// 게시글 수정하기 페이지
	@GetMapping("/s/api/post/updateForm/{categoryId}/{postId}")
	public String updateForm(@PathVariable Integer categoryId, @PathVariable Integer postId, Model model) {
		SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
		PostBeChangedDto postUpdateDto = postService.postBeChanged(postId, principal.getUserId());
		// model.addAttribute("user", userService.findById(principal.getUserId()));
		// model.addAttribute("titleList", titleDto);
		// model.addAttribute("userImg", userService.findById(principal.getUserId()));
		model.addAttribute("post", postUpdateDto);
		return "/post/updateForm";
	}

	// 게시글 수정 응답
	// @PutMapping("/s/api/post/update")
	// public @ResponseBody CMRespDto<?> update(
	// 		@RequestPart("file") MultipartFile file,
	// 		@RequestPart("postUpdateDto") PostUpdateDto postUpdateDto) throws Exception {

	// 	SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
	// 	postService.게시글수정하기(postUpdateDto, principal.getUserId(), file);
	// 	return new CMRespDto<>(1, "게시글 수정 성공", null);
	// }

	// 썸네일 없는 게시글 수정 응답
	// @PutMapping("/s/api/post/update/noImg")
	// public @ResponseBody CMRespDto<?> updateNoImg(@RequestBody PostUpdateDto postUpdateDto) {
	// 	SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
	// 	// if (postUpdateDto.getNoFile() == null) {
	// 	// 	System.out.println("디버그 : 원래 썸네일없");
	// 	// 	postService.원래썸네일없는게시글수정하기(postUpdateDto, principal.getUserId());
	// 	// }
	// 	postService.썸네일없는게시글로수정하기(postUpdateDto, principal.getUserId());
	// 	return new CMRespDto<>(1, "썸네일없는게시글 수정 성공", null);
	// }

	// 게시글 등록 페이지
	@GetMapping("/s/api/post/writeForm")
	public String writeForm(Model model) {
		SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
		// List<HeaderDto> titleDto = categoryService.findByUserId(principal.getUserId());
		// List<Category> categoryPS = categoryService.findByUser(principal.getUserId());
		System.out.println("디버그 : " + principal.getUserId());
		// if (categoryPS.size() == 0) {
		// 	return "redirect:/s/api/category/writeForm";
		// }
		// model.addAttribute("user", userService.findById(principal.getUserId()));
		// model.addAttribute("userImg", userService.findById(principal.getUserId()));
		// model.addAttribute("titleList", titleDto);
		return "/post/writeForm";
	}

	// 게시글 등록 응답
	// @PostMapping("/s/api/post/write")
	// public @ResponseBody CMRespDto<?> write(@RequestPart("file") MultipartFile file,
	// 		@RequestPart("postSaveDto") PostSaveDto postSaveDto) throws Exception {

	// 	SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
	// 	postService.게시글등록하기(postSaveDto, principal.getUserId(), file);
	// 	return new CMRespDto<>(1, "게시글 등록 성공", null);
	// }

	// // 썸네일 없는 게시글 등록 응답
	// @PostMapping("/s/api/post/write/noImg")
	// public @ResponseBody CMRespDto<?> writeNoImg(@RequestBody PostSaveDto postSaveDto) {

	// 	SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
	// 	postService.썸네일없는게시글등록하기(postSaveDto, principal.getUserId());
	// 	return new CMRespDto<>(1, "이미지없는 게시글 등록 성공", null);
	// }

	// // 블로그 전체 게시글 목록 페이지
	// @GetMapping("/post/listForm/{userId}")
	// public String list(@PathVariable Integer userId, Integer page, Model model, String keyword) {
	// 	SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");

	// 	if (page == null) {
	// 		page = 0;
	// 	}

	// 	Integer startNum = page * 5;

	// 	if (keyword == null || keyword.isEmpty()) {

	// 		PagingDto paging = postService.paging(page, userId, null);
	// 		paging.makeBlockInfo();

	// 		model.addAttribute("postCount", postService.postCount(userId, null)); // 전체게시글 개수
	// 		model.addAttribute("paging", paging); // 페이징
	// 		model.addAttribute("postList", postService.findAllPost(userId, null, startNum)); // 블로그 전체게시글
	// 		model.addAttribute("categoryList", categoryService.findByUserId(userId)); // 사이드바 카테고리 이동 => 공통
	// 		model.addAttribute("visit", visitService.findByVisitCount(userId));

	// 		model.addAttribute("user", userService.findById(userId));
	// 		if (principal != null) {
	// 			model.addAttribute("userImg", userService.findById(principal.getUserId()));
	// 		}
	// 	}

	// 	if (principal != null) {
	// 		Integer subscribeId = subscribeService.구독Id불러오기(principal.getUserId(), userId); // 구독 하는 사람, 구독 받는 사람
	// 		model.addAttribute("subscribeId", subscribeId);

	// 		List<PostAllDto> postList = postService.findAllPost(userId, keyword, startNum);
	// 		model.addAttribute("postList", postList); // 블로그 전체게시글
	// 		PagingDto paging = postService.paging(page, userId, keyword);
	// 		paging.makeBlockInfoByPostAll(keyword);
	// 		model.addAttribute("postCount", postService.postCount(userId, keyword)); // 전체게시글 개수
	// 		model.addAttribute("paging", paging); // 페이징
	// 		model.addAttribute("categoryList", categoryService.findByUserId(userId)); // 사이드바 카테고리 이동 => 공통
	// 		model.addAttribute("user", userService.findById(userId));
	// 		model.addAttribute("userImg", userService.findById(principal.getUserId()));
	// 		model.addAttribute("visit", visitService.findByVisitCount(userId));
	// 	}

	// 	else {
	// 		List<PostAllDto> postList = postService.findAllPost(userId, keyword, startNum);
	// 		model.addAttribute("postList", postList); // 블로그 전체게시글
	// 		PagingDto paging = postService.paging(page, userId, keyword);
	// 		paging.makeBlockInfoByPostAll(keyword);
	// 		model.addAttribute("postCount", postService.postCount(userId, keyword)); // 전체게시글 개수
	// 		model.addAttribute("paging", paging); // 페이징
	// 		model.addAttribute("categoryList", categoryService.findByUserId(userId)); // 사이드바 카테고리 이동 => 공통
	// 		model.addAttribute("visit", visitService.findByVisitCount(userId));

	// 	}

	// 	return "/post/listForm";
	// }

	// // 게시글 상세보기 페이지
	// @GetMapping("/post/detailForm/{postId}/{userId}")
	// public String detailForm(@PathVariable Integer postId, @PathVariable Integer userId, Model model) {
	// 	SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");

	// 	// 좋아요 화면에 넣는용도
	// 	if (principal == null) {
	// 		visitService.countByVisit(userId, postId);
	// 		PostDetailDto postDetail = postService.findByIdAndUser(postId, null);
	// 		model.addAttribute("post", postDetail);
	// 		model.addAttribute("user", userService.findById(userId));
	// 		model.addAttribute("categoryList", categoryService.findByUserId(userId)); // 사이드바 카테고리
	// 		model.addAttribute("postList", postService.findByUserId(userId)); // 블로그 전체게시글
	// 		model.addAttribute("visit", visitService.findByVisitCount(userId));
	// 	} else {
	// 		visitService.countByVisit(userId, postId);
	// 		PostDetailDto postDetail = postService.findByIdAndUser(postId, principal.getUserId());
	// 		model.addAttribute("post", postDetail);
	// 		if (principal != null) {
	// 			model.addAttribute("userImg", userService.findById(principal.getUserId()));
	// 		}
	// 		model.addAttribute("categoryList", categoryService.findByUserId(userId)); // 사이드바 카테고리
	// 		model.addAttribute("user", userService.findById(userId));
	// 		model.addAttribute("postList", postService.findByUserId(userId)); // 블로그 전체게시글
	// 		model.addAttribute("visit", visitService.findByVisitCount(userId));
	// 	}
	// 	return "/post/detailForm";
	// }

	// // 게시글 삭제 응답
	// @DeleteMapping("/s/api/post/{postId}")
	// public @ResponseBody CMRespDto<?> delete(@PathVariable Integer postId) {
	// 	postService.delete(postId);
	// 	return new CMRespDto<>(1, "게시글 삭제 성공", null);
	// }

	// // 게시글 좋아요 응답
	// @PostMapping("/s/api/post/love/{postId}")
	// public @ResponseBody CMRespDto<?> insertLove(@PathVariable Integer postId) {

	// 	SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");

	// 	Love love = new Love(principal.getUserId(), postId);

	// 	postService.좋아요(love);
	// 	return new CMRespDto<>(1, "좋아요 성공", love);
	// }

	// // 게시글 싫어요 응답
	// @DeleteMapping("/s/api/post/love/{postId}/{loveId}")
	// public @ResponseBody CMRespDto<?> deleteLove(@PathVariable Integer postId, @PathVariable Integer loveId) {
	// 	postService.좋아요취소(loveId);

	// 	return new CMRespDto<>(1, "좋아요 취소 성공", null);
	// }

}