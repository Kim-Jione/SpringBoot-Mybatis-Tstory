package site.metacoding.firstapp.web.dto.request.user;

import lombok.Getter;
import lombok.Setter;
import site.metacoding.firstapp.domain.user.User;

@Getter
@Setter
public class JoinDto {
	private String loginId;
	private String nickname;
	private String password;
	private String email;
	private String gender;
	private String birthday;
	private String age;


	public User toEntity() {
		User user = new User(this.loginId, this.password, this.email, this.nickname);
		return user;
	}
}
