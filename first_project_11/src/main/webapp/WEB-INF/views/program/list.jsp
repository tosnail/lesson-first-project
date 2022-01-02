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

		<c:forEach items="${lists }" var="program" varStatus="st">


			<div class="movie-card">
				<div class="movie-header manOfSteel">
					<a href="/program/view/${program.programnum}"> <img
						src="/images/${program.files.filename}"
						style="width: 315px; height: 367px;">
					</a>

				</div>
				<!--movie-header-->
				<div class="movie-content">
					<div class="movie-content-header">
						<a href="#">
							<h3 class="movie-title">${program.title }</h3>
						</a>
						<div class="imax-logo"></div>
					</div>
					<div class="movie-info">
						<div class="info-section">
							<label>연도</label> <span>${program.year }</span>
						</div>
						<!--date,time-->
						<div class="info-section">
							<label>감독</label> <span>${program.director.directorname}</span>
						</div>
						<!--screen-->
						<div class="info-section">
							<label>제작사</label> <span>${program.studio.studioname }</span>
						</div>
						<!--row-->
						<div class="info-section">
							<label>조회수</label> <span>${program.hitcount }</span>
						</div>
						<!--seat-->
					</div>
				</div>
				<!--movie-content-->
			</div>
			<!--movie-card-->
		</c:forEach>

		
	</div>

	<!--container-->
	</div>
	</div>
	</div>
	
	
</main>
   <!-- footer --> <%@ include file="../includes/footer.jsp"%>
   
   
	<!-- JS here --> <%@ include file="../includes/script.jsp"%>
</body>
</html>