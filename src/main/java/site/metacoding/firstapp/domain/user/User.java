package site.metacoding.firstapp.domain.user;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class User {
	private Integer userId;
    private String loginId;
    private String password;
    private String email;
    private String nickname;
    private Integer age;
    private Date birthday;
    private String gender;
    private String profileImg;
    private String role;
	private Timestamp createdAt;
    private Timestamp updatedAt;

    public User(String loginId, String password, String email, String nickname, String gender, Date birthday, Integer age) {
        this.loginId = loginId;
        this.password = password;
        this.email = email;
        this.nickname = nickname;
        this.gender = gender;
        this.birthday = birthday;
        this.age = age;
    }
}