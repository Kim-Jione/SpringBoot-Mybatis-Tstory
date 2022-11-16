package site.metacoding.firstapp.domain.category;

import java.sql.Timestamp;

import lombok.Getter;

@Getter
public class Category {
	private Integer usersId;
	private String username;
	private String password;
	private String email;
	private String profileImg;
	private Timestamp updatedAt;
	private Timestamp createdAt;
}
