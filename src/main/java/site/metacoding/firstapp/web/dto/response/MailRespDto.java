package site.metacoding.firstapp.web.dto.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MailRespDto {
	private String address;
	private String title;
	private String message;
}
