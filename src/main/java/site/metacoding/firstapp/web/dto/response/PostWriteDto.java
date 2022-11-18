package site.metacoding.firstapp.web.dto.response;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PostWriteDto {
	private String categoryTitle;
	private Integer userId;
	private Integer postId;
	private Integer categoryId;
}
