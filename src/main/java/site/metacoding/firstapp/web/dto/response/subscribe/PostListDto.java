package site.metacoding.firstapp.web.dto.response.subscribe;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PostListDto {
	private Integer postId;
	private Integer userId;
	private Integer categoryId;
	private String postTitle;
	private String postContent;
	private String loginId;
	private String nickname;
	private String postThumnail;
	private Timestamp updatedAt;
	private Timestamp createdAt;
}