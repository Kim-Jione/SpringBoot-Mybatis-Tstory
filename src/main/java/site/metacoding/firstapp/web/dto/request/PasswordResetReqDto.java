package site.metacoding.firstapp.web.dto.request;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PasswordResetReqDto {
	private String username;
	private String email;
}
