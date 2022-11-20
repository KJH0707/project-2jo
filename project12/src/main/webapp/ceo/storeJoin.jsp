<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 

<!-- 포트 8080 으로 맞춰야함 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<html class="no-js"> <!--<![endif]-->
    <head>
       <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>FORK & KNIFE | Submit Store Page</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

		<!-- tab 마법사 -->
        <link rel="stylesheet" href="assets/css/wizard.css"> 
        <!-- jQuery CDN -->
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
		<!-- (Optional) Latest compiled and minified JavaScript translation files -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
		
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>		

<script type="text/javascript">
$(document).ready(function(){
	$('#telInput').keyup(function (event) {
	  event = event || window.event;
	  var _val = this.value.trim();
	  this.value = autoHypenTel(_val);
	  
	});
});
function autoHypenTel(str) {
	  str = str.replace(/[^0-9]/g, '') // 숫자를 제외한 모든 문자 제거 
	 
	  var tmp = '';
	
	  if (str.substring(0, 2) == 02) {
	    // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
	    if (str.length < 3) {
	      return str;
	    } else if (str.length < 6) {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2);
	      return tmp;
	    } else if (str.length < 10) {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2, 3);
	      tmp += '-';
	      tmp += str.substr(5);
	      return tmp;
	    } else {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2, 4);
	      tmp += '-';
	      tmp += str.substr(6, 4);
	      return tmp;
	    }
	  } else {
	    // 핸드폰 및 다른 지역 전화번호 일 경우
	    if (str.length < 4) {
	      return str;
	    } else if (str.length < 7) {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3);
	      return tmp;
	    } else if (str.length < 11) {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3, 3);
	      tmp += '-';
	      tmp += str.substr(6);
	      return tmp;
	    } else {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3, 4);
	      tmp += '-';
	      tmp += str.substr(7);
	      return tmp;
	    }
	  }
	
	  return str;
}
function bussCK(){
	
	if(document.fr.necessity.checked == false){
	alert("필수약관에 동의하세요");
	document.fr.necessity.focus;
	return false;
	}
}
//alert('hello');
</script>	
<style type="text/css">
.box {
	float: left;
	width: 33.33%;
	padding: 50px;
}
#del {
	background: #DADADA;
	color: #1C1A18; 
	border: #DADADA; 
}
</style>
</head>
<body>
 		<!-- header  -->
 		<jsp:include page="../inc/top.jsp" />
 		<!-- header  -->
 		
        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">Submit new Store</h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->

        <!-- property area -->
        <div class="content-area submit-property" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">
                <div class="clearfix" > 
                    <div class="wizard-container"> 
                        <div class="wizard-card ct-wizard-orange" id="wizardProperty" > <!-- onsubmit="return bussNo();" -->
	                        <form action="./StoreJoinProAction.st" method="post" enctype="multipart/form-data" name="fr" onsubmit="bussCK();">
                                <div class="wizard-header">
                                    <h3>
                                        <b>Submit</b> YOUR STORE <br>
                                        <small><b>Fork&Knife</b>와 함께 하세요</small>
                                    </h3>
                                </div>
                                <!-- 상단 tab  -->
                                <ul class="nav nav-pills">
                                    <li class="active" style="width: 25%;"><a href="#step1" data-toggle="tab" aria-expanded="true">Step 1 </a></li>
                                    <li style="width: 25%;"><a href="#step2" data-toggle="tab">Step 2 </a></li>
                                    <li style="width: 25%;"><a href="#step3" data-toggle="tab">Step 3 </a></li>
                                    <li style="width: 25%;"><a href="#step4" data-toggle="tab">Finished </a></li>
                                </ul>
                                <!-- 상단 tab  -->
                                
								<!-- Start tab content -->
                                <div class="tab-content">
                                	<!-- Start step1 -->
                                    <div class="tab-pane active" id="step1"> <!-- class="tab-pane active" 로 바꿀것  -->
	                                    <h4 class="info-text"> 기본 정보 입력 <small>(필수입력사항)</small></h4>
	                                    <div class="col-sm-6">
		                                    <!-- 가게 메인이미지 -->
		                                    <div class="picture-container">
		                                    <h5><label>M A I N &nbsp; I M A G E</label></h5>
		                                        <div class="picture">
		                                            <img src="assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview" title="" style="height: 100%;" />
		                                            <input type="file" id="wizard-picture" name="stfile1">
		                                        </div> 
		                                    </div>
		                                    <!-- 가게 메인이미지 -->
		                                    <div class="form-group">
		                                    <!-- 주소 -->
												<label>도로명주소 <sup>*</sup></label>
												<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="margin-bottom: 1%; width: 150px;float: right;" ><br>
												<div style="color:#999;display:block; border: 1px solid #DADADA;">
			                                       	<input type="text" id="postcode" placeholder="우편번호"readonly>
													<input type="text" id="Addr1" name="Addr1" placeholder="도로명주소" readonly>
													<input type="text" id="jibunAddress" placeholder="지번주소" readonly>
													<span id="guide" style="color:#999;display:none"></span>
													<input type="text" id="Addr2" name="Addr2" placeholder="상세주소" style="margin-bottom: 1%;" required>
													<input type="text" id="extraAddress" placeholder="" readonly>
												</div>
												<!-- <input type="text" id="address" name="addr" placeholder="" class="form-control" style="margin-bottom: 1%;">
												<input type="button" onclick="mapCall();" value="주소 검색" style="margin-bottom: 1%; width: 150px;float: right;"><br> -->
		                                       <!-- 지도API -->
		                                       <div id="map" style="width:100%;height:300px;margin-bottom: 1%;"></div>
		                                       <!-- 지도API -->
		                                    <!-- 주소 -->
		                                    </div>
	                                    </div>
                                        <div class="col-sm-6" style="float: left;">
	                                       <div class="form-group">
                                               <label>상호명 <sup>*</sup></label>
                                               <input name="storeName" type="text" id="nameInput" class="form-control" placeholder="Fork&Knife" required> 
                                           </div>
                                           <div class="form-group">
                                               <label>대표 전화번호 <sup>*</sup></label>
                                               <input type="tel" name="tel" id="telInput" class="form-control" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" placeholder="010-1234-5678"/>
                                           </div> 
                                           <div class="form-group">
                                               <label>사업자등록번호 <sup>*</sup></label>
                                               <input name="businessNumber" type="text" class="form-control" maxlength="10" placeholder="0123456789" required>
                                           </div>
                                           <div class="form-group">
	                                          <label>업종 <sup>*</sup>&nbsp;</label>
                                              <select name="sort" class="form-control" id="basic" required>
                                              	<option value="">선택하세요</option>
                                              	<option value="한식">한식</option>
                                              	<option value="일식">일식</option>
                                              	<option value="중식">중식</option>
                                              	<option value="양식">양식</option>
                                              	<option value="오마카세">오마카세</option>
                                              </select>
                                           </div>
                                           <div class="form-group">
											<label>가격대 <sup>*</sup></label>
	                                           	<select name="priceSort" class="form-control" required>
                                              	<option value="">선택하세요</option>
                                              	<option value="10000">1만원대</option>
                                              	<option value="20000">2만원대</option>
                                              	<option value="30000">3만원대</option>
                                              	<option value="40000">4만원대</option>
                                              	<option value="50000">5만원대</option>
                                              	<option value="60000">6만원대</option>
                                              	<option value="70000">7만원대</option>
                                              	<option value="80000">8만원대</option>
                                              	<option value="90000">9만원대</option>
                                              	<option value="100000">10만원대</option>
                                              	<option value="110000">10만원이상</option>
                                              </select>
	                                        </div>
                                           <div class="form-group">
											<fieldset>
											<label>영업시간 <sup>*</sup></label><hr style="margin-top: 5px; margin-bottom: 10px;">
                                      			<div class="col-sm-6">
	                                             	<label for="open" style="color: gray; font-size: 14px;">오픈시간</label>
		                                            <input name="openTime" id="open" type="time" class="form-control" required>
	                                          	</div>
                                           		<div class="col-sm-6">
	                                            	<label for="close" style="color: gray; font-size: 14px;">마감시간</label>
	                                            	<input name="closeTime" id="close" type="time" class="form-control" required>
	                                          	</div>
	                                        </fieldset>
	                                        </div>
                                        </div>
                                    </div>
                                    <!--  End step 1 -->
                                    <!--  Start step 2 -->
                                    <div class="tab-pane" id="step2"> <!-- active 없앨 것 -->
                                        <h4 class="info-text"> 상세 정보 입력<small>(선택입력사항)</small> </h4>
                                        <div class="col-sm-12 padding-bottom-15"> 
	                                        <div class="col-sm-6"> 
	                                            <div class="form-group">
	                                                <label>식당소개글 :</label>
	                                                <textarea name="discrition" class="form-control" rows="12"></textarea>
	                                            </div> 
	                                        </div>
	                                        <div class="col-sm-6">
	                                        	<div class="form-group">
	                                                <label>추가이미지 등록 :</label>
	                                                <input type="file" id="wizard-picture" name="stfile2">
	                                                <input type="file" id="wizard-picture" name="stfile3">
	                                            </div> 
		                                    </div>
	                                        <br><br>
	                                        <div class="col-sm-12" >
	                                        	<label>&nbsp;&nbsp;&nbsp;&nbsp;편의시설 <small>(해당항목 선택)</small></label>
	                                        </div>
	                                        <div class="col-sm-12">
                                        		<div class="form-group">
	                                               	<div class="checkbox padding-bottom-15">
	                                                    <label>
	                                                        <input type="checkbox" name="facility1" value="주차가능"> 주차 가능
	                                                        	<input type="text" class="form-control" name="facDisc1" placeholder="상세정보(선택)">
	                                                    </label>
	                                                    <label>
	                                                        <input type="checkbox" name="facility2" value="반려동물가능"> 반려동물 동반
	                                                        	<input type="text" class="form-control" name="facDisc2" placeholder="상세정보(선택)">
	                                                    </label>
	                                                    <label>
	                                                        <input type="checkbox" name="facility3" value="노키즈존"> 노키즈존
	                                                        	<input type="text" class="form-control" name="facDisc3" placeholder="상세정보(선택)">
	                                                    </label>
	                                                    <label>
	                                                        <input type="checkbox" name="facility4" value="콜키지"> 콜키지 서비스
	                                                        	<input type="text" class="form-control" name="facDisc4" placeholder="상세정보(선택)">
	                                                    </label>
	                                                    <label>
	                                                        <input type="checkbox" name="facility5" value="대관"> 대관 서비스
	                                                        	<input type="text" class="form-control" name="facDisc4" placeholder="상세정보(선택)">
	                                                    </label>
	                                                </div>
	                                             </div>
                                            </div>
                                    	</div>
	                                </div> <br>
                                    <!-- End step 2 -->

                                    <!-- Start step 3 -->
                                    <div class="tab-pane" id="step3">                                        
                                        <h4 class="info-text">메뉴 등록 </h4>
                                            <div class="col-sm-6 col-sm-offset-1"> <!-- 메뉴와 사진을 추가 버튼을 통해 추가할 수 있도록 할 것 -->
                                            	<!-- <div class="pull-right">
                                            		<input type="button" value="메뉴 항목 추가" class="btn btn-next btn-primary" id="menuAddbtn">
                                            	</div> -->
                                            	<!-- 메뉴 등록 -->
                                            	<div class="pull-left">
                                            	<label>* 최대 5개까지 등록 가능합니다. </label>
                                            	</div>
	                                            <div class="form-group" id="menuTable">
	                                            	<table border="1" style="border: 1px #DADADA; line-height: 2.5; width: 100%; height: 44px; padding: 6px 12px; color: #838383; box-shadow: 0px 1px 1px rgb(179 179 179 / 10%) inset;
    													transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s; text-align: center; "> 
		                                            	<tr>
		                                            		<td><b>메뉴명</b></td>
		                                            		<td><input type="text" name="menuName1"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>가격</b></td>
		                                            		<td>
		                                            		<input type="number" name="menuPrice1" placeholder="숫자만 입력해주세요">
		                                            		</td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>메뉴설명</b></td>
		                                            		<td><input type="text" name="content"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>이미지</b></td>
		                                            		<td>
			                                            		<input type="file" name="mfile1"> 
		                                            		</td>
		                                            	</tr>
	                                            	</table>
	                                        	</div>
	                                            <div class="form-group" id="menuTable">
	                                            	<table border="1" style="border: 1px #DADADA; line-height: 2.5; width: 100%; height: 44px; padding: 6px 12px; color: #838383; box-shadow: 0px 1px 1px rgb(179 179 179 / 10%) inset;
    													transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s; text-align: center; "> 
		                                            	<tr>
		                                            		<td><b>메뉴명</b></td>
		                                            		<td><input type="text" name="menuName2"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>가격</b></td>
		                                            		<td>
		                                            		<input type="number" name="menuPrice2">
		                                            		</td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>메뉴설명</b></td>
		                                            		<td><input type="text" name="content"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>이미지</b></td>
		                                            		<td>
			                                            		<input type="file" name="mfile2"> 
		                                            		</td>
		                                            	</tr>
	                                            	</table>
	                                        	</div>
	                                            <div class="form-group" id="menuTable">
	                                            	<table border="1" style="border: 1px #DADADA; line-height: 2.5; width: 100%; height: 44px; padding: 6px 12px; color: #838383; box-shadow: 0px 1px 1px rgb(179 179 179 / 10%) inset;
    													transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s; text-align: center; "> 
		                                            	<tr>
		                                            		<td><b>메뉴명</b></td>
		                                            		<td><input type="text" name="menuName3"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>가격</b></td>
		                                            		<td>
		                                            		<input type="number" name="menuPrice3">
		                                            		</td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>메뉴설명</b></td>
		                                            		<td><input type="text" name="content"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>이미지</b></td>
		                                            		<td>
			                                            		<input type="file" name="mfile3"> 
		                                            		</td>
		                                            	</tr>
	                                            	</table>
	                                        	</div>
	                                            <div class="form-group" id="menuTable">
	                                            	<table border="1" style="border: 1px #DADADA; line-height: 2.5; width: 100%; height: 44px; padding: 6px 12px; color: #838383; box-shadow: 0px 1px 1px rgb(179 179 179 / 10%) inset;
    													transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s; text-align: center; "> 
		                                            	<tr>
		                                            		<td><b>메뉴명</b></td>
		                                            		<td><input type="text" name="menuName4"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>가격</b></td>
		                                            		<td><input type="number" name="menuPrice4"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>메뉴설명</b></td>
		                                            		<td><input type="text" name="content"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>이미지</b></td>
		                                            		<td>
			                                            		<input type="file" name="mfile4"> 
		                                            		</td>
		                                            	</tr>
	                                            	</table>
	                                        	</div>
	                                            <div class="form-group" id="menuTable">
	                                            	<table border="1" style="border: 1px #DADADA; line-height: 2.5; width: 100%; height: 44px; padding: 6px 12px; color: #838383; box-shadow: 0px 1px 1px rgb(179 179 179 / 10%) inset;
    													transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s; text-align: center; "> 
		                                            	<tr>
		                                            		<td><b>메뉴명</b></td>
		                                            		<td><input type="text" name="menuName5"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>가격</b></td>
		                                            		<td><input type="number" name="menuPrice5"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>메뉴설명</b></td>
		                                            		<td><input type="text" name="content"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>이미지</b></td>
		                                            		<td>
			                                            		<input type="file" name="mfile5"> 
		                                            		</td>
		                                            	</tr>
	                                            	</table>
	                                        	</div>
	                                        	
	                                        	<!-- 메뉴 추가 위치 -->
	                                            <div class="menuAdd"></div>
	                                        	<!-- 메뉴 추가 위치 -->
	                                        </div>
	                                        <!-- 메뉴 등록 -->
	                                        <!-- 홈페이지URL -->
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label for="property-video"> 홈페이지 URL </label> <br>
                                                   <!--  <i class="fa fa-instagram"> --><input class="form-control" value="" placeholder="http://www.instagram.com" name="property_video" type="text">
                                                </div> 
                                                <div class="form-group">
                                                    <input class="form-control" value="" placeholder="http://vimeo.com" name="property_video" type="text">
                                                </div>
                                                <div class="form-group">
                                                    <input class="form-control" value="" placeholder="http://www.youtube.com" name="property_video" type="text">
                                                </div>
                                           </div>
                                    </div> <br>
                                    <!--  End step 3 -->


                                    <!--  Start step 4 -->
                                    <div class="tab-pane" id="step4">                                        
                                        <h1 class="info-text">Fork&Knife</h1>
                                        <div class="row">  
                                            <div class="col-sm-12">
                                            <div class="checkbox"> <!-- class="terms_check_all" -->
										        <label for="necessity" >
											        <input type="checkbox" name="agreement" id="necessity" required="required">
											        <strong>Fork&Knife 이용약관, 개인정보 수집 및 이용에 동의합니다. <small>(필수)</small></strong>
										        </label>
										     </div>
											 <jsp:include page="../ceo/termsConditions.jsp"/>
										        <div class="terms__box" style="height: 100px; width: 91.5%; box-sizing: border-box; margin-bottom: 2%;margin-left: 2%;">
										          <div class="input__check">
										            <input type="checkbox" name="agreement" id="allowPromotions" value="allowPromotions" />
										            <label for="allowPromotions">프로모션 정보 수신 동의</label>
										          </div>
										          <div class="terms__content" style="height: 80px;margin-left: 2%;">
										            Fork&Knife에서 제공하는 이벤트/혜택 등 다양한 정보를 문자, 이메일로 받아보실 수
										            있습니다. 일부 서비스(별도 회원 체계로 운영하거나 Fork&Knife 가입 이후 추가 가입하여 이용하는 서비스 등)의
										            경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고
										            동의를 받습니다.
										          </div>
										        </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--  End step 4 -->

                                </div>
                                <!-- End Tab Contents  -->

                                <!-- <div class="pull-right" style="clear: both;"> -->
                                <div class="wizard-footer" style="clear: both;">
                                <div class="pull-right" style="clear: both;">
                                    <input type='button' class='btn btn-next btn-primary' name='next' value='Next' />
                                    <input type="submit" class='btn btn-finish btn-primary' name='finish' value='Finish' id='button'/>
                                </div>

                                <div class="pull-left">
                                    <input type='button' class='btn btn-previous btn-default' name='previous' value='Previous' />
                                </div>
                        		</form>
                             <div class="clearfix"></div>                                            
                             </div>	
                        </div>
                        <!-- End submit form -->
                    </div> 
                </div>
            </div>
        </div>
        </div>

    <!-- Footer area-->
	<jsp:include page="../inc/bottom.jsp"/>
    <!-- Footer area-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1900efb9ff28bb0a54c68c9b272a9b10&libraries=services"></script>
		<script src="ceo/mapAPI.js"></script> <!-- 위치를 옮길 때는 반드시 주소 변경해주기  -->
    <!-- 지도 API javascript -->
	    <script src="assets/js/vendor/modernizr-2.6.2.min.js"></script>
        <script src="assets/js//jquery-1.10.2.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="bootstrap/js/bootstrap-select.min.js"></script>
        <script src="assets/js/bootstrap-select.min.js"></script>
        <script src="assets/js/bootstrap-hover-dropdown.js"></script>
        <script src="assets/js/easypiechart.min.js"></script>
        <script src="assets/js/jquery.easypiechart.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/wow.js"></script>
        <script src="assets/js/icheck.min.js"></script>

        <script src="assets/js/price-range.js"></script> 
        <script src="assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/wizard.js"></script>

        <script src="assets/js/main.js"></script>
    </body>
</html>