<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
   <head>
      <title>Fork and Knife | My page</title>
      
      	<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="./assets/css/myPage.css">
<link rel="stylesheet" href="./assets/css/join.css">
<link rel="stylesheet" href="./assets/css/wizard.css"> 

<script>
		// 회원정보 수정 제어(유효성 체크)
		function send(){
			let id = $('#id').val();
			let name = $('#name').val();
			let nick = $('#nick').val();
			let tel = $('#tel').val();
			let pw = $('#pw').val();
			let pwc = $('#pwc').val();
			let noch = $('#noch').val();
			
			if(name.length == 0){
				alert('이름을 입력해주세요');
				$('#name').focus();
				
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
			
			if(noch == 1) {
			 	alert('입력정보를 다시 확인해주세요');
							
			 	return;
			 }
			
			document.fr.submit();
		}
		
		function del(){
			$(".form-content").hide();
			$(".deleteForm").show();
			$("#sub").attr("disabled",true);
			$("#sub2").attr("disabled",true);
			$("#realdel").attr("disabled",false);
			$("#canc").attr("disabled",false);
		}
		
		function cancel() {
			$(".form-content").show();
			$(".deleteForm").hide();
			$("#sub").attr("disabled",false);
			$("#sub2").attr("disabled",false);
			$("#realdel").attr("disabled",true);
			$("#canc").attr("disabled",true);
		}
		
		function realDel() {
			if($("#pw2").val() != "${cdto.c_pw}"){
				alert('비밀번호가 틀립니다');
				
				return;
			}
			
			document.df.submit();
		}
		
		
		
	//////////// 유효성 체크 이벤트 ///////////////
	$(function(){
		
	
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
					if(nick=="${cdto.c_nickName}"){
						$('#checkNick').html('')
						$('#noch').val(0);
					} else {
					$('#checkNick').html('사용할 수 없는 닉네임입니다.');
					$('#checkNick').attr('color','red');
						$('#noch').val(1);
					}
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
					if(tel=="${cdto.c_tel}"){
						$('#checkTel').html('')
						$('#noch').val(0);
					} else {
					$('#checkTel').html('사용 중인 연락처입니다.');
					$('#checkTel').attr('color','red');
					$('#noch').val(1);
					}
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
                 <h1 class="page-title">My page</h1>               
             </div>
         </div>
       </div>
    </div>
    <!-- End page header -->

    <!-- property area -->
 
    <div class="properties-area recent-property" style="background-color: #FFF;">
      <div class="container">  
          <div class="row">
               
          <div class="col-md-3 p0 padding-top-40">
              <div class="blog-asside-right pr0">

                  <div class="panel panel-default sidebar-menu wow fadeInRight animated">
                      <div class="panel-heading">
                        <h3 class="panel-title"><a href="./CeoMyPage.us">마이페이지</a></h3>
                      </div>
                      <div class="panel-body recent-property-widget">
                           <ul>
                           <li>
                           	 <a href="./CeoMyPage_st.us">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/store.png" width="20" height="20">
                               </div>
                             </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry" width="">
                                   <h6><a href="./CeoMyPage_st.us">가게 관리</a></h6>
                               </div>
                             
                           </li>
                           <li>
                           	  <a href="./CeoMyPage_reserv.us">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/people.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="./CeoMyPage_reserv.us">예약 관리</a></h6>
                               </div>
                           </li>
                           <li>
                           	  <a href="./CeoMyPage_re.us">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/review.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="./CeoMyPage_re.us">리뷰 관리</a></h6>
                               </div>
                           </li>
                           <li>
                           	  <a href="./CouponManage.co">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/coupon.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="./CouponManage.co">쿠폰 관리</a></h6>
                               </div>
                           </li>
                           <li>
                           	  <a href="./CeoMyPage_Info.us">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/note.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="./CeoMyPage_Info.us">회원정보 관리</a></h6>
                               </div>
                           </li>
                       </ul>
                      </div>
                  </div>
              </div>
          </div>

       

<div class="col-md-9  pr0 padding-top-40 properties-page">
  <!-- 여기 밑으로 내용 넣어야 옆 공간에 들어감 -->
   <div class="row">
     <div class="col-md-8 col-sm-12">
         <h3 class="tm-block-title d-inline-block">회 원 정 보 관 리</h3>
     </div>
       <br>
  </div>
  
  <hr>
  
  <!-- -------------------------------------------------------------- -->
  		<div class="container register-form top-buffer-1" align="center" style="width:100%">
		  <div class="form">
		 <div class="form-content bk" style="width:50%">
				<form action="./CeoMyPage_InfoUpdate.us" method="POST"  align="left" name="fr" onsubmit="return false" >
					<h4 style="text-align:center; color:black">회원정보 수정</h4>
				<!-- /////////////// 필수입력 사항 ////////////////////////-->
					<fieldset class="scheduler-border" >
						<div class="row">
							<div class="col-SM-2" style="padding:15px 0 0 15px" align="center" >
							  <input type="hidden" value="1" id="noch" name="noch">
							</div>
							<br>
							<div style="padding:0 0 0 15px">
							  <label for="id">아이디&nbsp;&nbsp;
								  <font id = "checkId" size="2"></font>
							  </label>
							  <input type="hidden" id="c_no" name="c_no" value="${cdto.c_no }" >
							  <input type="text" class="form-control" id="id" name="id"  value="${cdto.c_id }" style="width:90%" readonly>
							</div>
							<div class="col-SM-2" style="padding:0 0 0 15px">
							  <label for="name">이름&nbsp;&nbsp;
							   	<font id = "checkName" size="2"></font>
							  </label>
							  <input type="text" class="form-control" id="name" value="${cdto.c_name}" name="name"  style="width:90%" maxlength="20">
							</div>
							<div class="col-SM-2" style="padding:0 0 0 15px">
							  <label for="email" >이메일&nbsp;&nbsp;
							  	<font id = "checkEmail" size="2"></font>
							  </label>
							  <input type="email" class="form-control" id="email" name="email" value="${cdto.c_email }" style="width:90%" readonly>
							</div>
							<div class="col-SM-2" style="padding:0 0 0 15px">
							  <label for="nick">닉네임&nbsp;&nbsp;
							  <font id = "checkNick" size = "2"></font>
							  </label>
							  <input type="text" class="form-control" id="nick" name="nick" placeholder="2~8자 한글,영문자로 입력하세요" value="${cdto.c_nickName }"  style="width:90%" maxlength="8">
							</div>
							<div class="col-SM-2" style="padding:0 0 0 15px">
							  <label for="tel">전화번호( - 포함)&nbsp;&nbsp;
							  <font id = "checkTel" size = "2"></font>
							  </label>
							  <input type="tel" class="form-control" id="tel" name="tel" placeholder="(-)를 포함하여 입력하세요" value="${cdto.c_tel }" style="width:90%" maxlength="13">
							</div>
							<div class="col-SM-2" style="padding:0 0 0 15px">
							  <label for="pw">비밀번호&nbsp;&nbsp;
							  	 <font id = "checkPw" size= "1"></font>
							  </label>
							  <input type="password" class="form-control" id="pw" placeholder="영문자,숫자 포함 6~12자를 입력하세요" name="pw"  style="width:90%" maxlength="12">
							</div>
							<div class="col-SM-2" style="padding:0 0 0 15px">
							  <label for="pwc">비밀번호 확인&nbsp;&nbsp;
							  	 <font id = "checkPwc" size= "2"></font>
							  </label>
							  <input type="password" class="form-control" id="pwc" placeholder="비밀번호를 확인하세요" name="pwc"  style="width:90%" maxlength="12">
							</div>
						</div>
						</fieldset>
	
					<!-- Study Abroad Plans -->
					<div align="center">
					<button type="button" class="btn btn-success" id="sub" onclick="send()">수정</button>
					<button type="button" class="btn btn-success" id="sub2" onclick="del()" style="color:red; border-color:red;">탈퇴</button>
					</div>
				</form>
			</div>
				
				<div class="deleteForm" style="display:none">
					<form action="./CeoDeleteAction.us" id="df" name="df" onsubmit="return false">
						<h2>정말 탈퇴하시겠습니까?</h2>
						<p>※ 회원정보가 완전히 삭제됩니다.</p>
						<div>
						<input type="hidden" id="c_no" name="c_no" value="${cdto.c_no }" >
						<input type="text" style="display:none">
						<b>비밀번호 확인</b> <input type="password" id="pw2" name="pw2" style="width:20%; border:1px solid;">
						</div>
						<br>
						<div>
						<button type="button" class="btn btn-success" id="realdel" onclick="realDel()" style="color:red; border-color:red;" disabled>탈퇴</button>
						<button type="button" class="btn btn-success" id="canc" onclick="cancel()" disabled>취소</button>
						</div>
						<br>
					</form>
				</div>
				
		  </div>
		  </div>
  
  
  
</div>
</div>
</div>
</div>


        
 <!-- 푸터 -->
	<div>
	<jsp:include page="../inc/bottom.jsp" />
	</div>
<!-- 푸터 끝 -->

</body>
</html>