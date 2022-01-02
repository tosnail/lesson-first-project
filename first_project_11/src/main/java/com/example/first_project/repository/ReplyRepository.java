package com.example.first_project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.first_project.model.Reply;



public interface ReplyRepository extends JpaRepository<Reply, Long>{
	
	@Modifying
	@Query(value="insert into reply(comments, regdate, bnum, cuserid, starrating) values(?1, now(), ?2, ?3, ?4)", nativeQuery = true)
	public void commentsInsert(String comments, Long bnum, Long cuserid, Long starrating);
	
	//댓글 목록
	@Query(value="select sc.* from reply sc where bnum=?1",nativeQuery = true)
	public List<Reply> findByBnum(Long bnum);
	
	//댓글 상세
	@Query(value="select sc.* from reply sc where cnum=?1",nativeQuery = true)
	public Reply findByCNum(Long cnum);
	
	//댓글 별점 평균
	@Query(value="select round(avg(starrating),2) from firstproject.reply where bnum=?1 group by bnum",nativeQuery = true)
	public String findAVG(Long bnum);
}
