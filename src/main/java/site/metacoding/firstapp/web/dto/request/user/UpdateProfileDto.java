package site.metacoding.firstapp.web.dto.request.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateProfileDto {
	private Integer userId;
	private String nickname;
	private String nicknameUpdate;
	private String profileImg;
}
