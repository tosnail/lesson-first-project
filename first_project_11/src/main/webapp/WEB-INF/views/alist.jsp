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
		  <h3>파일 목록</h3>
  <table class="table table-hover">
    <thead>
      <tr>
     	<th>파일 번호</th>
        <th>파일 이름</th>
      </tr>
    </thead> 
    <tbody>    
    <c:forEach items="${files }" var="files" varStatus="st">
    <tr>    
    <td>${files.fno }</td>
    <td>${files.fileOriName }</td>   
    </tr>    
    </c:forEach>
     </tbody>
  </table>
  <h3>스튜디오 목록</h3>
   <table class="table table-hover">
    <thead>
      <tr>
     	<th>스튜디오 번호</th>
        <th>스튜디오 이름</th>
      </tr>
    </thead> 
    <tbody>
    <c:forEach items="${studio }" var="studio" varStatus="st">
    <tr>
    <td>${studio.studionum }</td>
    <td>${studio.studioname }</td>
    </tr>    
    </c:forEach>
    </tbody>
  </table>
  <h3>배우 목록</h3>
   <table class="table table-hover">
    <thead>
      <tr>
     	<th>배우 이름</th>
        <th>배우 성별</th>
      </tr>
    </thead> 
    <tbody>
    <c:forEach items="${actor }" var="actor" varStatus="st">
    <tr>
    <td>${actor.actorname }</td>
    <td>${actor.gender }</td>
    </tr>    
    </c:forEach>
    </tbody>
  </table>
   <h3>감독 목록</h3>
   <table class="table table-hover">
    <thead>
      <tr>
     	<th>감독 이름</th>
        <th>감독 성별</th>
      </tr>
    </thead> 
    <tbody>
    <c:forEach items="${director }" var="director" varStatus="st">
    <tr>
    <td>${director.directorname }</td>
    <td>${director.gender }</td>
    </tr>    
    </c:forEach>
    </tbody>
  </table>
   <h3>출연정보 목록</h3>
   <table class="table table-hover">
    <thead>
      <tr>
     	<th>출연정보 번호</th>
        <th>배우 이름</th>
        <th>프로그램 번호</th>
      </tr>
    </thead> 
    <tbody>
    <c:forEach items="${castmates }" var="castmates" varStatus="st">
    <tr>
    <td>${castmates.castmatesnum }</td>
    <td>${castmates.actor.actorname }</td>
    <td>${castmates.program.programnum }</td>
    </tr>    
    </c:forEach>
    </tbody>
  </table>
</div>

   </div>
   </div>
   </div>
   
</main>
   <!-- footer --> <%@ include file="./includes/footer.jsp"%>
   
   
   <!-- JS here --> <%@ include file="./includes/script.jsp"%>
</body>
</html>