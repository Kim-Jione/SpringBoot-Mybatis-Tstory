package site.metacoding.firstapp.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.service.PostService;
import site.metacoding.firstapp.web.dto.SessionUserDto;
import site.metacoding.firstapp.web.dto.response.post.MainPostDto;

@RequiredArgsConstructor
@Controller
public class MainController {
	private final HttpSession session;
	private final PostService postService;

	// 메인 페이지
	@GetMapping({ "/main/mainForm", "/" })
	public String mainForm(Model model, String keyword) {
		SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
		if (principal != null) {
			model.addAttribute("user", principal);
		}

		List<MainPostDto> postList = postService.findByMainPostList(keyword);
		if (keyword == null || keyword.isEmpty()) {
			model.addAttribute("postList", postList);
		} else {
			model.addAttribute("postList",postList);
		}
		return "mainForm";

	}

}
