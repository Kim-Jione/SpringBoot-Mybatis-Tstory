package site.metacoding.firstapp.web.dto.response.admin;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class SubscribeRankDto {
	private Integer rank;
	private String nickname;
	private Integer subscribeCount;
	private Timestamp createdAt;
}
