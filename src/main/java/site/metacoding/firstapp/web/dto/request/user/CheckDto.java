package site.metacoding.firstapp.web.dto.request.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CheckDto {
	private String username;
	private String password;
	private String email;
	private String nickname;
}
