package site.metacoding.firstapp.web.dto.response.main;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class KeywordDto {
	private Integer postId;
	private String postTitle;
	private String loginId;
	private String nickname;
	private Integer userId;
	private String postThumnail;
	private Integer categoryId;
	private Timestamp updatedAt;
	private Timestamp createdAt;
}
