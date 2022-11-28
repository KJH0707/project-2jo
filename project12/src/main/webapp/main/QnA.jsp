<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<style>


</style>

</head>
<body>

	<div>
       <jsp:include page="../inc/top.jsp"/>
	</div>

		<div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">FAQ PAge</h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->
        

        <!-- property area -->
        <div class="content-area recent-property" style="background-color: #FCFCFC; padding-bottom: 55px;">
            <div class="container">    

                <div class="row">
                    <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
                        <!-- /.feature title -->
                        <h2>자주 묻는 질문 </h2>
                        <br>
                    </div>
                </div>

                <div class="row row-feat"> 
                    <div class="col-md-12">
 
                        <div class="col-sm-6 feat-list">
                            <div class="panel-group">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                         <h4 class="panel-title fqa-title" data-toggle="collapse" data-target="#fqa11" >
                                            가입/탈퇴
                                         </h4> 
                                    </div>
                                    <div id="fqa11" class="panel-collapse collapse fqa-body">
                                        <div class="panel-body">
                                       		<details>
                                               <summary><b>[가입] 올바르지 않은 이메일 주소라고 떠요</b></summary>
                                               <p style="padding:10px; font-size:12px">- 이메일 주소 입력 시, 공백이 있는지 혹은 올바른 형식에 맞게 입력했는지 확인해주세요.<br>
                                               - 확인 후에도 문제가 발생 시 일시적인 오류일 수 있으니 캐시 삭제 후 다시 시도해 주세요.<br>
                                               - 재시도 후에도 지속적으로 문제가 발생한다면 fork & knife 고객센터로 문의해 주세요.</p>
											</details>
											<details>
                                               <summary><b>[가입] 이메일 인증이 안돼요</b></summary>
                                               <p style="padding:10px; font-size:12px">- 이메일 주소 입력 시, 공백이 있는지 혹은 올바른 형식에 맞게 입력했는지 확인해주시거나
                                               또는 스팸메일함을 확인해주세요.<br>
                                               - 그럼에도 문제가 발생한다면 fork & knife 고객센터로 문의 해주세요.</p>
											</details>
											<details>
                                               <summary><b>[가입] 회원정보를 변경하고싶어요</b></summary>
                                               <p style="padding:10px; font-size:12px">- 마이페이지 > 회원정보관리에서 회원정보 수정이 가능합니다.<br>
                                               [참고] 아이디와 이메일의 경우 변경이 불가하니 참고해주시길 바랍니다.</p>
											</details>
											<details>
                                               <summary><b>[가입] 카카오톡 간편가입 시, 회원가입 화면이 떠요</b></summary>
                                               <p style="padding:10px; font-size:12px">- 카카오톡 간편가입은 로그인 수단이 아닌 회원가입에 편의를 위하여 제공되는 수단입니다.<br>
                                               fork & knife의 가입에는 추가 입력정보가 필요하오니 필수정보를 추가해주세요.</p>
											</details>
											<details>
                                               <summary><b>[탈퇴] 탈퇴를 하고 싶어요</b></summary>
                                               <p style="padding:10px; font-size:12px">- 마이페이지 > 회원정보관리에서 [탈퇴] 버튼을 눌러 탈퇴할 수 있습니다.<br>
                                               단, 탈퇴 후 모든 정보가 삭제되며 이용 내역, 쿠폰 등 정보는 복구할 수 없습니다.<br></p>
											</details>
											<details>
                                               <summary><b>[탈퇴] 탈퇴 후 재가입이 가능한가요?</b></summary>
                                               <p style="padding:10px; font-size:12px">- 회원 탈퇴 후 재가입은 가능합니다.<br>
                                               다만, 탈퇴시 기존에 보유한 쿠폰과 이용내역등은 모두 소멸되어 복구되지 않습니다.</p>
											</details>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                            
                            <div class="panel-group">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                         <h4 class="panel-title fqa-title" data-toggle="collapse" data-target="#fqa22" >
                                            예약
                                         </h4> 
                                    </div>
                                    <div id="fqa22" class="panel-collapse collapse fqa-body">
                                        <div class="panel-body">
                                        	<details>
                                               <summary><b>[예약] 예약상태에 떠 있는 내용은 어떤 의미인가요?</b></summary>
                                               <p style="padding:10px; font-size:12px">- fork & knife는 예약 진행상태에 따라 4가지로 표시하고 있습니다.<br>
                                               * 이용예정 : 예약은 완료되었으나 아직 방문하지 않은 상태<br>
                                               * 이용완료 : 예약이 완료 되었고 가게 이용이 끝난 상태<br>
                                               * 노쇼 : 예약은 완료되었으나 방문 시간을 초과했음에도 아무 의사표시 없이 방문하지 않은 상태<br>
                                               * 거절 : 사업주의 사정으로 인해 예약이 거절된 상태<br>
                                               이용에 참고해주시길 바랍니다.</p>
											</details>
											<details>
                                               <summary><b>[예약] 예약을 하였는데 목록에 보이지 않습니다.</b></summary>
                                               <p style="padding:10px; font-size:12px">- 예약시 누락된 항목이 없는지 확인해주시고, 만약 누락된 사항이 없는데
                                               지속적으로 이와같은 오류가 발생할시 fork & knife 고객센터로 문의해 주세요.</p>
											</details>
											<details>
                                               <summary><b>[예약] 예약 후 다른 사람이 방문해도 되나요?</b></summary>
                                               <p style="padding:10px; font-size:12px">- fork & knife는 본인방문을 원칙으로 하고 있으므로 다른 사람이 방문한 경우
                                               매장 입장이 불가할 수 있습니다.<br>
                                               - 방문이 불가할 시 매장에 전화하여 예약취소를 해주세요. 취소를 안하고 미방문시 노쇼로 인한 경고를 받을 수 있으니
                                               유의해주시길 바랍니다.</p>
											</details>
											<details>
                                               <summary><b>[예약] 예약을 완료하였는데 사업주 거절이 되었어요</b></summary>
                                               <p style="padding:10px; font-size:12px">- 사업주 거절의 경우 사업주의 사정으로 예약이 불가한 상태를 말합니다<br>
                                               재예약은 가능하지만 사업주 사정에 따라 다시 거절될 수 있는 점 양해바랍니다.</p>
											</details>
											<details>
                                               <summary><b>[노쇼] 매장에 취소를 하지않아 노쇼 처리가 되었어요. 환불이 가능한가요?</b></summary>
                                               <p style="padding:10px; font-size:12px">- 예약 완료 후 취소의사를 밝히지 않을 채 예약시간에 매장에 방문하지 않은 경우
                                               예약 금액은 환불이 불가합니다. 매장에 방문하지 못하는 경우라면 매장에 전화를 하여 취소해주시길 바랍니다.</p>
											</details>
                                            
                                        </div> 
                                    </div>
                                </div>
                            </div>
                            
                            <div class="panel-group">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                         <h4 class="panel-title fqa-title" data-toggle="collapse" data-target="#fqa33" >
                                            쿠폰
                                         </h4> 
                                    </div>
                                    <div id="fqa33" class="panel-collapse collapse fqa-body">
                                        <div class="panel-body">
                                       		<details>
                                               <summary><b>[쿠폰] 쿠폰은 어떻게 발행/발급 받나요?</b></summary>
                                               <p style="padding:10px; font-size:12px">- 저도 모르겠어요</p>
											</details>
											<details>
                                               <summary><b>[쿠폰] 쿠폰 유효기간은 어떻게 확인하나요?</b></summary>
                                               <p style="padding:10px; font-size:12px">- 저도 모르겠어요</p>
											</details>
											<details>
                                               <summary><b>[쿠폰] 쿠폰은 모든 매장에 적용 가능한가요?</b></summary>
                                               <p style="padding:10px; font-size:12px">- 저도 모르겠어요</p>
											</details>
                                        
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 feat-list">
                            <div class="panel-group">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                         <h4 class="panel-title fqa-title" data-toggle="collapse" data-target="#fqa1" >
                                            결제/취소
                                         </h4> 
                                    </div>
                                    <div id="fqa1" class="panel-collapse collapse fqa-body">
                                        <div class="panel-body">
                                        	<details>
                                               <summary><b>[결제] 결제 방식을 알고싶어요</b></summary>
                                               <p style="padding:10px; font-size:12px">- 현재 결제 가능한 수단은 카카오페이, 네이버페이, 카드결제, 페이코,
                                                L.pay, SSGPAY, 차이,토스, 삼성페이로 결제 가능합니다.</p>
											</details>
											<details>
                                               <summary><b>[결제] 결제수단을 변경하고 싶어요</b></summary>
                                               <p style="padding:10px; font-size:12px">- 결제완료 후 결제수단 변경은 불가합니다.<br>
                                               변경이 필요하신 경우에는 기존 예약은 취소 후 재예약을 해주시길 바랍니다.</p>
											</details>
											<details>
                                               <summary><b>[결제] 여러 결제수단으로 나눠서 결제하고 싶어요</b></summary>
                                               <p style="padding:10px; font-size:12px">- 여러 결제수단으로 나눠서 결제는 불가하며,
                                                하나의 결제수단으로만 결제가 가능한점 양해 바랍니다.</p>
											</details>
											<details>
                                               <summary><b>[취소] 결제를 취소하고 싶어요</b></summary>
                                               <p style="padding:10px; font-size:12px">- 저도 모르겠어요</p>
											</details>
                                            
                                        </div> 
                                    </div>
                                </div>
                            </div>
                            
                            <div class="panel-group">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                         <h4 class="panel-title fqa-title" data-toggle="collapse" data-target="#fqa2" >
                                            신고/경고
                                         </h4> 
                                    </div>
                                    <div id="fqa2" class="panel-collapse collapse fqa-body">
                                        <div class="panel-body">
                                        	<details>
                                               <summary><b>[신고] 가게를 신고하고 싶어요</b></summary>
                                               <p style="padding:10px; font-size:12px">- 가게에서 불쾌한 일을 겪었거나, 실제로 방문 후 가게에 기재된 내용과 다를 경우
                                               신고하기를 통하여 가게를 신고할 수 있습니다.<br>
                                               - 신고 내용은 관리자 검토 후 처리됩니다. </p>
											</details>
                                           <details>
                                               <summary><b>[경고] 경고가 부여되는 기준이 있나요?</b></summary>
                                               <p style="padding:10px; font-size:12px"> 1. 예약 신청 후 취소 의사를 밝히지 않은채 가게에 방문하지 않은 경우 경고를 받습니다.<br>
                                               - 가게에 방문하지 못하는 경우라면 가게에 전화를 통해 취소해주세요.</br>
                                               2. 타인이 보기에 불쾌한 리뷰를 작성하거나, 허위로 리뷰를 작성, 법적 침해가 발생할 시 신고를 통하여 경고를 받을 수 있습니다.<br>
                                               <br>
                                               [참고] 경고 누적 시 fork & knife 이용에 불이익이 있을 수 있으니 참고바랍니다. </p>
											</details>
											<details>
                                               <summary><b>[경고] 경고가 적용되어 이용이 불가해요</b></summary>
                                               <p style="padding:10px; font-size:12px">- 경고 누적의 경우 이용이 제한이 됩니다.<br>
                                               * 1회 경고 - 7일 정지<br>
                                               * 2회 경고 - 15일 정지<br>
                                               * 3회 경고 - 30일 정지<br>
                                               * 4회 경고 - 영구정지</p>
											</details>
                                           
                                        </div> 
                                    </div>
                                </div>
                            </div>
                            
                            <div class="panel-group">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                         <h4 class="panel-title fqa-title" data-toggle="collapse" data-target="#fqa3" >
                                            기타
                                         </h4> 
                                    </div>
                                    <div id="fqa3" class="panel-collapse collapse fqa-body">
                                        <div class="panel-body">
                                      		<details>
                                               <summary><b>[기타] fork & knife 홈페이지가 실행이 안돼요.</b></summary>
                                               <p style="padding:10px; font-size:12px">- 인터넷 환경으로 발생한 일시적 오류일 수 있습니다.
                                               인터넷 연결을 확인하고 다시 실행해 주세요.<br>
                                               - 연결을 확인하고도 지속적으로 문제가 발생한다면 fork & knife 고객센터로 문의 해주세요.                                               
                                               </p>
											</details>
											<details>
                                               <summary><b>[리뷰] 작성한 리뷰가 삭제되었어요.</b></summary>
                                               <p style="padding:10px; font-size:12px">- 작성한 리뷰에 불쾌한 표현, 명예훼손, 법적 침해 등이 발생했다는
                                               신고를 받은 경우 별도의 알림 없이 관리자 검토 후 리뷰가 삭제될 수 있습니다.                                               
                                               </p>
											</details>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                
            </div>
        </div>

	<div>
	<jsp:include page="../inc/bottom.jsp" />
	</div>


</body>
</html>