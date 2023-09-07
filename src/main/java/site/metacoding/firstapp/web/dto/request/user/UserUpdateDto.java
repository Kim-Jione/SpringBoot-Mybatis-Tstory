package site.metacoding.firstapp.web.dto.request.user;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserUpdateDto {
	private Integer userId;
	private String nickname;
	private String loginId;
	private String password;
	private String passwordUpdate;
	private String email;
	private String profileImg;
}
