<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Fork and Knife | Admin</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="./assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="./assets/libs/css/style.css">
    <link rel="stylesheet" href="./assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
		$('#jung2, #jung4, #jung6, #jung8').click(function(){
			$('#reason').children().remove();
			var howday = $(this).val().substring(0,$(this).val().length-1);
			var how = $(this).val();
			$('#reason').append("<span> 일반 회원 "+how+" 정지</span><br><form action='./adminSanctionPro.us'><input type='hidden' name='day' value='"+howday+"'><input type='hidden' name='rep_m' value='${param.rep_m}'><input type='hidden' name='m_email' value='${param.m_email}'><textarea name='reason' rows='10' cols='50'>안녕하세요. 항상 고객님과 함께하는 fork&knife입니다. 고객님의 계정이 "+how+" 정지되어 알려드립니다. 사유는 다음과 같습니다 : </textarea><br><input type='submit' class='btn btn-primary' value='정지'></form>");
				
			});
		
	});
		
		
	</script>
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    
      
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <h1 class="text-center">넌 안되겠다..</h1>
                        
                        
                        <b>일반 회원</b> : <input type="button" id="jung2" value="7일" class="btn btn-primary"> <input type="button" id="jung4" value="15일" class="btn btn-primary"> <input type="button" value="30일" id="jung6" class="btn btn-primary"> <input type="button" value="100년" id="jung8" class="btn btn-primary"><br><br><br>
                        
                    </div>
                    <div id="reason">
                    
                    </div>
                    
                </div>
            </div>
        </div>
            
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="./assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="./assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="./assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="./assets/libs/js/main-js.js"></script>
</body>
 
</html>