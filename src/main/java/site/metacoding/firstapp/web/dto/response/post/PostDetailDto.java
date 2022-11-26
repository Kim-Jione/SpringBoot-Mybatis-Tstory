package site.metacoding.firstapp.web.dto.response.post;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class PostDetailDto {
	private Integer postId;
	private String postTitle;
	private String postContent;
	private String postThumnail;
	private Integer userId;
	private Integer categoryId;
	private Timestamp updatedAt;
	private Timestamp createdAt;
	private String username;
	private Integer loveCount;
	private boolean isLoved;
	private Integer loveId;
}