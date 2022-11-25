<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
   <head>
      <title>Insert title here</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="./assets/css/myPage.css">


<style>
div.polaroid {
  float:left;
  width: 30%;
  height: 30%;
  background-color: white;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  margin-bottom: 25px;
  margin:14px;
  
}

div.poltext {
  text-align: center;
  padding: 0px 20px;
}  
  
</style>

<script type="text/javascript">
	function storeChange(sno){
		var sno = $("#storeList").val();
		var listType = $("#reType").val();
			location.href = "${pageContext.request.contextPath}/CeoMyPage_re.us?sno="+sno+"&listType="+listType+"&s=0";
	}
	
	function sort() {
		var s = $("#sor").val();
		var sno = $("#storeList").val();
		var listType = $("#reType").val();
		
		if(s==0){
			$("#sor").attr("value",1);
			location.href = "${pageContext.request.contextPath}/CeoMyPage_re.us?sno="+sno+"&listType="+listType+"&s=1";
		} else if(s==1){
			$("#sor").attr("value",0);
			location.href = "${pageContext.request.contextPath}/CeoMyPage_re.us?sno="+sno+"&listType="+listType+"&s=0";
		}
	}
	
	function rvok(){
// 		$('#ro').click();
		$("#ok").load(window.location.href+ " #ok");
	}

</script>

<script>
$(function(){
	
// 	$("#ro").click(function(){
		
// 		$.ajax({
// 			url:'${pageContext.request.contextPath}/CeoMyPage_re.us',
// 			success:function(reList){
// 				$("#ok").load(window.location.href+ " #ok");
// 				console.log('성공');
// 			},
// 			error : function(){
// 				alert('실패');
// 			}
			
// 		});
// 	}); 

	
});


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
                 <h1 class="page-title">List Layout With Sidebar</h1>               
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
  				 <div class="row" >
                    <div class="col-md-8 col-sm-12" >
                       <h3 class="tm-block-title d-inline-block">리 뷰 관 리
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
                        <button type="button" id="sor" value="${s }" onclick="sort()"><i class="glyphicon glyphicon-sort"></i></button>
                            <select id="reType" name="reType" onchange="storeChange(this.value)" style="font-size:10px">
                            	<option value=rev_date ${listType == "rev_date" ? 'selected="selected"' : '' }>최신순</option>
                            	<option value=rev_star ${listType == "rev_star" ? 'selected="selected"' : '' }>별점순</option>
                            </select>
                        </div>
                  </div>
                    
                    <hr>

					<div id="ok">
                    <div class="col-md-12 clear" style="line-height:20px">
                        <div id="list-type" class="proerty-th">
                        
<!--                         <i class="fa-regular fa-star-half-stroke"></i> -->
					  
                      <c:forEach var="reList" items="${reList }">
                        <div class="polaroid">
                        	  <div>
                        	  <p style="padding: 0px 10px; margin:10px 0px 0px;"><b>[${reList.s_name }]</b></p>
                        	  </div>
                        	  <div style="display:flex; width:100%">
                        	  <div style="width:80%">
                        	  <p style="padding: 0px 10px; "><small><b>${reList.m_nickname }</b></small></p>
                        	  <p style="padding: 0px 10px; font-size:13px;"><small>
                        	  <span style="color:#FFE400">
                        	  <c:choose>
                        	   <c:when test="${reList.rev_star==1}">
                        	  	<i class="fa-sharp fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i>
                        	   </c:when>
                        	   <c:when test="${reList.rev_star==2}">
                        	   	<i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i>
                        	   </c:when>
                        	   <c:when test="${reList.rev_star==3}">
                        	   	<i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i>
                        	   </c:when>
                        	   <c:when test="${reList.rev_star==4}">
                        	   	<i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-regular fa-star"></i>
                        	   </c:when>
                        	   <c:when test="${reList.rev_star==5}">
                        	   	<i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i>
                        	   </c:when>
                        	  </c:choose>
                        	  </span>
                        	   ${reList.date }</small></p>
                        	  </div>
                        	  <div align="right">
                        	  <button id="ro" style="display:none" onclick="rvok"></button>
                        	  <c:choose>
                        	  <c:when test="${reList.rev_c_re == null || reList.rev_c_re == '' }">
                        	  <p style="padding: 10px 0px;font-size:13px;"><small>[답글<i class="glyphicon glyphicon-remove"></i>]</small></p>
<!--                         	  <font id ="chok" size="2" style="padding: 10px 0px;font-size:13px;"></font> -->
                        	  </c:when>
                        	  <c:otherwise>
                        	  <p style="padding: 10px 0px;font-size:13px; color:green;"><small>[답글<i class="glyphicon glyphicon-ok"></i>]</small></p>
                        	  </c:otherwise>
                        	  </c:choose>
                        	  </div>
                        	  </div>
                        	  <div>
                        	  <c:choose>
                        	  	<c:when test="${reList.rev_file==null }">
							  		<img src="assets/img/forks.jpg" alt="none" style="width:100%; height:200px" >
							  	</c:when>
							  	<c:otherwise>
							  		<img src="./upload/${reList.rev_file.split(',')[0] }" alt="rev_file" style="width:100%; height:200px">
							  	</c:otherwise>
							  </c:choose>
							  </div>
							  <div class="poltext">
							  <p style="font-size:13px; overflow:hidden; text-overflow:ellipsis; display:-webkit-box; -webkit-line-clamp:3; -webkit-box-orient:vertical; height:70px">
							  <small><b>${reList.rev_content }</b></small>
							  </p>
							  </div>
							  <div class="poltext">
							  <a onclick='window.open("./CeoMyPage_reDetail.us?rev_no=${reList.rev_no}","","left=700,top=50,width=400,height=800")'>[상세보기]</a>
							  </div>
						</div>
					</c:forEach>
							
                                
                        </div>
                    </div>
                    </div>
                    
           	<div align="center" style="font-size:20px; color:black">
                <c:choose>
                  <c:when test="${listType == null }">
					<c:if test="${totalSnt != 0}" >
						<!-- 이전 -->
						<c:if test="${startPage > pageBlock }">
							<a href="./CeoMyPage_re.us?sno=${sno }&s=${s }&pageNum=${startPage-pageBlock }">[이전]</a>
						</c:if>
						
						<!-- 페이지 번호 -->
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
							<a href="./CeoMyPage_re.us?sno=${sno }&s=${s }&pageNum=${i }">${i }</a>
						</c:forEach>
						
						<!-- 다음 -->
						<c:if test="${endPage < pageCount }">
							<a href="./CeoMyPage_re.us?sno=${sno }&s=${s }&pageNum=${startPage+pageBlock }">[다음]</a>
						</c:if>
					</c:if>
				  </c:when>
				  <c:otherwise>
				  	<c:if test="${totalSnt != 0}" >
						<!-- 이전 -->
						<c:if test="${startPage > pageBlock }">
							<a href="./CeoMyPage_re.us?sno=${sno }&listType=${listType }&s=${s }&pageNum=${startPage-pageBlock }">[이전]</a>
						</c:if>
						
						<!-- 페이지 번호 -->
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
							<a href="./CeoMyPage_re.us?sno=${sno }&listType=${listType }&s=${s }&pageNum=${i }">${i }</a>
						</c:forEach>
						
						<!-- 다음 -->
						<c:if test="${endPage < pageCount }">
							<a href="./CeoMyPage_re.us?sno=${sno }&listType=${listType }&s=${s }&s=&pageNum=${startPage+pageBlock }">[다음]</a>
						</c:if>
					</c:if>
				  </c:otherwise>
				</c:choose>
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