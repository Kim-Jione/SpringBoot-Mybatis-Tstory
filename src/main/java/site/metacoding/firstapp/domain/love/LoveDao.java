package site.metacoding.firstapp.domain.love;

import java.util.List;

import site.metacoding.firstapp.web.dto.response.admin.LoveRankDto;

public interface LoveDao {

	public Love findById(Integer loveId);

	public List<Love> findAll();

	public void insert(Love love);

	public void update(Love love);

	public void delete(Integer loveId);

	public List<LoveRankDto> findAllLoveRank();
}
