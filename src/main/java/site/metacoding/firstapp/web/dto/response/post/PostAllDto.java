package site.metacoding.firstapp.web.dto.response.post;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PostAllDto {
	private Integer postId;
	private String postTitle;
	private String username;
	private Integer userId;
	private String postThumnail;
	private Integer categoryId;
	private Timestamp updatedAt;
	private Timestamp createdAt;
}