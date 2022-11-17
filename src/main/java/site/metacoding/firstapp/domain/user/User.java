package site.metacoding.firstapp.domain.user;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class User {
	private Integer userId;
	private String username;
	private String password;
	private String email;
	private String profileImg;
	private Timestamp updatedAt;
	private Timestamp createdAt;

	public User(String username, String password, String email) {
		this.username = username;
		this.password = password;
		this.email = email;
	}

}
