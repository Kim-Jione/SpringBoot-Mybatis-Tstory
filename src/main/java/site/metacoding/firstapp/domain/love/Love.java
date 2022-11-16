package site.metacoding.firstapp.domain.love;

import java.sql.Timestamp;

import lombok.Getter;

@Getter
public class Love {
	private Integer loveId;
	private Integer postId;
	private Integer userId;
	private Timestamp updatedAt;
	private Timestamp createdAt;
}
