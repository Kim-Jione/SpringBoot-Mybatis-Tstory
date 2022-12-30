package site.metacoding.firstapp.web.dto.response.admin;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PostRankDto {
	private Integer rank;
	private String nickname;
	private Integer postCount;
	private Timestamp createdAt;
}
