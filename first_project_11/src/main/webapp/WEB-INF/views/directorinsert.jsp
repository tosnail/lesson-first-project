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
	<h2>감독</h2>
	<div class="container">
		<form action="directorinsert" method="post" >
		<div class="form-group">
			<label for="directorname">감독 이름</label>
			<input type="text" name="directorname" class="form-control" placeholder="Enter directorname" ><br>
			</div>
		<div class="form-group">
		<input type="radio" name="gender" value="male" id="gender" />
   			<label for="man">남성</label>
			<input type="radio" name="gender" value="female" id="gender"/>
    		<label for="woman">여성</label>
	
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