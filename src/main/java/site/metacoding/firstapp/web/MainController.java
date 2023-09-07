package site.metacoding.firstapp.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.service.PostService;
import site.metacoding.firstapp.web.dto.SessionUserDto;

@RequiredArgsConstructor
@Controller
public class MainController {
	private final HttpSession session;
	private final PostService postService;
	private final UserDao userDao;

	// 메인 페이지
	@GetMapping({ "/main/mainForm", "/" })
	public String mainForm(Model model, String keyword) {
		SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
		if (principal != null) {
			model.addAttribute("userImg", userDao.findById(principal.getUserId()));
			model.addAttribute("user", userDao.findById(principal.getUserId()));
		}

		if (keyword == null || keyword.isEmpty()) {
			model.addAttribute("postList", postService.findAllAndUsername());
		} else {
			model.addAttribute("postList", postService.findSearchAllPost(keyword));
		}
		return "mainForm";

	}

}
