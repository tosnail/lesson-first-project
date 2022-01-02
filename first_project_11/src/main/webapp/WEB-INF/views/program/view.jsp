<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- start -->
<%@ include file="../includes/start.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<head>
<link rel='stylesheet' href='/resources/list/view.css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<body>

                              
   <!-- header -->
   <%@ include file="../includes/header.jsp"%>
   <main>
      <div class="slider-area ">
      
      
         <div class="slider-active">
            <div
               class="single-slider slider-height slider-padding sky-blue d-flex align-items-center">
               <div class="container">


                  <div class="movie-card">
                  

                     <div class="container2">
            


                        <img
                           src="/images/${program.files.filename}"
                           style="width: 187px; height: 282px;" salt="cover" class="cover" />

                        <div class="hero">

                           <div class="details">

                              <div class="title1">${program.title }
                                 <span>${program.year }</span>
                              </div>
                              
                               <div class="title2">${replys }</div>


                              
                              
<fieldset class="rating">
    <input type="radio" id="star5" name="rating" value="5" />
    <label class = "full" for="star5" title="Awesome - 5 stars"></label>
    <input type="radio" id="star4half" name="rating" value="4 and a half" />
    <label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
    <input type="radio" id="star4" name="rating" value="4" checked />
    <label class = "full" for="star4" title="Pretty good - 4 stars"></label>
    <input type="radio" id="star3half" name="rating" value="3 and a half" />
    <label class="half" for="star3half" title="Meh - 3.5 stars"></label>
    <input type="radio" id="star3" name="rating" value="3" />
    <label class = "full" for="star3" title="Meh - 3 stars"></label>
    <input type="radio" id="star2half" name="rating" value="2 and a half" />
    <label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
    <input type="radio" id="star2" name="rating" value="2" />
    <label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
    <input type="radio" id="star1half" name="rating" value="1 and a half" />
    <label class="half" for="star1half" title="Meh - 1.5 stars"></label>
    <input type="radio" id="star1" name="rating" value="1" />
    <label class = "full" for="star1" title="Sucks big time - 1 star"></label>
    <input type="radio" id="starhalf" name="rating" value="half" />
    <label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
</fieldset>

							
                              <span class="likes"> ${program.hitcount } views</span>
                              <a class="likeResult"></a>

                           </div>
                           <!-- end details -->

                        </div>
                        <!-- end hero -->

                        <div class="description">

                           <div class="column1">
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<span class="tag" id="btnUpdate">수정</span>
									<span class="tag" id="btnDelete">삭제</span>
								</sec:authorize>
							</div>
                           <!-- end column1 -->

                           <div class="column2">

                              <p>
                              <dt>감독</dt>
                              ${program.director.directorname }
                              </p>
                              <p><dt>출연</dt>
                              
                                 <c:forEach items="${castlist }" var="cast" varStatus="status">
                                    ${cast.actor.actorname}
                                 </c:forEach>
                              
                              </p>
                              <p>
                              <dt>소개</dt>
                              ${program.synopsis }
                              </p>



                           </div>
                           <!-- end column2 -->
                        </div>
                        <!-- end description -->



                     </div>
                     <!-- end container -->
                  </div>
                  <!-- end movie-card -->


                  <!-- start hidden form -->
                  <div class="form-group">
                     <input type="hidden" class="form-control" id="num"
                        value="${program.programnum }" name="num" readonly="readonly">
                  </div>

                  <div class="form-group">
                     <input type="hidden" class="form-control" id="title"
                        value="${program.title }" name="title" readonly="readonly">
                  </div>

                  <div class="form-group">
                     <input type="hidden" class="form-control" id="year"
                        value="${program.year }" name="year" readonly="readonly">
                  </div>

                  <div class="form-group">
                     <input type="hidden" class="form-control" id="director"
                        value="${program.director.directorname }" name="director"
                        readonly="readonly">
                  </div>
                  


                  <div class="form-group">
                     <input type="hidden"
                        class="form-control" id="avg" value="${replys }" name="avg"
                        readonly="readonly">
                  </div>
                  <!-- end hidden form -->
               </div>
            </div>
         </div>
      </div>



               <div class="container">

                  <!-- start comment -->
                  <div class="container mt-5">
                     <div class="form-group">
                        별점 <input type="radio" id="starrating1" name="starrating"
                           value="1"><label for="starrating1">★</label> <input
                           type="radio" id="starrating2" name="starrating" value="2"><label
                           for="starrating2">★★</label> <input type="radio"
                           id="starrating3" name="starrating" value="3"><label
                           for="starrating3">★★★</label> <input type="radio"
                           id="starrating4" name="starrating" value="4"><label
                           for="starrating4">★★★★</label> <input type="radio"
                           id="starrating5" name="starrating" value="5"><label
                           for="starrating5">★★★★★</label>

                        <textarea class="form-control" rows="5" id="msg" name="text" placeholder="댓글내용을 작성하세요."></textarea>
                     </div>
                     <button type="button" class="btn btn-dark" id="commentBtn">등록</button>
                  </div>

                  <div id="replyResult"></div>
                  
                  

                  <!-- end comment -->

               </div>
               
               

   </main>
   
                                 
   

   <!-- footer -->
   <%@ include file="../includes/footer.jsp"%>

   <!-- JS here -->
   <%@ include file="../includes/script.jsp"%>
   <script>

var init=function(){
   $.ajax({
      type:"get",
      url:"/reply/list/"+$("#num").val()
   })
   .done(function(resp){
   
      var str="<table class='table table-hover mt-3'>";
      $.each(resp,function(key,val){

         str+="<tr>"
         str+="<td>"+val.user.username+"</td>"
         str+="<td>"+val.comments+"</td>"
         str+="<td>"+val.regdate+"</td>"
         str+="<td>"+ "별점 : "+val.starrating+"</td>"
         
         if("${principal.user.username}" == val.user.username) {
         str += "<td><a href='javascript:fupdate("+val.cnum+")'>수정</a></td>" 
         str += "<td><a href='javascript:fdel("+val.program.programnum+","+val.cnum+")'>삭제</a></td>" 
            }
         str+="</tr>"
      })
      str+="</table>"
      $("#replyResult").html(str);
   })
   .fail(function(e){
      alert("error:"+e);
   })
   
}

//댓글수정
function fupdate(cnum) {
   if(confirm('정말 수정할까요?')){
      location.href="/program/commentUpdate/"+cnum
      }
   }


//댓글삭제
function fdel(bnum,cnum){
   $.ajax({
      type:"delete",
      url:"/reply/delete/"+bnum+"/reply/"+cnum
   })
   .done(function(resp){
      alert(resp+"번 글 삭제 성공")
      init();
   })
   .fail(function(){
      alert("댓글 삭제 실패")
   })
   
}

$("#btnUpdate").click(function(){
   if(confirm('정말 수정할까요?')){
      location.href="/program/update/${program.programnum}"
   }
})

$("#btnDelete").click(function(){
   if(confirm("정말 삭제할까요?")) {
   $.ajax({
      type:"delete",
      url:"/program/delete/${program.programnum}",
      success:function(resp){
         if(resp=="success"){
            alert("삭제성공")
            location.href="/program/list"
         
         }//if
      },//success
      error: function(e){
         alert("삭제실패");
      }
   })//ajax
   }//confirm
})//btn

//댓글쓰기
$("#commentBtn").click(function(){
   
   if(${empty principal.user}){
      alert("로그인하세요");
      location.href="/login";
      return;
   } 
   
   if($("#msg").val()==""){
      alert("댓글을 적으세요")
      return;
   }
   
   var data={
         "bnum"      :$("#num").val(),
         "comments"   :$("#msg").val(),   
         "starrating":$(":input:radio[name=starrating]:checked").val()
   }
   
   $.ajax({
      type:"post",
      url:"/reply/insert/"+$("#num").val(),
      contentType:"application/json;charset=utf-8",
      data:JSON.stringify(data)
   })
   .done(function(resp){
      alert("댓글추가 성공")
      location.reload();
      init();
      
   })
   .fail(function(){
      alert("댓글추가 실패")
   })
})



function likeview() { 
   if(${empty principal.user}){
      return;
      
   }else{ 

   var pnum = ${program.programnum }
      $.ajax({
         url : '/program/like/view/'+${program.programnum },
         type : 'post',
         success:function(resp){
         var str = " ";
            if (resp != 0) {   // 현재 로그인 유저가 포스팅 좋아요를 눌렀음
            	 str +="<img href='#javascript' style='width: 20px; height: 20px;' src='https://github.com/kimxminsu/reviewboard-springboot/blob/main/reviewboard/src/main/webapp/resources/assets/img/like/like.png?raw=true' onclick='unlikes("+ pnum +")'></img> 좋아요 취소"
                 
                 
            } else if (resp == 0) { // 안눌렀음
               str +="<img href='#javascript' style='width: 20px; height: 20px;' src='https://github.com/kimxminsu/reviewboard-springboot/blob/main/reviewboard/src/main/webapp/resources/assets/img/like/unlike.png?raw=true' onclick='likes("+ pnum +")'></img> 좋아요 " 

                  
            }
            $('.likeResult').html(str); 
         },//success
         error: function(e){
            alert("likeview실패");
         }
      });//ajax   
      return;
   }      
            
} 

   
   $(document).ready(function() { // 페이지가 준비되면
      likeview(); 
   });


    function likes(pnum){
      $.ajax({
         type : 'post',
         url : '/program/likes/' + pnum,
         success:function(resp){
         if(resp=="success"){
            likeview();
         
         }//if,
         },//success
         error: function(e){
            alert("like실패");
         }
      });//ajax
   } 
      
   function unlikes(pnum){
      $.ajax({
         type : 'post',
         url : '/program/unlikes/' + pnum,
         success:function(resp){
            if(resp=="success"){
               likeview();
            
            }//if,
            },//success
            error: function(e){
               alert("unlike실패");
            }   
         });//ajax
   }
 

init();
</script>
</body>