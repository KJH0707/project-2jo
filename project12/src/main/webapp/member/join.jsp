<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Fork and Knife | 회원 가입</title>

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

		
        <link rel="stylesheet" href="./assets/css/wizard.css"> 
        <link rel="stylesheet" href="./assets/css/join.css">   
        
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

		<!-- Include jQuery -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

		<!-- Include Date Range Picker -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<style>
#mem {
	background-color:black;
	color:white;
}

#mem:hover{
	background-color:black;
	color:white;
}

#st:hover{
	background-color:black;
	color:white;
}
</style>
        
<!-- 데이터 유효성 검사 -->
	<script type="text/javascript">
	
		// 일반, 사업자회원 구분
		function sep1(){
			var mem = document.getElementById("mem").value;
			document.getElementById("hid").value = mem;
			$('.ch').show();
		}
		
		function sep2(){
			var st = document.getElementById("st").value;
			document.getElementById("hid").value = st;
			$('.ch').hide();
		}
		
	
		// 회원가입 제어(유효성 체크)
		function send(){
			let id = $('#id').val();
			let name = $('#name').val();
			let email = $('#email').val();
			let nick = $('#nick').val();
			let tel = $('#tel').val();
			let pw = $('#pw').val();
			let pwc = $('#pwc').val();
			let hidEmail = $('#hidEmail').val(); 
			let agree = $('#agree');
			let noch = $('#noch').val();
			
			if(id.length == 0){
				alert('아이디를 입력해주세요');
				$('#id').focus();
				
			 	return;
			}
			
			if(id.length < 5){
				$('#id').focus();
			 	return;
			}
			
			if(!/^[a-zA-Z0-9]*$/.test(id)){
				$('#id').focus();
			 	return;
			}
			
			if(name.length == 0){
				alert('이름을 입력해주세요');
				$('#name').focus();
				
			 	return;
			}
			
			if(email.length == 0){
				alert('이메일을 입력해주세요');
				$('email').focus();
				
			 	return;
			}
			
			if(nick.length == 0){
				alert('닉네임을 입력해주세요');
				$('#nick').focus();
				
			 	return;
			}
			
			if(nick.length < 1){
				$('#nick').focus();
				
			 	return;
			}
			
			if(!/^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]*$/.test(nick)){
				$('#nick').focus();
				
			 	return;
			}
			
			if(tel.length == 0){
				alert('연락처를 입력해주세요');
				$('#tel').focus();
				
			 	return;
			}
			
			if(tel.length < 12){
				$('#tel').focus();
				
			 	return;
			}
			
			if(pw.length == 0){
				alert('비밀번호를 입력해주세요');
				$('#pw').focus();
				
			 	return;
			}
			
			if(pw.length < 6){
				$('#pw').focus();
				
			 	return;
			}
			
			if(pw == id) {
				$('#pw').focus();
				
			 	return;
			}
			
			if(!/^(?=.*[a-zA-Z])(?=.*[0-9]).{0,}$/.test(pw)){ 
				$('#pw').focus();
				
			 	return;
			}
			
			if(pwc.length == 0){
				alert('비밀번호 확인을 입력해주세요');
				$('#pwc').focus();
				
			 	return;
			}
			
			if(pwc.length < 6){
				$('#pwc').focus();
				
			 	return;
			}
			
			if(pwc != pw){
				alert('비밀번호를 다시 확인해주세요 ');
				$('#pwc').focus();
				
			 	return;
			}
			
			if(hidEmail == 0){
				alert('이메일 인증을 완료해주세요');
				$('#email').focus();
				
			 	return;
			}
			
			if(noch == 1) {
			 	alert('입력정보를 다시 확인해주세요');
							
			 	return;
			 }
			
			// 약관 동의 체크
			if(!agree[0].checked) {
				alert("개인정보이용에 동의해주세요");
				return;
			}
			
			document.fr.submit();
		}
		
		//// 약관 보기 /////

		function infoform(){

			window.open("./member/infoFormPopup.jsp","","width=500,height=500");

		} 
	
		/// 이메일 인증체크
		function emailcheck(email){

			 // 입력된 아이디정보
//	 		 var url="emailCheck.jsp?email="+email;
//	 	    open(url,"emailwindow", "statusbar=no, scrollbar=no, menubar=no, width=400, height=200" );

			// 새창열기
			window.open("./MemberEmailCheck.us?email="+email,"","width=400,height=200,top=300,left=500");
			
		 }	
		
		
	$(function(){

		$("#st").click(function(){
			$("#st").css({"background-color":"black", "color":"white"});
			$("#mem").css({"background-color":"#EAEAEA", "color":"black"});
		});
		
		$("#mem").click(function(){
			$("#mem").css({"background-color":"black", "color":"white"});
			$("#st").css({"background-color":"#EAEAEA", "color":"black"});
		});
		
	//////////// 유효성 체크 이벤트 ///////////////
	//////// 아이디 //////////////
	$("#id").on("blur", function(){
		if($("#id").val().trim() == "" ){
			$('#checkId').html("아이디를 입력하세요.");
			$('#checkId').attr('color','red');
			$('#noch').val(1);
		}

		if($("#id").val().length > 0 && $("#id").val().length < 6){
			$('#checkId').html("6자 이상 입력하세요.");
			$('#checkId').attr('color','red');
			$('#noch').val(1);
		}
	});
	// 중복체크
	$("#id").keyup(function() {
		let id = $("#id").val();
		
	  if(id.length > 5){
		$.ajax({
			url:'${pageContext.request.contextPath}/DCheckAction.us',
			method:'post',
			data:{id:id},
			dataType:'json',
			success:function(result){
				if(result == 1){
					$('#checkId').html('사용 중인 아이디입니다.');
					$('#checkId').attr('color','red');
					$('#noch').val(1);
				} else if(!/^[a-zA-Z0-9]*$/.test(id)){
					$('#checkId').html("대소문자, 숫자만 사용가능합니다.");
					$('#checkId').attr('color','red');
					$('#noch').val(1);
				} else if(result == 0) {
					$('#checkId').html('사용 가능한 아이디입니다.');
					$('#checkId').attr('color','green');
					$('#noch').val(0);
				}
				
			},
				error : function(){
				alert("실패");
			}
		});
	  }
		
	});
	////////// 아이디 ///////////////////
	
	///////// 이름  ////////////////////
	$("#name").on("blur", function(){
		if($("#name").val().trim() == "" ){
			$('#checkName').html("이름을 입력하세요.");
			$('#checkName').attr('color','red');
			$('#noch').val(1);
		} 
		
		if($("#name").val().length > 0 && $("#name").val().length < 2){
			$('#checkName').html("2자 이상 입력하세요");
			$('#checkName').attr('color','red');
			$('#noch').val(1);
		}
	});
	
	$("#name").keyup(function() { 
		if(! /^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z]*$/.test($("#name").val())){
			$('#checkName').html("한글, 영어로 입력하세요.");
			$('#checkName').attr('color','red');
			$('#noch').val(1);
		} else {
			$('#checkName').html("");
			$('#noch').val(0);
		}
	});
	///////// 이름  ////////////////////
	
	//////// 이메일 ///////////////////
	$("#email").on("blur", function(){
		if($("#email").val().trim() == "" ){
			$('#checkEmail').html("이메일을 입력하세요.");
			$('#checkEmail').attr('color','red');
			$('#noch').val(1);
		} 
	});
	
	// 이메일 중복 체크
	$("#email").keyup(function() {
		let email = $("#email").val();
  		
		$.ajax({
			url:'${pageContext.request.contextPath}/DCheckAction.us',
			method:'post',
			data:{email:email},
			dataType:'json',
			success:function(result){
				if(result == 1){
					$('#checkEmail').html('이미 가입된 이메일입니다.');
					$('#checkEmail').attr('color','red');
					$('#noch').val(1);
					$('#emailconfirm_btn').attr("disabled",true);
				} else if(!/^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z]+/.test(email)){
					$('#checkEmail').html("이메일 형식이 맞지 않습니다.");
					$('#checkEmail').attr('color','red'); 
					$('#emailconfirm_btn').attr("disabled",true);
				} else if (result == 0) {
					$('#checkEmail').html('사용 가능한 이메일입니다.');
					$('#checkEmail').attr('color','green');
					$('#noch').val(0);
					$('#emailconfirm_btn').attr("disabled",false);
				}
			},
				error : function(){
				alert("문제");
			}
		});
	  });
	
// 	$("#hidEmail").on("change keyup",function(){
// 		$("#emailconfirm_btn").hide();
// 	});
	
	//////// 이메일 ///////////////////
	
	
	//////// 닉네임 ///////////////////
	$("#nick").on("blur", function(){
		if($("#nick").val().trim() == "" ){
			$('#checkNick').html("닉네임을 입력하세요.");
			$('#checkNick').attr('color','red');
			$('#noch').val(1);
		} 
		
		if($("#nick").val().length > 0 && $("#nick").val().length < 2){
			$('#checkNick').html("2자 이상 입력하세요.");
			$('#checkNick').attr('color','red');
			$('#noch').val(1);
		}
	});
	
	// 닉네임 중복 체크
		$("#nick").keyup(function() {
		let nick = $("#nick").val();
		
		if(nick.length > 1){
		$.ajax({
			url:'${pageContext.request.contextPath}/DCheckAction.us',
			method:'post',
			data:{nick:nick},
			dataType:'json',
			success:function(result){
				if(result == 1){
					$('#checkNick').html('사용할 수 없는 닉네임입니다.');
					$('#checkNick').attr('color','red');
					$('#noch').val(1);
				} else if(!/^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]*$/.test(nick)){
					$('#checkNick').html("한글, 영어, 숫자만 사용 가능합니다.");
					$('#checkNick').attr('color','red');
					$('#noch').val(1);
				} else if (result == 0) {
					$('#checkNick').html('사용 가능한 닉네임입니다.');
					$('#checkNick').attr('color','green');
					$('#noch').val(0);
				}
			},
				error : function(){
				alert("실패");
			}
		});
		}
	});
	////////닉네임 ///////////////////
	
	///////// 연락처 /////////////////////
	$("#tel").on("blur", function(){
		if($("#tel").val().trim() == "" ){
			$('#checkTel').html("연락처를 입력하세요.");
			$('#checkTel').attr('color','red');
			$('#noch').val(1);
		}
		
	 if($("#tel").val().length < 13 && $("#tel").val().length > 0){
		if(!/^\d{3}-\d{4}-\d{4}$/.test(tel)){
			$('#checkTel').html("연락처 형식에 맞지 않습니다.");
			$('#checkTel').attr('color','red');
			$('#noch').val(1);
		}
	  }

	});
	// 중복체크
	$("#tel").keyup(function() {
		let tel = $("#tel").val();
		
	  if(tel.length > 12){
		$.ajax({
			url:'${pageContext.request.contextPath}/DCheckAction.us',
			method:'post',
			data:{tel:tel},
			dataType:'json',
			success:function(result){
				if(result == 1){
					$('#checkTel').html('사용 중인 연락처입니다.');
					$('#checkTel').attr('color','red');
					$('#noch').val(1);
				} else if(!/^\d{3}-\d{4}-\d{4}$/.test(tel)){
					$('#checkTel').html("연락처 형식에 맞지 않습니다.");
					$('#checkTel').attr('color','red');
					$('#noch').val(1);
				} else if(result == 0) {
					$('#checkTel').html('사용 가능한 연락처입니다.');
					$('#checkTel').attr('color','green');
					$('#noch').val(0);
				}
				
			},
				error : function(){
				alert("실패");
			}
		});
	  }
		
	});
	///////// 연락처 /////////////////////
	
	
	///// 비밀번호  ///////////
	$("#pw").on("blur", function(){
		if($("#pw").val().trim() == "" ){
			$('#checkPw').html("비밀번호를 입력하세요.");
			$('#checkPw').attr('color','red');
			$('#noch').val(1);
		}
		
		if($("#pw").val().length > 0 && $("#pw").val().length < 6){
			$('#checkPw').html("6자 이상 입력하세요.");
			$('#checkPw').attr('color','red');
			$('#noch').val(1);
		}
		
		if($("#pw").val().length > 5){
			if(!$("#pw").val()=="" && !/^(?=.*[a-zA-Z])(?=.*[0-9]).{0,}$/.test($('#pw').val())){ 
				$('#checkPw').html("영문자,숫자를 포함하여 입력하세요.");
				$('#checkPw').attr('color','red');
				$('#noch').val(1);
			}
		}
		
	});
	
	$('#pw').keyup(function() {
		if($("#pw").val() == $("#id").val()) {
			$('#checkPw').html("아이디와 비밀번호는 일치할 수 없습니다.");
			$('#checkPw').attr('color','red');
			$('#noch').val(1);
		} else {			
			$('#checkPw').html("");
			$('#noch').val(0);
		}
	});
	///////// 비밀번호 ///////////
	
	/////// 비밀번호 확인 ///////////
	$("#pwc").on("blur", function(){
		if($("#pwc").val().trim() == "" ){
			$('#checkPwc').html("비밀번호 확인을 입력하세요.");
			$('#checkPwc').attr('color','red');
			$('#noch').val(1);
		} else if($("#pwc").val() != $("#pw").val()){
				$('#checkPwc').html("비밀번호가 일치하지 않습니다.");
				$('#checkPwc').attr('color','red');
				$('#noch').val(1);
		}
	});
	
	$('#pwc').keyup(function() {
		if($("#pwc").val() != $("#pw").val()){
			$('#checkPwc').html("");
			$('#noch').val(1);
		} else if($("#pwc").val() == $("#pw").val()){
			$('#checkPwc').html("확인 완료!");
			$('#checkPwc').attr('color','green');
			$('#noch').val(0);
		}
	});
	/////////////// 비밀번호 확인 //////////////////////	
	
	
	});  // jQeury 끝
		
	</script>
	



</head>
<body>
<!-- 헤더 -->
	<div>
       <jsp:include page="../inc/top.jsp"/>
	</div>
<!-- 헤더 끝 -->

	<div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">회원 가입 페이지</h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->
  
	
		
		<div class="container register-form top-buffer-1" align="center">
		  <div class="form">
<!-- 			  <div class="note" > -->
<!-- 				<p>회 원 가 입</p> -->
<!-- 			  </div> -->
		 <div class="form-content bk">
				<form action="./JoinAction.us" method="POST"  align="left" name="fr" onsubmit="return false" >
					<p><h2  style="text-align:center; color:black">회 원 가 입</h2></p>
				<!-- /////////////// 필수입력 사항 ////////////////////////-->
					<fieldset class="scheduler-border" >
						<legend class="scheduler-border"  >필수 입력</legend>
						<div class="row">
							<div class="col-SM-2" style="padding:15px 0 0 15px" align="center" >
							  <input type="button" class="bttn2" value="일반" id="mem" onclick="sep1();"> &nbsp;&nbsp;&nbsp;&nbsp;
							  <input type="button" class="bttn2" value="사업자" id="st" onclick="sep2();">
							  <input type="hidden" value="일반" id="hid" name="hid">
							  <input type="hidden" value="1" id="noch" name="noch">
							  <input type="hidden" value="0" id="hidEmail" name="hidEmil">
							</div>
							<br>
							<div style="padding:0 0 0 15px">
							  <label for="id">아이디&nbsp;&nbsp;
								  <font id = "checkId" size="2"></font>
							  </label>
							  <input type="text" class="form-control" id="id" placeholder="6~12자 영문자,숫자를 입력하세요" name="id"  value="" style="width:300px" maxlength="12">
							  
							</div>
							
							
							<img src="./assets/img/member/join.jpg" class="JoinImage" alt="JoinImage"  >
							
							
							<div class="col-SM-2" style="padding:0 0 0 15px">
							  <label for="name">이름&nbsp;&nbsp;
							   	<font id = "checkName" size="2"></font>
							  </label>
							  <input type="text" class="form-control" id="name" placeholder="이름을 입력하세요" name="name"  style="width:300px" maxlength="20">
							</div>
							<div class="col-SM-2" style="padding:0 0 0 15px">
							  <label for="email" >이메일&nbsp;&nbsp;
							  	<font id = "checkEmail" size="2"></font>
							  </label>
							  <input type="email" class="form-control" id="email" placeholder="이메일을 입력하세요" name="email"  style="width:300px">
							  <input type="button" class="bttn2" id="emailconfirm_btn" name="emailconfirm_btn" value="인증" onclick="emailcheck(fr.email.value)" disabled>
							</div>
							<div class="col-SM-2" style="padding:0 0 0 15px">
							  <label for="nick">닉네임&nbsp;&nbsp;
							  <font id = "checkNick" size = "2"></font>
							  </label>
							  <input type="text" class="form-control" id="nick" placeholder="2~8자 한글,영문자로 입력하세요" name="nick"  style="width:300px" maxlength="8">
							</div>
							<div class="col-SM-2" style="padding:0 0 0 15px">
							  <label for="tel">전화번호( - 포함)&nbsp;&nbsp;
							  <font id = "checkTel" size = "2"></font>
							  </label>
							  <input type="tel" class="form-control" id="tel" name="tel" placeholder="(-)를 포함하여 입력하세요" style="width:300px" maxlength="13">
							</div>
							<div class="col-SM-2" style="padding:0 0 0 15px">
							  <label for="pw">비밀번호&nbsp;&nbsp;
							  	 <font id = "checkPw" size= "2"></font>
							  </label>
							  <input type="password" class="form-control" id="pw" placeholder="영문자,숫자 포함 6~12자를 입력하세요" name="pw"  style="width:300px" maxlength="12">
							</div>
							<div class="col-SM-2" style="padding:0 0 0 15px">
							  <label for="pwc">비밀번호 확인&nbsp;&nbsp;
							  	 <font id = "checkPwc" size= "2"></font>
							  </label>
							  <input type="password" class="form-control" id="pwc" placeholder="비밀번호를 확인하세요" name="pwc"  style="width:300px" maxlength="12">
							</div>
						</div>
						</fieldset>
						<br>
			<!-- /////////////// 선택입력 사항 ////////////////////////-->
					<div class="ch">
					<fieldset class="scheduler-border" id="choose">
						<legend class="scheduler-border">선택 입력</legend>
						<div class="row">
							<div class="col-SM-2" style="padding:0 0 0 15px">
							  <label for="birth">생년월일</label>
							  <input type="date" class="form-control" id="birth" name="birth"  style="width:200px">
							</div>
							<div class="col-SM-2" style="padding:15px 0 0 15px">
							  <label for="gender">성별</label>
							  <label for="gender"><input type="radio" class="form-control" id="gender" value="남"  name="gender" >남</label>
							  <label for="gender2"><input type="radio" class="form-control" id="gender2" value="여" name="gender" >여</label>
							</div>

						</div>
					</fieldset>
					</div>
				
			<!-- /////////////// 개인정보 동의 ////////////////////////-->
					<fieldset class="scheduler-border">
						<legend class="scheduler-border">개인정보 이용 동의(필수)</legend>
						<div class="row">
							<div class="col-SM-2" style="padding:15px 0 0 15px" align="center">
							  <label for="agree"><input type="checkbox" class="form-control" id="agree" value="Y"  name="agree" >&nbsp;&nbsp;동의합니다&nbsp;&nbsp;&nbsp;&nbsp;</label>
<!-- 							  <label for="agree2"><input type="radio" class="form-control" id="agree2" value="N" name="agree" >아니오</label>&nbsp;&nbsp; -->
							  <input type="button" value="약관 보기" class="bttn" onclick="infoform();">
							</div>
						</div>
					</fieldset>
					<!-- Study Abroad Plans -->
					<button type="button" class="btn btn-success" id="sub" onclick="send()">가입하기</button>
				</form>
			</div>
		  </div>
		  </div>

<!-- 푸터 -->
		<div>
		<jsp:include page="../inc/bottom.jsp" />
		</div>
<!-- 푸터 끝 -->

        <script src="./assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/wizard.js"></script>

</body>
</html>