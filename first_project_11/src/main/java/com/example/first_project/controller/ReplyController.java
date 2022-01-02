package com.example.first_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.first_project.config.auth.PrincipalDetails;
import com.example.first_project.model.Program;
import com.example.first_project.model.Reply;
import com.example.first_project.service.ReplyService;


@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	//댓글추가
	@PostMapping("insert/{num}")
	public ResponseEntity<String> commentInsert(@PathVariable Long num, 
												@RequestBody Reply comment, 
												@AuthenticationPrincipal PrincipalDetails principal) {
		Program b=new Program();
		b.setProgramnum(num);
		comment.setProgram(b);
		comment.setUser(principal.getUser());
		
		replyService.commentInsert(comment);
		return new ResponseEntity<String> ("success",HttpStatus.OK);
	}
	
	//댓글리스트
	@GetMapping("list/{num}")
	public List<Reply> list(@PathVariable Long num){
		List<Reply> replylist=replyService.list(num);
		return replylist;
	}
	

		
	//댓글삭제
	@DeleteMapping("delete/{bnum}/reply/{cnum}")
	public Long commentdelete(@PathVariable Long bnum, @PathVariable Long cnum) {
		replyService.delete(bnum, cnum);
		return cnum;
	}
}




