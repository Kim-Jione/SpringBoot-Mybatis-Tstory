package site.metacoding.firstapp.domain.visit;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.metacoding.firstapp.web.dto.response.visit.CountDto;

public interface VisitDao {

	public Visit findById(Integer visitId);

	public List<Visit> findAll();

	public void insert(Visit visit);

	public void update(Visit visit);

	public void delete(Visit visit);

	public CountDto findByVisitCount(Integer userId);

	public void countByVisit(@Param("userId") Integer userId, @Param("postId") Integer postId);

}
