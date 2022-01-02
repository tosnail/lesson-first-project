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
	<h2>포스터이미지</h2>

	<div class="container">
		<form action="fileinsert" method="post"
			enctype="multipart/form-data">
			<input type="file" name="files"> 
			<br>
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