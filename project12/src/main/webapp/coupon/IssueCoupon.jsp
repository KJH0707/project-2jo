<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fork and Knife | Coupon</title>
        <meta name="description" content="company is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
		
		 <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/fontello.css">
        <link href="assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="assets/css/animate.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="assets/css/price-range.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="assets/css/owl.theme.css">
        <link rel="stylesheet" href="assets/css/owl.transitions.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        

</head>
<body>
        <div class="content-area recent-property padding-top-40" style="background-color: #FFF;">
            <div class="container">  

                <div class="col-md-9">
				<form action="" method="post">
                    <div class="" id="contact1" style="background-color: #f7f7f7; padding: 2%;">                        
                        <h2>쿠폰 생성</h2>
                        <hr>
                        <form>
                            <div class="row" style="background-color: #f7f7f7;">
                                <div class="col-sm-10 " style="padding-left: 30px;">
                                    <div class="form-group">
                                        <label for="coupon_name">쿠폰명</label>
                                        <input type="text" class="form-control" id="coupon_name" placeholder="20자이내로 입력하세요" required>
                                    </div>
                                </div>
                                <div class="col-sm-11 ">
                                <div class="col-sm-4" style="overflow: hidden;">
                                    <div class="form-group">
                                        <label for="coupon_amount">수량</label>
                                        <input type="number" class="form-control" name="coupon_amount" id="coupon_amount" min="0" required>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="cou_type">쿠폰 종류</label>
                                        <select name="cou_type" class="form-control" id="cou_type" required>
											<option value="drink">음료 제공</option>
											<option value="sidedish">사이드 제공</option>
											<option value="corkage">콜키지 프리 </option>
											<option value="park">무료 주차</option>
											<option value="room">룸 예약</option>
										</select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                <c:set var="dto" value="${storeList }"/>
                                    <div class="form-group">
                                        <label for="sto_name">사용처</label>
                                        <select name="sto_name" class="form-control" id="sto_name" required>
	                                		<c:forEach var="i" begin="0" end="${storeList.size()-1 }" step="1">
	                                		<c:set var="dto" value="${storeList[i] }"/>
	                                		<%-- <c:forEach var="dto" items="${storeList[i] }"> --%>
												<option value="${dto.s_name}" >${dto.s_name}</option>
	                                		</c:forEach>
										</select>
                                    </div>
                                </div>
                               </div>
                               <!--  <div class="col-sm-5" style="padding-left: 30px;">
                                    <div class="form-group">
                                        <label for="issue_start_date">배포시작일</label>
                                        <input type="date" class="form-control" id="issue_start_date" name="issue_start_date">
                                    </div>
                                </div>
                                <div class="col-sm-5" >
                                    <div class="form-group">
                                        <label for="issue_end_date">배포종료일</label>
                                        <input type="date" class="form-control" id="issue_end_date" name="issue_end_date">
                                    </div>
                                </div> -->
                                <div class="col-sm-5" style="padding-left: 30px;">
                                    <div class="form-group">
                                        <label for="cou_startDate">사용시작일</label>
                                        <input type="date" class="form-control" id="cou_startDate" name="cou_startDate" required>
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <div class="form-group">
                                        <label for="cou_endDate">사용종료일</label>
                                        <input type="date" class="form-control" id="cou_endDate" name="cou_endDate" min="cou_startDate" required>
                                    </div>
                                </div>
                                <div class="col-sm-12" style="padding-left: 30px; padding-right: 15px;">
                                    <div class="form-group">
                                        <label for="message">쿠폰 설명</label>
                                        <textarea id="message" class="form-control" name="message"></textarea>
                                    </div>
                                </div>
                                <div class="col-sm-12 text-center" >							
                                    <button type="submit" class="btn btn-primary" id="issue_post" > 생성</button> 
                                    <button type="reset" class="btn btn-primary" onclick="closeTab()"> 취소 </button>
                                    </form>
                                </div>
                            </div>
                            <!-- /.row -->
                        </form>
                    </div>
                </div>
                <!-- /.col-md-9 -->   

          </div>
       </div>

<script type="text/javascript">
	var now_utc = Date.now()
	var timeOff = new Date().getTimezoneOffset()*60000;
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("cou_startDate").setAttribute("min", today);
	document.getElementById("cou_endDate").setAttribute("min", today);

	 // POST 요청 처리 : 데이터 전송
    document.getElementById('issue_post').addEventListener('click', function(event){
		 var coupon_name = document.getElementById('coupon_name').value;
		 var coupon_amount = document.getElementById('coupon_amount').value;
		 var cou_type = document.getElementById('cou_type').value;
		 var sto_name = document.getElementById('sto_name').value;
		 var cou_startDate = document.getElementById('cou_startDate').value;
		 var cou_endDate = document.getElementById('cou_endDate').value;
		 var cou_message = document.getElementById('message').value;
		 //var date = new Date().toISOString().substring(2,10).replace(/-/g,'');
		 var time = new Date().getTime();
		 var cou_code = time;
		 
		 if(coupon_name==""){
			 alert('쿠폰명을 입력하세요');
			 return false;
		 }
		 if(coupon_amount==""){
			 alert('수량을 입력하세요');
			 return false;
		 }
		 if(cou_startDate==""){
			 alert('사용시작일을 선택하세요');
			 return false;
		 }
		 if(cou_endDate==""){
			 alert('사용종료일을 선택하세요');
			 return false;
		 }
		 if(cou_endDate < cou_startDate){
			 alert('종료일이 시작일보다 더 빠를 수 없습니다.');
			 document.getElementById('cou_startDate').focus();
			 return false;
		 }
		 
		 
        const request = new XMLHttpRequest();

        request.onreadystatechange = function(evnet){
        if (request.readyState == 4 && request.status == 200){
            console.log(request.responseText);
        }
    }
	        
        // POST 설정
        request.open('POST', './issueCouponAction.co', true);

        // !!! POST 전송시, 데이터 전달을 위한 설정
        request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        request.send('coupon_name='+coupon_name+'&coupon_amount='+coupon_amount+'&cou_type='+cou_type+'&sto_name='+sto_name+'&cou_startDate='+cou_startDate+'&cou_endDate='+cou_endDate+"&cou_code="+cou_code+"&cou_message="+cou_message);
	
		alert('저장완료');
        window.close();

	 });

	function closeTab() {
	    window.close();
	}
</script>
</body>
</html>