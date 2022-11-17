<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
   <head>
      <title>Insert title here</title>


<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="./assets/css/myPage_ceo.css">

<script>
	function stListChange(listType) {
		var listType = $("#stList").val();
// 		alert(listType);
		location.href = "${pageContext.request.contextPath}/CeoMyPage_st.us?listType="+listType;
	}
	
	function con(s_no){
		var co = confirm("정말 삭제하시겠어요?");
		var co2 = confirm("한번 더 확인을 누르시면 삭제됩니다.");
		if(co == true){
			if(co2 == true){
			location.href="./DeleteStoreAction.us?s_no="+s_no;
			} else {
				alert('취소되었습니다.');
			}
		} else {
			alert('취소되었습니다.');
		}
	}
	
</script>
<script type="text/javascript">	
$(function(){
	
	
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
<!--                                 <span class="property-price">3000000$</span> -->
                               </div>
                             
                           </li>
                           <li>
                           	  <a href="./CeoMyPage_book.us">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/people.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="./CeoMyPage_book.us">예약 관리</a></h6>
<!--                                <span class="property-price">3000000$</span> -->
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
<!--                                     <span class="property-price">3000000$</span> -->
                               </div>
                           </li>
                           <li>
                           	  <a href="링크">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/note.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="링크">회원정보 관리</a></h6>
<!--                                      <span class="property-price">3000000$</span> -->
                               </div>
                           </li>
                       </ul>
                      </div>
                  </div>
              </div>
          </div>

 
 <!--  //////////////////// 목록  /////////////////////// -->      
<div class="col-md-9  pr0 padding-top-40 properties-page">
                        <div class="row">
                            <div class="col-md-8 col-sm-12">
                                <h3 class="tm-block-title d-inline-block">가 게 관 리
                                <button type=button onclick="location.href='./member/addStore.jsp';" style="background:black; color:white; font-size:13px;">가게+</button>
                               </h3>
                            </div>
                            <br>
                            <div class="text-right">
                            <button type="button" onclick="sort()"><i class="glyphicon glyphicon-sort"></i></button>
                            <select id="stList"  onchange="stListChange(this.value)" style="font-size:10px">
                            	<option value=s_regdate ${listType == "s_regdate" ? 'selected="selected"' : '' }>최신순</option>
                            	<option value=bcount ${listType == "bcount" ? 'selected="selected"' : '' }>찜 많은순</option>
                            	<option value=rcount ${listType == "rcount" ? 'selected="selected"' : '' }>리뷰 많은순</option>
                            	<option value=s_star ${listType == "s_star" ? 'selected="selected"' : '' }>별점 높은순</option>
                            </select>
                        </div>
                        </div>
<!-- 	<hr style="border:dotted 2px gray"> -->
	<hr>

  <c:forEach var="sdto" items="${storeList }">
  <div class="well" style="width:800px; background:white">
      <div class="media">
      	<a class="pull-left" href="#">
    		<img src="assets/img/myPage/cow.jpg" style="width:200px; height:200px;">
  		</a>
  		<div class="media-body">
    		<h4 class="media-heading">${sdto.s_name } <i style="font-size:13px">${sdto.s_regdate }</i></h4>
    		 <ul class="list-inline list-unstyled">
  			<li><span><i class="glyphicon glyphicon-heart"></i></span> ${sdto.bcount} </li>
            <li>|</li>
            <li><span><i class="glyphicon glyphicon-comment"></i></span> ${sdto.rcount}</li>
            <li>|</li>
            <li>
               <span><i class="glyphicon glyphicon-star"></i></span>  ${sdto.s_star }
            </li>
            <li>
          	<span align="right"><i class="glyphicon glyphicon-pencil"></i></span>
<%--           	<span class="text-right"><button type="button" onclick="location.href='./DeleteStoreActin.us?s_no=${sdto.s_no}';" style="background:white"> --%>
          	<span class="text-right"><button type="button" onclick="con(${sdto.s_no})" style="background:white">
          	<i class="glyphicon glyphicon-trash"></i></button></span>
          	</li>
			</ul>
    		<hr>
    		<div style="font-size:13px">
    	<table border="1" style="width:100%; valign:middle;">
          <tr>
          <td ><b>사업자등록번호</b> </td>
          <td style="margin-right:50px">${sdto.s_number }</td>
          <td ><b>주소</b></td>
          <td>${sdto.s_addr }</td>
          </tr>
          <tr>
          <td ><b>연락처</b></td>
          <td>${sdto.s_tel }</td>
          <td ><b>영업시간 </b></td>
          <td>${sdto.s_hours }</td>
          </tr>
          <tr>
          <td ><b>종류 </b></td>
          <td>${sdto.s_type }</td>
          <td ><b>편의시설 </b></td>
          <td>${sdto.s_facility }</td>
          </tr>
          <tr>
          <td rowspan="3"><b>소개</b></td>
          <td colspan="3">${sdto.s_content }</td>
          </tr>
          </table>
          </div>
       </div>
    </div>
  </div>
</c:forEach>

<div align="center" style="font-size:20px; color:black">
<c:if test="${totalSnt != 0}" >
	<!-- 이전 -->
	<c:if test="${startPage > pageBlock }">
		<a href="./CeoMyPage_st.us?listType=${listType }&pageNum=${startPage-pageBlock }">[이전]</a>
	</c:if>
	
	<!-- 페이지 번호 -->
	<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
		<a href="./CeoMyPage_st.us?listType=${listType }&pageNum=${i }">${i }</a>
	</c:forEach>
	
	<!-- 다음 -->
	<c:if test="${endPage < pageCount }">
		<a href="./CeoMyPage_st.us?listType=${listType }&pageNum=${startPage+pageBlock }">[다음]</a>
	</c:if>
</c:if>
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