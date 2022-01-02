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

<div class="container">
  <h2>User List(${count })</h2>
  		
  <table class="table table-hover">
    <thead>
      <tr>
     	<th>번호</th>
        <th>이름</th>
        <th>이메일</th>
        <th>성별</th>
        <th>권한</th>
        <th></th>
      </tr>
    </thead> 
    <tbody>
    
    <c:forEach items="${lists.content }" var="user" varStatus="st">
   
    <tr>
    
    <td>${user.userid }</td>
    <td>${user.username }</td>
    <td>${user.email }</td>
    <td>${user.gender }</td>
    <td>${user.role }</td>
    <td><button type="button" onclick="fundelete(${user.userid})">삭제</button></td>
    </tr>    
   
    </c:forEach>
    
    </tbody>
  </table>

  <div class="d-flex justify-content-between mt-5" >
   <ul class="pagination">
  		<c:if test="${lists.first == false }">
  		<li class="page-item"><a class="page-link" href="?page=${lists.number-1 }">이전</a></li>
  		</c:if>
  		
  		<c:if test="${lists.last == false }">
  		<li class="page-item"><a class="page-link" href="?page=${lists.number+1 }">다음</a></li>
  		</c:if>
  </ul>

</div>
</div>
</div>
   </div>
   </div>
   </div>
   
</main>
   <!-- footer --> <%@ include file="../includes/footer.jsp"%>
   
   
   <!-- JS here --> <%@ include file="../includes/script.jsp"%>

<script>
function fundelete(userid){
	$.ajax({
		type:"DELETE",
		url:"/delete/"+userid,
	})
	.done(function(resp){
		alert(resp+"번 삭제성공")
		location.href="/userlist"
	})
	.fail(function(e){
		alert("삭제실패")
	})
}

</script>
</body>
</html>