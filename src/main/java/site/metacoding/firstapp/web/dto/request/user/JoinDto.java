package site.metacoding.firstapp.web.dto.request.user;

import lombok.Getter;
import lombok.Setter;
import site.metacoding.firstapp.domain.user.User;

@Getter
@Setter
public class JoinDto {
	private String username;
	private String nickname;
	private String password;
	private String email;

	public User toEntity() {
		User user = new User(this.username, this.password, this.email, this.nickname);
		return user;
	}
}
