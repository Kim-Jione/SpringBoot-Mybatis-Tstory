package site.metacoding.firstapp.web.dto.request.user;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PasswordResetReqDto {
	private String loginId;
	private String email;
}
