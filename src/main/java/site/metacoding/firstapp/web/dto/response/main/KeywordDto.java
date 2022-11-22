package site.metacoding.firstapp.web.dto.response.main;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class KeywordDto {
	private String postTitle;
	private String postContent;
	private Integer userId;
	private Integer postId;
	private String username;
}
