package site.metacoding.firstapp.web.dto.response.post;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PagingDto {
	private Integer blockCount; // 상수 한페이지에 페이지 넘수 개수(5) 1-5, 6-10
	private Integer currentBlock;
	private Integer startPageNum;
	private Integer lastPageNum;
	private Integer totalCount;
	private Integer totalPage;
	private Integer currentPage;
	private boolean isLast;
	private boolean isFirst;
	private String keyword;

	public void makeBlockInfo() {
		this.blockCount = 5;
		this.currentBlock = currentPage / blockCount;
		this.startPageNum = 1 + blockCount * currentBlock; // 1
		this.lastPageNum = 5 + blockCount * currentBlock; // 5

		if (totalPage < lastPageNum) {
			this.lastPageNum = totalPage;
		}
	}

	public void makeBlockInfoByPostAll(String keyword) {
		this.keyword = keyword;
		this.blockCount = 5;
		this.currentBlock = currentPage / blockCount;
		this.startPageNum = 1 + blockCount * currentBlock; // 1
		this.lastPageNum = 5 + blockCount * currentBlock; // 5

		if (totalPage < lastPageNum) {
			this.lastPageNum = totalPage;
		}
	}
}