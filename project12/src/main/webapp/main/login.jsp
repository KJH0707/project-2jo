<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
		    
		<!-- jQuery -->
		<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
		
		<!-- 카카오 로그인 API -->
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Fork and Knife | 로그인</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        
		<jsp:include page="../inc/top.jsp"/>
        

        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">로그인 페이지</h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->
 

        <!-- register-area -->
        <div class="register-area" style="background-color: rgb(249, 249, 249);">
            <div class="container">
				<div class="col-md-4">
                </div>

                <div class="col-md-4">
                    <div class="box-for overflow">                         
                        <div class="col-md-12 col-xs-12 login-blocks">
                            <h2>Login : </h2> 
                            <form action="./loginAction.us" method="post">
                                <div class="form-group">
                                    <label for="email">아이디</label>
                                    <input type="text" class="form-control" id="email" name="id">
                                </div>
                                <div class="form-group">
                                    <label for="password">비밀번호</label>
                                    <input type="password" class="form-control" id="password" name="pw">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-default-login-kjh">로그인</button>
                                </div>
                            </form>
                            <br>
                            
                            <h2>Social login :  </h2> 
                            <a href="javascript:kakaoLogin()">
							<img src="main/kakao.jpg">
							</a>
						
							<form action="KaKaoJoin.us" id="kakao_form" method="POST"
							onsubmit="alert('추가 정보 입력이 필요합니다.')">
							<input type="hidden" id="kakao_id" name="kakao_id" value="">
							<input type="hidden" id="kakao_nickname" name="kakao_nickname" value="">
							<input type="hidden" id="kakao_access_token" name="kakao_access_token" value="">
							</form>
                       
                        </div>
                        
                    </div>
                </div>

            </div>
        </div>      
        
        
        
        
        
        
<script type='text/javascript'>
	// Javascript SDK 초기화
	window.Kakao.init("82f6249264dc2eb5d3fa096ef4f6829d");
 
	// 카카오 로그인 버튼 생성
	function kakaoLogin()
	{
    		// 카카오 로그인 화면 팝업 호출
		window.Kakao.Auth.login({
			scope: 'profile_nickname, account_email',	//--가져올 사용자 정보(동의 항목 ID 목록)
			success: function(authObj){
            			// 사용자 정보 가져올 API 호출
				window.Kakao.API.request({
					url: '/v2/user/me',	//--사용자 정보 요청 주소 지정
					success: res => {	//--API 호출 성공 시 실행되는 콜백 함수
						var kakao_account = res.kakao_account;	//--kakao_account에 사용자 정보 저장
						var access_token = Kakao.Auth.getAccessToken();	//--access_token에 액세스 토큰 저장
						$("#kakao_id").attr("value",kakao_account.email);	//--kakao_account 내 email 정보 input 태그 value값에 저장
						$("#kakao_nickname").attr("value",kakao_account.profile.nickname);	//--nickname 정보 저장
						$("#kakao_access_token").attr("value",access_token);	//--access_token 정보 저장
						$("#kakao_form").submit();	//--form submit
						
					}
				});
			}
		});
	}
</script>
        

          <!-- Footer area-->
       <jsp:include page="../inc/bottom.jsp"/>

    </body>
</html>