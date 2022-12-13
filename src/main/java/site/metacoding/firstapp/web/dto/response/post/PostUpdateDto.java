package site.metacoding.firstapp.web.dto.response.post;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PostUpdateDto {
	private Integer postId;
	private Integer categoryId;
	private String categoryTitle;
	private String postTitle;
	private String postContent;
	private String postThumnail;
	private Integer userId;
	private String noFile; // 썸네일 수정 안할때!
}
