package site.metacoding.firstapp.web.dto.request.post;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PostSaveDto {
	private String postTitle;
	private String postContent;
	private String postThumnail;
	private Integer userId;
	private Integer categoryId;
}
