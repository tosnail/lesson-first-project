package com.example.first_project.service;

import java.util.List;


import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.first_project.model.Program;
import com.example.first_project.model.Reply;
import com.example.first_project.repository.ReplyRepository;
import com.example.first_project.repository.ProgramRepository;



@Service
public class ReplyService {
	@Autowired
	private ReplyRepository replyRepository;
	
	@Autowired
	private ProgramRepository programRepository;
	
	//댓글쓰기
	@Transactional
	public void commentInsert(Reply comment) {
		
		Program b=programRepository.findById(comment.getProgram().getProgramnum()).get();
		b.setReplycnt(b.getReplycnt()+1);
		
		replyRepository.commentsInsert(
				comment.getComments(), 
				comment.getProgram().getProgramnum(),
				comment.getUser().getUserid(),
				comment.getStarrating()
				);
	}
	
	//댓글리스트
	public List<Reply> list(Long bnum){
		return replyRepository.findByBnum(bnum);
	}
	
	//댓글상세보기 
	@Transactional
	public Reply findByCNum(Long cnum) {
		Reply reply = replyRepository.findByCNum(cnum);
		return reply;
	}
	
	//댓글수정
	@Transactional 
	public void commentUpdate(Reply reply) {
		Reply r = replyRepository.findByCNum(reply.getCnum());
		r.setComments(reply.getComments());
	}
		
	//댓글삭제
	@Transactional
	public void delete(Long bnum, Long cnum) {
		Program b = programRepository.findById(bnum).get();
		replyRepository.deleteById(cnum);
		Long replycnt = b.getReplycnt()-1;
		b.setReplycnt(replycnt);
	}
	
	//별점평균
	public String findAVG(Long bnum){
		return replyRepository.findAVG(bnum);
	}
	
}





