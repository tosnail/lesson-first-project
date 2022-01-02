<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- start --> <%@ include file="../includes/start.jsp"%>

<head>
<link rel='stylesheet' href='/resources/list/style.css'>

</head>

<body>
	<!-- header --> <%@ include file="../includes/header.jsp"%>
	
<main>
<div class="slider-area ">
            <div class="slider-active">
                <div class="single-slider slider-height slider-padding sky-blue d-flex align-items-center">
	<div class="container">

	<h2>댓글 수정하기</h2>
	<input type="hidden" id="cnum" name="cnum" value="${reply.cnum}">
	<div class="form-group">
		<label for="cuserid">작성자:</label>
		<input type="text" class="form-control" id="cuserid" value="${reply.user.userid }" name="cuserid" readonly="readonly">
	</div>
	
	<div class="form-group">
		<label for="comments">댓글:</label>
		<input type="text" class="form-control" id="comments" value="${reply.comments }" name="year" >
	</div>
	
	<div class="form-group text-right">
		<button type="button" class="btn btn-primary btn-sm" id="btnUpdate">수정하기</button>
	</div>
	
	</div></div></div></div>
</main>
   <!-- footer --> <%@ include file="../includes/footer.jsp"%>
   
   
	<!-- JS here --> <%@ include file="../includes/script.jsp"%>

	
<script>

$("#btnUpdate").click(function(){
	var dataParam = {
			"cnum": $("#cnum").val(),
			"cuserid": $("#cuserid").val(),
			"comments": $("#comments").val()
			
	}
	$.ajax({
		type: "put",
		url: "/program/commentUpdate",
		data: JSON.stringify(dataParam),
		contentType:"application/json;charset=utf-8"
	})
	.done(function(){
		alert("수정성공")
		location.href="/program/list";
	})
	.fail(function(){
		alert("수정실패")
	})
})

</script>
</body>