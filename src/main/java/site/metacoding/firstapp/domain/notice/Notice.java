package site.metacoding.firstapp.domain.notice;

import java.sql.Timestamp;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class Notice {
	private Integer noticeId;
    private String title;
    private String content;
    private Integer adminId;
	private Timestamp createdAt;
    private Timestamp updatedAt;    
}