package site.metacoding.firstapp.domain.comment;
import java.sql.Timestamp;

import lombok.Builder;
import lombok.Getter;

@Getter
public class Comment {
    private Integer commentId;
	private String commentContent;
    private Integer parentCommentId;
	private Integer userId;
	private Integer targetId;
	private String targetType;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	
	@Builder
    public Comment(Integer commentId,Integer userId,Integer targetId, String commentContent,String targetType, Integer parentCommentId) {
        super();
        this.commentId = commentId;
        this.userId = userId;
        this.targetId = targetId;
        this.targetType = targetType;
        this.commentContent = commentContent;
        this.parentCommentId = parentCommentId;
    }
}
