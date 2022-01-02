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

        
        <!-- Applic App Start -->
        <div class="applic-apps section-padding2">
            <div class="container-fluid">
                <div class="row">
                    <!-- slider Heading -->
                    <div class="col-xl-4 col-lg-4 col-md-8">
                        <div class="single-cases-info mb-30">
                            <h3>찜한🥰<br> 영화 목록</h3>
                            <p></p>
                          </div>
                    </div>
                    <!-- OwL -->
                    <div class="col-xl-8 col-lg-8 col-md-col-md-7">
                        <div class="app-active owl-carousel"> 
			
			 				 	<c:forEach items="${movielists }" var="program" varStatus="status1">
									<c:forEach items="${likelists }" var="likelist" varStatus="status">
									 	<c:set var="likelistpnum" value="${likelist.program.programnum }" /> 
										<c:set var="programpnum" value="${program.programnum }" />
									 	<c:if test="${likelistpnum eq programpnum}">
											<a href="/program/view/${program.programnum}">
											<img src="/images/${program.files.filename}"></a>
										</c:if> 
								</c:forEach> 
							</c:forEach>  
							
							
						</div>

						



					</div>
                </div>
            </div>
        </div>
        <!-- Applic App End -->
        
        <!-- Applic App Start -->
        <div class="applic-apps section-padding2">
            <div class="container-fluid">
                <div class="row">
                    <!-- slider Heading -->
                    <div class="col-xl-4 col-lg-4 col-md-8">
                        <div class="single-cases-info mb-30">
                            <h3>찜한🥰<br> TV프로그램 목록</h3>
                            <p></p>
                        </div>
                    </div>
                    <!-- OwL -->
                    <div class="col-xl-8 col-lg-8 col-md-col-md-7">
                        <div class="app-active owl-carousel"> 
                            
							<c:forEach items="${programslists }" var="program" varStatus="status1">
								<c:forEach items="${likelists }" var="likelist" varStatus="status">
									 	<c:set var="likelistpnum" value="${likelist.like }" /> 
										<c:set var="programpnum" value="${program.programnum }" />
									 	<c:if test="${likelistpnum eq programpnum}">
											<a href="/program/view/${program.programnum}">
											<img src="/images/${program.files.filename}"/></a>
										</c:if> 
								</c:forEach> 
							</c:forEach>  

						</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Applic App End -->

</main>
   <!-- footer --> <%@ include file="../includes/footer.jsp"%>
   
   
	<!-- JS here --> <%@ include file="../includes/script.jsp"%>
</body>
</html>

