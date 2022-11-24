package site.metacoding.firstapp.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.post.PostDao;
import site.metacoding.firstapp.web.dto.response.main.KeywordDto;
import site.metacoding.firstapp.web.dto.response.post.PostAllDto;

@RequiredArgsConstructor
@Controller
public class MainController {
	private final PostDao postDao;

	// 메인 페이지
	@GetMapping({ "main/mainForm", "/" })
	public String mainForm(Model model, String keyword) {

		if (keyword == null || keyword.isEmpty()) {
			List<PostAllDto> postPS = postDao.findAllAndUsername();
			model.addAttribute("postList", postPS);
		} else {
			List<KeywordDto> postPS = postDao.findSearchAllPost(keyword);
			model.addAttribute("postList", postPS);
		}

		return "mainForm";

	}
}
