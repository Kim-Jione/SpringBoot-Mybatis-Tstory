package site.metacoding.firstapp.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.post.PostDao;

@RequiredArgsConstructor
@Controller
public class MainController {
	private final PostDao postDao;

	// 메인 페이지
	@GetMapping({ "main/mainForm", "/" })
	public String mainForm(Model model, String keyword) {

		if (keyword == null || keyword.isEmpty()) {
			model.addAttribute("postList", postDao.findAllAndUsername());
		} else {
			model.addAttribute("postList", postDao.findSearchAllPost(keyword));
		}
		return "mainForm";

	}
}
