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
  <h2>프로그램</h2>
  	<form action="insert" method="post" >
  	<div class="form-group">
  	<label for="title">제목:</label>
	<input type="text" name="title" class="form-control" placeholder="Enter title"><br>
	</div>
	<div class="form-group">
	<label for="year">연도 :</label>
	<input type="text" name="year"  class="form-control" placeholder="Enter year"><br>
	</div>
	<div class="form-group">
	<label for="synopsis">소개:</label>
	<textarea name="synopsis" class="form-control" rows="5" id="synopsis"></textarea>
	</div>
	<div class="form-group">
	<label for="category">분류:</label>
	<select name="category" class="form-control">
   <option value="movie">영화</option>
   <option value="programs">방송</option>
   </select>
   </div>
  <div class="form-group">
  <label for="director">감독 이름:</label>
	<input type="text" name="director" class="form-control" placeholder="Enter director">
	</div>
	<div class="form-group">
	<label for="studio">제작사 번호:</label>
	<input type="text" name="studio" class="form-control" placeholder="Enter studio"><br>
	</div>
	<div class="form-group">
	<label for="files">포스터이미지 번호:</label>
	<input type="text" name="files" class="form-control" placeholder="Enter files">
	</div>
	<button type="submit" class="btn btn-dark"> 등록</button>
	</form>
  	
</div>

 </div>
   </div>
   </div>
   
</main>
   <!-- footer --> <%@ include file="../includes/footer.jsp"%>
   
   
   <!-- JS here --> <%@ include file="../includes/script.jsp"%>
</body>
 
 