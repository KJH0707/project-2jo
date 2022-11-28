<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="./assets/css/myPage.css">

<style>
button:hover{
	color:black;
	font-weight:900;
}


.menush-sub {
/* 	position:absolute; */
	margin:0;
	padding:0;
	list-style: none;
	text-decoration: none;
	color:inherit;
}

</style>

<script type="text/javascript">

	function storeChange(sno){
		var sno = $("#storeList").val();
			location.href = "${pageContext.request.contextPath}/CeoMyPage_reserv.us?sno="+sno;
	}
	
	
	function good(resno){
		var res_no = resno;
		var stat = 1;
		var co = confirm("이용완료 처리됩니다.");
		if(co == true){
			
			$.ajax({
				url:'${pageContext.request.contextPath}/refuselReservAction.us',
				data:{res_no:res_no, stat:stat},
				success:function(){
	 				$(".table-responsive").load(window.location.href+ " .table-responsive");
	 			},
	 				error: function(){
	 					alert("실패");
	 				}
	 		});

		}
	}
	
	function fuck(resno){
		var res_no = resno;
		var stat = 2;
		var co = confirm("진짜 안왔어요?");
		if(co == true){
			$.ajax({
				url:'${pageContext.request.contextPath}/refuselReservAction.us',
				data:{res_no:res_no, stat:stat},
				success:function(){
	 				$(".table-responsive").load(window.location.href+ " .table-responsive");
	 			},
	 				error: function(){
	 					alert("실패");
	 				}
	 		});
			
		}
	}
	
	function refuse(resno){
			var res_no = resno;
			var stat = 3;
			var co = confirm("정말 거절하시겠어요?");
			if(co == true){
				$.ajax({
					url:'${pageContext.request.contextPath}/refuselReservAction.us',
					data:{res_no:res_no, stat:stat},
					success:function(){
		 				$(".table-responsive").load(window.location.href+ " .table-responsive");
		 			},
		 				error: function(){
		 					alert("실패");
		 				}
		 		});
				
			}
	}
	
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
                                   <img src="./assets/img/myPage/people.png" width="20" height="20">
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
  <div class="row tm-content-row tm-mt-big" >
                <div class="col-xl-8 col-lg-12 tm-md-12 tm-sm-12 tm-col" style="padding:0px">
                  <div class="bg-white tm-block h-100">
                    <form action="./CeoMyPage_reserv.us" method="get" id="fr">
                        <div class="row">
                            <div class="col-md-8 col-sm-12">
                                <h3 class="tm-block-title d-inline-block">예 약 관 리
                                <select id="storeList" name="sno" onchange="storeChange(this.value)" style="font-size:10px">
                                   <option value="0" ${sno == 0 ? 'selected="selected"' : ''}>전체보기</option>
                                <c:forEach var="storeInfo" items="${storeInfo}">
	                               <option value=${storeInfo.s_no }  ${storeInfo.s_no == sno ? 'selected="selected"' : ''}>
	                               ${storeInfo.s_name }</option>
                               </c:forEach>
                               </select>
                               </h3>
                            </div>
                            <br>
                            <div class="text-right">
                            <select id="schList" name="schList" onchange="schListChange(this.value)" style="font-size:10px">
                            	<option value=res_no ${schList == "res_no" ? 'selected="selected"' : ''}>예약번호</option>
                            	<option value=res_name ${schList == "res_name" ? 'selected="selected"' : ''}>성함</option>
                            	<option value=res_tel ${schList == "res_tel" ? 'selected="selected"' : ''}>연락처</option>
                            	<option value=res_date ${schList == "res_date" ? 'selected="selected"' : ''}>예약날짜</option>
                            </select>
<!--                             <input type="hidden" name="snohid" value=""> -->
                            <input type="search" id="search" name="search" style="width:10%;border:1px solid; padding:0px; font-size:10px;" placeholder="seach...">
                            <button type="submit" id="ent"><i class="glyphicon glyphicon-search"></i></button>
                            </div>
                        </div>
                    </form>
                        <hr>
                        <div class="table-responsive">
                            <table class="table table-hover table-striped tm-table-striped-even mt-3" style="table-layout:fixed;">
                                <thead >
                                    <tr class="tm-bg-gray">
                                      <c:if test="${sno==0}">
                                        <th scope="col" class="text-center" width="80px" style="padding:5px;">상점명</th>
                                      </c:if>
                                        <th scope="col" class="text-center" width="80px" style="padding:5px;">예약번호</th>
                                        <th scope="col" class="text-center" width="80px" style="padding:5px;">성함</th>
                                        <th scope="col" class="text-center" width="50px" style="padding:5px;">인원</th>
                                        <th scope="col" class="text-center" width="100px" style="padding:5px;">날짜 및 시간</th>
                                        <th scope="col" class="text-center" width="180px" style="padding:5px;">메세지</th>
                                        <th scope="col" class="text-center" width="120px" style="padding:5px;">연락처</th>
                                        <th scope="col" class="text-center" width="80px" style="padding:5px;">상태</th>
                                        <!--  0이 이용 예정 1이 이용 완료 2가 노쇼 3 사업주 거절 -->
                                        <th scope="col" class="text-center" width="50px" style="padding:5px;">관리</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                 <c:when test="${schList==null && search==null }">
                                   <c:forEach var="reservList" items="${reservList }">
	                                    <tr>
	                                       <c:if test="${sno==0}">
	                                        <td class="text-center" style="padding:5px;">${reservList.s_name }</td>
	                                       </c:if>
	                                        <td class="text-center" style="padding:5px;">${reservList.res_no }</td>
	                                        <td class="text-center" style="padding:5px;">${reservList.res_name }</td>
	                                        <td class="text-center" style="padding:5px;">${reservList.res_num }명</td>
	                                        <td class="text-center" style="padding:5px;">${reservList.res_date }<br>${reservList.res_time }시</td>
	                                        <td class="text-center" style="padding:5px;">
	                                        ${reservList.res_msg } </td>
	                                        <td class="text-center" style="padding:5px;">${reservList.res_tel }</td>
	                                        <td class="text-center" style="padding:5px;">
	                                        <c:choose>
	                                          <c:when test="${reservList.res_status==0}">
	                                        	이용 예정
	                                          </c:when>
	                                          <c:when test="${reservList.res_status==1}">
	                                        	이용 완료
	                                          </c:when>
	                                          <c:when test="${reservList.res_status==2}">
	                                        	노쇼
	                                          </c:when>
	                                          <c:when test="${reservList.res_status==3}">
	                                        	거절
	                                          </c:when>
	                                        </c:choose>
	                                        </td>
	                                        <td align="center" style="padding:5px;">
	                                        <c:choose>
	                                          <c:when test="${reservList.res_status==1}">
	                                          	<span style="color:green"><i class="fa-solid fa-check"></i></span>
	                                          </c:when>
	                                          <c:when test="${reservList.res_status==2}">
	                                          	<span style="color:black"><i class="fa-solid fa-circle-exclamation"></i></span>
	                                          </c:when>
	                                          <c:when test="${reservList.res_status==3}">
	                                          	<span style="color:red"><i class="fa-solid fa-xmark"></i></span>
	                                          </c:when>
	                                          <c:when test="${reservList.res_status==0}">
												<ul class="menush-sub">
	                                        	<li><button onclick="good(${reservList.res_no })" style="background-color:transparent;" >완료</button></li>
	                                        	<li><button onclick="fuck(${reservList.res_no })" style="background-color:transparent;">노쇼</button></li>
	                                        	<li><button onclick="refuse(${reservList.res_no })" style="background-color:transparent;">거절</button></li>
	                                        	</ul>
	                                          </c:when>
	                                        </c:choose>
	                                        </td>
	                                    </tr>
                                      </c:forEach>
                                    </c:when>
                                    <c:when test="${schList!=null && search!=null }">
                                      <c:forEach var="searchList" items="${searchList }">
	                                    <tr>
	                                       <c:if test="${sno==0}">
	                                        <td class="text-center" style="padding:5px;">${searchList.s_name }</td>
	                                       </c:if>
	                                    	<td class="text-center" style="padding:5px;">${searchList.res_no }</td>
	                                        <td class="text-center" style="padding:5px;">${searchList.res_name }</td>
	                                        <td class="text-center" style="padding:5px;">${searchList.res_num }명</td>
	                                        <td class="text-center" style="padding:5px;">${searchList.res_date }<br>${searchList.res_time }시</td>
	                                        <td class="text-center" style="padding:5px;">
	                                        ${searchList.res_msg } </td>
	                                        <td class="text-center" style="padding:5px;">${searchList.res_tel }</td>
	                                        <td class="text-center" style="padding:5px;">
	                                        <c:choose>
	                                          <c:when test="${searchList.res_status==0}">
	                                        	이용 예정
	                                          </c:when>
	                                          <c:when test="${searchList.res_status==1}">
	                                        	이용 완료
	                                          </c:when>
	                                          <c:when test="${searchList.res_status==2}">
	                                        	노쇼
	                                          </c:when>
	                                          <c:when test="${searchList.res_status==3}">
	                                        	거절
	                                          </c:when>
	                                        </c:choose>
	                                        </td>
	                                        <td align="center" style="padding:5px;">
	                                        <c:choose>
	                                          <c:when test="${searchList.res_status==1}">
	                                          	<span style="color:green"><i class="fa-solid fa-check"></i></span>
	                                          </c:when>
	                                          <c:when test="${searchList.res_status==2}">
	                                          	<span style="color:black"><i class="fa-solid fa-circle-exclamation"></i></span>
	                                          </c:when>
	                                          <c:when test="${searchList.res_status==3}">
	                                          	<span style="color:red"><i class="fa-solid fa-xmark"></i></span>
	                                          </c:when>
	                                          <c:when test="${searchList.res_status==0}">
												<ul class="menush-sub">
	                                        	<li><button onclick="good(${searchList.res_no })" style="background-color:transparent;" >완료</button></li>
	                                        	<li><button onclick="fuck(${searchList.res_no })" style="background-color:transparent;">노쇼</button></li>
	                                        	<li><button onclick="refuse(${searchList.res_no })" style="background-color:transparent;">거절</button></li>
	                                        	</ul>
	                                          </c:when>
	                                        </c:choose>
	                                        </td>
	                                    </tr>
                                      </c:forEach>
                                    </c:when>
                                 </c:choose>
                                </tbody>
                            </table>
                        </div>
                        
                 <div align="center" style="font-size:20px; color:black">
                 <c:choose>
                   <c:when test="${schList==null && search==null }">
					<c:if test="${totalSnt != 0}" >
						<!-- 이전 -->
						<c:if test="${startPage > pageBlock }">
							<a href="./CeoMyPage_reserv.us?sno=${sno }&pageNum=${startPage-pageBlock }">[이전]</a>
						</c:if>
						
						<!-- 페이지 번호 -->
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
							<a href="./CeoMyPage_reserv.us?sno=${sno }&pageNum=${i }">${i }</a>
						</c:forEach>
						
						<!-- 다음 -->
						<c:if test="${endPage < pageCount }">
							<a href="./CeoMyPage_reserv.us?sno=${sno }&pageNum=${startPage+pageBlock }">[다음]</a>
						</c:if>
					</c:if>
					</c:when>
					<c:otherwise>
						<c:if test="${totalSnt != 0}" >
						<!-- 이전 -->
						<c:if test="${startPage > pageBlock }">
							<a href="./CeoMyPage_reserv.us?sno=${sno }&schList=${schList }&search=${search }&pageNum=${startPage-pageBlock }">[이전]</a>
						</c:if>
						
						<!-- 페이지 번호 -->
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
							<a href="./CeoMyPage_reserv.us?sno=${sno }&schList=${schList }&search=${search }&pageNum=${i }">${i }</a>
						</c:forEach>
						
						<!-- 다음 -->
						<c:if test="${endPage < pageCount }">
							<a href="./CeoMyPage_reserv.us?sno=${sno }&schList=${schList }&search=${search }&pageNum=${startPage+pageBlock }">[다음]</a>
						</c:if>
					</c:if>
					</c:otherwise>
				 </c:choose>
				</div> 
                        
                        
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