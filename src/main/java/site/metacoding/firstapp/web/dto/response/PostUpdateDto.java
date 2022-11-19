package site.metacoding.firstapp.web.dto.response;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PostUpdateDto {
	private Integer categoryId;
	private String categoryTitle;
	private Integer postId;
	private String postTitle;
	private String postContent;
	private String postThumnail;
	private Integer userId;
	
}
