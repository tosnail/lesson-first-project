package com.example.first_project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.first_project.model.Program;
import com.example.first_project.model.User;
import com.example.first_project.model.Likelist;

public interface LikelistRepository extends JpaRepository<Likelist, Long>{
	List<Likelist> findLikelistByUser(User user);
	Likelist findLikelistByProgramAndUser(Program program, User user);
	
	@Modifying
	@Query(value = "insert into likelist(programnum, userid) values(:programnum,:userid)",nativeQuery = true)
	void likelist(Long programnum, Long userid);
	
	@Modifying
	@Query(value = "delete from likelist where programnum = :programnum and userid = :userid",nativeQuery = true)
	void unLikelist(Long programnum, Long userid);
	
	
}
