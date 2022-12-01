package site.metacoding.firstapp.web.dto.request.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PasswordCheckDto {
	private Integer userId;
	private String password;
}
