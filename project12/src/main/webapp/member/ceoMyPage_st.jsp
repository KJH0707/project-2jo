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
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="./assets/css/myPage_ceo.css">

<script>


	function stListChange(listType) {
		var listType = $("#stList").val();
// 		alert(listType);
		location.href = "${pageContext.request.contextPath}/CeoMyPage_st.us?listType="+listType+"&s=0";
	}
	
	function sort() {
		var s = $("#sor").val();
		var listType = $("#stList").val();
		
		if(s==0){
			$("#sor").attr("value",1);
		location.href = "${pageContext.request.contextPath}/CeoMyPage_st.us?listType="+listType+"&s=1";
		} else if(s==1){
			$("#sor").attr("value",0);
		location.href = "${pageContext.request.contextPath}/CeoMyPage_st.us?listType="+listType+"&s=0";
		}
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

 
 <!--  //////////////////// 목록  /////////////////////// -->      
<div class="col-md-9  pr0 padding-top-40 properties-page">
    <div class="row">
        <div class="col-md-8 col-sm-12">
            <h3 class="tm-block-title d-inline-block">가 게 관 리
            <button type=button onclick="location.href='./StoreJoin.st;" style="background:black; color:white; font-size:13px;">가게+</button>
           </h3>
        </div>
        <br>
        <div class="text-right">
        <button type="button" id="sor" value="${s }" onclick="sort()"><i class="glyphicon glyphicon-sort"></i></button>
        <select id="stList"  onchange="stListChange(this.value)" style="font-size:10px">
        	<option value=s_regdate ${listType == "s_regdate" ? 'selected="selected"' : '' }>최신순</option>
        	<option value=bcount ${listType == "bcount" ? 'selected="selected"' : '' }>찜순</option>
        	<option value=rcount ${listType == "rcount" ? 'selected="selected"' : '' }>리뷰순</option>
        	<option value=s_star ${listType == "s_star" ? 'selected="selected"' : '' }>별점순</option>
        </select>
    </div>
    </div>
<!-- 	<hr style="border:dotted 2px gray"> -->
	<hr>

  <c:forEach var="sdto" items="${storeList }">
  <div class="well" style="width:800px; background:white">
      <div class="media">
      	<a class="pull-left" href="#">
    		<img src="./upload/${sdto.s_image.split(',')[0] }" style="width:200px; height:200px;">
  		</a>
  		<div class="media-body">
    		<h4 class="media-heading">${sdto.s_name } <i style="font-size:13px">${sdto.s_regdate }</i></h4>
    		 <ul class="list-inline list-unstyled">
  			<li><span style="color:red"><i class="glyphicon glyphicon-heart"></i></span> ${sdto.bcount} </li>
            <li>|</li>
            <li><span style="color:skyblue"><i class="glyphicon glyphicon-comment"></i></span> ${sdto.rcount}</li>
            <li>|</li>
            <li><span style="color:#FFE400"><i class="fa-sharp fa-solid fa-star"></i></span> ${sdto.s_star }
            </li>
            <li>
          	<span align="right"><i class="glyphicon glyphicon-pencil"></i></span>
          	<span class="text-right"><button type="button" onclick="con(${sdto.s_no})" style="background:white">
          	<i class="glyphicon glyphicon-trash"></i></button></span>
          	</li>
			</ul>
    		<hr>
    		<div style="font-size:13px">
    	<table border="1" style="width:100%; valign:middle; table-layout:fixed; text-align:center" >
          <tr>
          <td style="width:20%"><b>사업자등록번호</b> </td>
          <td style="margin-right:50px; width:20%;">${sdto.s_number }</td>
          <td style="width:15%"><b>주소</b></td>
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
          <td>
         	 <c:forTokens var="s_facility" items="${sdto.s_facility }" delims=",">
         	 	<c:if test="${s_facility!='null'}">
         	 	[${s_facility }]
         	 	</c:if>
			</c:forTokens>
		  </td>
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
		<a href="./CeoMyPage_st.us?listType=${listType }&s=${s }&pageNum=${startPage-pageBlock }">[이전]</a>
	</c:if>
	
	<!-- 페이지 번호 -->
	<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
		<a href="./CeoMyPage_st.us?listType=${listType }&s=${s }&pageNum=${i }">${i }</a>
	</c:forEach>
	
	<!-- 다음 -->
	<c:if test="${endPage < pageCount }">
		<a href="./CeoMyPage_st.us?listType=${listType }&s=${s }&pageNum=${startPage+pageBlock }">[다음]</a>
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