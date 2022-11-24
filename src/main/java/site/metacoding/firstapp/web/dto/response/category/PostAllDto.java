package site.metacoding.firstapp.web.dto.response.category;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PostAllDto {
	private Integer postId;
	private String postTitle;
	private Timestamp createdAt;
	private Integer userId;
	private Integer categoryId;
}
