<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- start --> <%@ include file="./includes/start.jsp"%>

<head>
<link rel='stylesheet' href='/resources/list/style.css'>

</head>

<body>
   <!-- header --> <%@ include file="./includes/header.jsp"%>
   
<main>
<div class="slider-area ">
            <div class="slider-active">
                <div class="single-slider slider-height slider-padding sky-blue d-flex align-items-center">
   <div class="container">
	<h2>출연진</h2>

	<div class="container">
		<form action="castmatesinsert" method="post" >
	<div class="form-group">
	<label for="actor">배우 이름:</label>
	  <input type="text" name="actor" class="form-control" placeholder="Enter actorname">
	</div>
	<div class="form-group">
	<label for="programnum">프로그램 번호:</label>
	  <input type="text" name="program" class="form-control" placeholder="Enter programnum">
	</div>
	<button type="submit" class="btn btn-dark">등록</button>
	</form>
	</div>
	
</div>
</div>
   </div>
   </div>
   
</main>
   <!-- footer --> <%@ include file="./includes/footer.jsp"%>
   
   
   <!-- JS here --> <%@ include file="./includes/script.jsp"%>
</body>
</html>