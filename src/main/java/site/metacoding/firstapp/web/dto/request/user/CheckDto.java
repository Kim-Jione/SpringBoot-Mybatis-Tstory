package site.metacoding.firstapp.web.dto.request.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CheckDto {
	private Integer userId;
	private String loginId;
	private String password;
	private String email;
	private String nickname;
	private String categoryTitle;
}
