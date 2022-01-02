<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<title>회원가입</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/resources/assets/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/assets/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/assets/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/assets/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<!--  <form class="login100-form validate-form flex-sb flex-w" > -->
					<span class="login100-form-title p-b-51">
						회원가입
					</span>

					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
						<input id="username" class="input100" type="text" name="username" placeholder="Username">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input id="password" class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "email is required">
						<input id="email" class="input100" type="email" name="email" placeholder="Email">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="flex-sb-m w-full p-t-3 p-b-24">
			
							<input type="radio" name="gender" value="male" id="gender" checked/>
				   			<label class="txt1" for="man">남성</label>
							<input type="radio" name="gender" value="female" id="gender"/>
				    		<label class="txt1" for="woman">여성</label>
						
						
						<!--
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="radio" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								Remember me
							</label>
						</div>
						-->
						<div></div>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<button id="btnJoin" class="login100-form-btn">
							회원가입
						</button>
					</div>
					<div class="container-login100-form-btn m-t-17">
						<button onclick="location.href='/login' " id="btnJoin" class="login100-form-btn2">
							로그인으로 이동
						</button>
					</div>

				<!--</form>-->
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="/resources/assets/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/assets/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/assets/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/assets/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/assets/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/assets/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/resources/assets/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/resources/assets/js/login.js"></script>

<script>
$("#btnJoin").click(function(){
	if($("#username").val()==""){
		alert("아이디를 입력하세요")
		$("#username").focus()
		return false;
	}
	if($("#password").val()==""){
		alert("비밀번호를 입력하세요")
		$("#password").focus()
		return false;
	}
	if($("#email").val()==""){
		alert("이메일를 입력하세요")
		$("#email").focus()
		return false;
	}
	
	
	var emailVal = $("#email").val();
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 검증에 사용할 정규식 변수 regExp에 저장
	if (emailVal.match(regExp) != null) {}
	else { 
		alert('이메일 형식이 잘못되었습니다');
		$("#email").val("");
		return false;
	}
	
	var data={
			"username":$("#username").val(),
			"password":$("#password").val(),
			"email"	  :$("#email").val(),
			"gender"  :$('input[name="gender"]:checked').val()
	}
	$.ajax({
		type:"post",
		url:"/register",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)	
	})
	.done(function(resp){
		if(resp=="success"){
			alert("회원가입 성공");
			location.href="/login";
		}else if(resp=="fail"){
			alert("아이디 중복");
			$("#username").val("");
		}
	})
	 .fail(function(){
			 alert("회원가입실패");
		 })
})

</script>

</body>
</html>