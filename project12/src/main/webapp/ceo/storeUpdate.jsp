<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>
       <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>FORK & KNIFE | Update Store Page</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

		<!-- tab 마법사 -->
        <link rel="stylesheet" href="assets/css/wizard.css"> 
		<!-- (Optional) Latest compiled and minified JavaScript translation files -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
		
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>		
<script type="text/javascript">
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
.wizard-card .picture23 {
    width: 100%;
    height: 100%;
    color: #FFF;
    border-radius: 4px;
    margin: 5px auto;
    overflow: hidden;
    transition: all 0.2s;
    -webkit-transition: all 0.2s;
}
#wizard-picture2 {
    cursor: pointer;
    display: block;
    height: 100%;
    left: 0;
    opacity: 0 !important;
    position: absolute;
    top: 0;
    width: 100%;
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
	                        <form action="./" method="post" id="update" enctype="multipart/form-data" name="fr" onsubmit="check();">
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
		                                        <div class="picture23">
		                                            <img src="upload/${dto.s_image.split(',')[0]}" class="picture-src" id="wizardPicturePreview" title="" alt="기존이미지"/>
		                                            <input type="file" id="wizard-picture" name="stfile1" > <%-- http://yangyag.tistory.com/277 --%>
		                                        </div> 
		                                    </div>
		                                    <!-- 가게 메인이미지 -->
		                                    <div class="form-group">
		                                    <!-- 주소 -->
												<label>도로명주소 <sup>*</sup></label>
												<c:if test=""></c:if>
												<input type="text" value="${dto.s_addr }" class="form-control" readonly="readonly" style="font-weight: 600; ">
												<input type="button" onclick="execDaumPostcode()" value="주소 변경" style="margin-bottom: 1%; width: 150px;float: right;"><br>
												<div style="color:#999;display:block; border: 1px solid #DADADA;">
			                                       	<input type="text" id="postcode" placeholder="우편번호" readonly hidden="">
													<input type="text" id="Addr1" name="Addr1" placeholder="도로명주소"  readonly>
													<input type="text" id="jibunAddress" placeholder="지번주소" readonly hidden="">
													<span id="guide" style="color:#999;display:none"></span>
													<input type="text" id="Addr2" name="Addr2" placeholder="상세주소" style="margin-bottom: 1%;">
													<input type="text" id="extraAddress" placeholder="" readonly hidden="">
												</div>
		                                       <!-- 지도API -->
		                                       <div id="map" style="width:100%;height:300px;margin-bottom: 1%;"></div>
		                                       <!-- 지도API -->
		                                    <!-- 주소 -->
		                                    </div>
	                                    </div>
                                        <div class="col-sm-6" style="float: left;">
	                                       <div class="form-group">
                                               <label>상호명 <sup>*</sup></label>
                                               <input name="storeName" type="text" id="nameInput" class="form-control" value="${dto.s_name }" required> 
                                           </div>
                                           <div class="form-group">
                                               <label>대표 전화번호 <sup>*</sup></label>
                                               <input type="tel" name="tel" id="telInput" class="form-control" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" value="${dto.s_tel}"/>
                                           </div> 
                                           <div class="form-group">
                                               <label>사업자등록번호 <sup>*</sup></label>
                                               <input name="businessNumber" type="text" class="form-control" maxlength="10" value="${dto.s_number }" required>
                                           </div>
                                           <div class="form-group">
	                                          <label>업종 <sup>*</sup>&nbsp;</label>
                                              <select name="sort" class="form-control" id="basic" required>
                                              	<option value="">선택하세요</option>
                                              	<option value="한식"
                                              		<c:if test="${dto.s_type == '한식' }">
                                              		selected
                                              		</c:if>
                                              	>한식</option>
                                              	<option value="일식"
                                              	<c:if test="${dto.s_type == '일식' }">
                                              		selected
                                              		</c:if>
                                              	>일식</option>
                                              	<option value="중식"
                                              		<c:if test="${dto.s_type == '중식' }">
                                              		selected
                                              		</c:if>
                                              	>중식</option>
                                              	<option value="양식"
                                              		<c:if test="${dto.s_type == '양식' }">
                                              		selected
                                              		</c:if>
                                              	>양식</option>
                                              	<option value="오마카세"
                                              		<c:if test="${dto.s_type == '오마카세' }">
                                              		selected
                                              		</c:if>
                                              	>오마카세</option>
                                              </select>
                                           </div>
                                           <div class="form-group">
											<fieldset>
											<c:set var="hour" value="${dto.s_hours.split('~') }"/>
											<%-- ${dto.s_hours.split('~')[0] }
											${dto.s_hours.split('~')[1] } --%>
											<label>영업시간 <sup>*</sup></label><hr style="margin-top: 5px; margin-bottom: 10px;">
                                      			<div class="col-sm-6">
	                                             	<label for="open" style="color: gray; font-size: 14px;">오픈시간</label>
		                                            <input name="openTime" id="open" type="time" value="${dto.s_hours.split('~')[0] }" class="form-control" required>
	                                          	</div>
                                           		<div class="col-sm-6">
	                                            	<label for="close" style="color: gray; font-size: 14px;">마감시간</label>
	                                            	<input name="closeTime" id="close" type="time" value="${dto.s_hours.split('~')[1] }" class="form-control" required>
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
	                                                <textarea name="discrition" class="form-control" rows="12">${dto.s_content }</textarea>
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
                                        		<c:set /> 
	                                               	<div class="checkbox padding-bottom-15">
	                                                    <label>
	                                                        <input type="checkbox" name="facility1" value="주차가능"> 주차 가능
	                                                        	<input type="text" class="form-control" name="facDisc1" >
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
                                            	<!-- 메뉴 등록 -->
                                            	<div class="pull-left">
                                            	<label>* 최대 5개까지 등록 가능합니다. </label>
                                            	</div>
    													<c:set value="${dto.s_menuname}" var="name"/>
    													<c:set value="${dto.s_menuprice}" var="price"/>
    													<c:set value="${dto.s_menuImg}" var="img"/>
	                                            <div class="form-group" id="menuTable">
	                                            	<table border="1" style="border: 1px #DADADA; line-height: 2.5; width: 100%; height: 44px; padding: 6px 12px; color: #838383; box-shadow: 0px 1px 1px rgb(179 179 179 / 10%) inset;
    													transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s; text-align: center; "> 
    													<c:if test="${name.split(',')[0]!='null' && price.split(',')[0]!='null'}">
		                                            	<tr>
		                                            		<td><b>메뉴명</b></td>
		                                            		<td><input type="text" name="menuName1" value=${name.split(',')[0] }></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>가격</b></td>
		                                            		<td>
		                                            		<input type="number" name="menuPrice1" value=${price.split(',')[0] }>
		                                            		</td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>메뉴설명</b></td>
		                                            		<td><input type="text" name="content"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>이미지</b></td>
		                                            		<td>
			                                            		<input type="file" name="mfile1" value="" >${img.split(',')[0]}
			                                            		<a href="/upload/${img.split(',')[0]}">${img.split(',')[0]}</a>
		                                            		</td>
		                                            	</tr>
    													</c:if>
	                                            	</table>
	                                        	</div>
	                                            <div class="form-group" id="menuTable">
	                                            	<table border="1" style="border: 1px #DADADA; line-height: 2.5; width: 100%; height: 44px; padding: 6px 12px; color: #838383; box-shadow: 0px 1px 1px rgb(179 179 179 / 10%) inset;
    													transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s; text-align: center; "> 
		                                            	<c:if test="${name.split(',')[1]!='null' && price.split(',')[1]!='null'}">
		                                            	<tr>
		                                            		<td><b>메뉴명</b></td>
		                                            		<td><input type="text" name="menuName2" value=${name.split(',')[1] }></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>가격</b></td>
		                                            		<td>
		                                            		<input type="number" name="menuPrice2" value=${price.split(',')[1] }>
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
		                                            </c:if>
	                                            	</table>
	                                        	</div>
	                                            <div class="form-group" id="menuTable">
	                                            	<table border="1" style="border: 1px #DADADA; line-height: 2.5; width: 100%; height: 44px; padding: 6px 12px; color: #838383; box-shadow: 0px 1px 1px rgb(179 179 179 / 10%) inset;
    													transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s; text-align: center; "> 
		                                            	<c:if test="${name.split(',')[2]!='null' && price.split(',')[2]!='null'}">
		                                            	<tr>
		                                            		<td><b>메뉴명</b></td>
		                                            		<td><input type="text" name="menuName3" value=${name.split(',')[2] }></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>가격</b></td>
		                                            		<td>
		                                            		<input type="number" name="menuPrice3" value=${price.split(',')[2] }>
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
		                                            </c:if>
	                                            	</table>
	                                        	</div>
	                                            <div class="form-group" id="menuTable">
	                                            	<table border="1" style="border: 1px #DADADA; line-height: 2.5; width: 100%; height: 44px; padding: 6px 12px; color: #838383; box-shadow: 0px 1px 1px rgb(179 179 179 / 10%) inset;
    													transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s; text-align: center; "> 
		                                            	<c:if test="${name.split(',')[3]!='null' && price.split(',')[3]!='null'}">
		                                            	<tr>
		                                            		<td><b>메뉴명</b></td>
		                                            		<td><input type="text" name="menuName4" value=${name.split(',')[3] }></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>가격</b></td>
		                                            		<td><input type="number" name="menuPrice4" value=${price.split(',')[3] }></td>
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
		                                            </c:if>
	                                            	</table>
	                                        	</div>
	                                            <div class="form-group" id="menuTable">
	                                            	<table border="1" style="border: 1px #DADADA; line-height: 2.5; width: 100%; height: 44px; padding: 6px 12px; color: #838383; box-shadow: 0px 1px 1px rgb(179 179 179 / 10%) inset;
    													transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s; text-align: center; "> 
		                                            	<c:if test="${name.split(',')[4]!='null' && price.split(',')[4]!='null'}">
		                                            	<tr>
		                                            		<td><b>메뉴명</b></td>
		                                            		<td><input type="text" name="menuName5" value=${name.split(',')[4] }></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>가격</b></td>
		                                            		<td><input type="number" name="menuPrice5" value=${price.split(',')[4] }></td>
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
		                                            </c:if>
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