package site.metacoding.firstapp.web.dto.response.admin;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class LoveRankDto {
	private Integer rank;
	private String postTitle;
	private Integer loveCount;
	private String nickname;
	private Timestamp createdAt;
}
