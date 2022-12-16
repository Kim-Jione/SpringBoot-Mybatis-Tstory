package site.metacoding.firstapp.web.dto.auth;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FindByUsernameDto {
	private Integer userId;
	private String username;
	private String password;
}
