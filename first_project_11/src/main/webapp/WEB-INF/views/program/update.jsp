<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>  
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- start --> <%@ include file="../includes/start.jsp"%>
<div class="container mt-200">
   <h2>${pro.title }프로그램/영화 수정하기</h2>
   
   <input type="hidden" id="programnum" name="programnum" value="${program.programnum}">
   
   <div class="form-group  mt-30">
      <label for="title">제목:</label>
      <input type="text" class="form-control" id="title" value="${program.title }" name="title">
   </div>
   
   <div class="form-group">
      <label for="year">개봉연도:</label>
      <input type="text" class="form-control" id="year" value="${program.year }" name="year" >
   </div>
   
   <div class="form-group">
      <label for="synopsis">줄거리:</label>
      <textarea class="form-control" rows="5" id="synopsis" name="synopsis">${program.synopsis }</textarea>
   </div>
   
   <div class="form-group text-right">
      <button type="button" class="btn btn-dark" id="btnUpdate">수정하기</button>
   </div>
<script>
$("#btnUpdate").click(function(){
   var dataParam = {
         "programnum": $("#programnum").val(),
         "title": $("#title").val(),
         "year": $("#year").val(),
         "synopsis": $("#synopsis").val(),
         
   }
   $.ajax({
      type: "put",
      url: "/program/update",
      data: JSON.stringify(dataParam),
      contentType:"application/json;charset=utf-8"
   })
   .done(function(){
      alert("수정성공")
      location.href="/program/list"
   })
   .fail(function(){
      alert("수정실패")
   })
})
</script>   
   <!-- footer --> <%@ include file="../includes/footer.jsp"%>
</div>