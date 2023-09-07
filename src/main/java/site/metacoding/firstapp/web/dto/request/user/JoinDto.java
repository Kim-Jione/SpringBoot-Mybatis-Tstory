package site.metacoding.firstapp.web.dto.request.user;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import site.metacoding.firstapp.domain.user.User;

@Getter
@Setter
public class JoinDto {
	private String loginId;
	private String password;
	private String email;
	private String nickname;
	private String gender;
	private Date birthday;
	private Integer age;


	public User toEntity() {
		User user = new User(this.loginId, this.password, this.email, this.nickname, this.gender, this.birthday, this.age);
		return user;
	}
}
