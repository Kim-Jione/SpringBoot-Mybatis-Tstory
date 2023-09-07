package site.metacoding.firstapp.domain.user_interest;

import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface  UserInterestDao {
                              
    public UserInterest findById(Integer userInterestId);

	public List<UserInterest> findAll();

	public void insert(UserInterest userInterest);

	public void insertJoin(@Param("userId") Integer userId, @Param("categoryId") Integer categoryId, @Param("interestTitle") String interestTitle);

	public void insertPersonal(@Param("userId") Integer userId, @Param("userInterest") String userInterest);
	
	public void update(UserInterest userInterest);

	public void delete(Integer userInterestId);



}
