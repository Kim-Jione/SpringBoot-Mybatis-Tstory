package site.metacoding.firstapp.domain.qna;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class Qna {
    private Integer qnaId;
    private String qnaTitle;
    private String qnaContent;
    private String qnaImg;
	private Integer userId;
    private Integer categoryId;
	private Timestamp createdAt;
    private Timestamp updatedAt;
    
    @Builder
    public Qna(Integer qnaId, String qnaTitle, String qnaContent, String qnaImg, Integer userId,Integer categoryId) {
        super();
        this.qnaId = qnaId;
        this.qnaTitle = qnaTitle;
        this.qnaContent = qnaContent;
        this.qnaImg = qnaImg;
        this.userId = userId;
        this.categoryId = categoryId;
    }
}
