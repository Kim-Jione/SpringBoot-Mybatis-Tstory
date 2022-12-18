package site.metacoding.firstapp.web.dto.response.post;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@NoArgsConstructor
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

	public PostUpdateDto(Integer postId, Integer categoryId, String categoryTitle, String postTitle,
			String postContent, Integer userId, String postThumnail) {
	}

	public PostUpdateDto toDto() {
		PostUpdateDto postUpdateDto = new PostUpdateDto(this.postId, this.categoryId, this.categoryTitle,
				this.postTitle, this.postContent, this.userId, this.postThumnail);
		return postUpdateDto;
	}
}
