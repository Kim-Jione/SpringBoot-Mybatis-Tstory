package site.metacoding.firstapp.web.dto.response;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PostAllDto {
	private Integer userId;
	private Integer postId;
	private String username;
	private String postTitle;
	private String postThumnail;
}
