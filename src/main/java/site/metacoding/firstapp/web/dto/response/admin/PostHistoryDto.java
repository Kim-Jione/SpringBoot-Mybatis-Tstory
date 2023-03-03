package site.metacoding.firstapp.web.dto.response.admin;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PostHistoryDto {
	private Integer number;
	private String postTitle;
	private String nickname;
	private Timestamp createdAt;
}
