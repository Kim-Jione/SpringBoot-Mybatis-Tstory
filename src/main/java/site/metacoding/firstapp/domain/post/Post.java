package site.metacoding.firstapp.domain.post;

import java.sql.Timestamp;

import lombok.Getter;

@Getter
public class Post {
	private Integer postId;
	private String postTitle;
	private String postContent;
	private String postThumnail;
	private Integer userId;
	private Integer categoryId;
	private Timestamp updatedAt;
	private Timestamp createdAt;
}
