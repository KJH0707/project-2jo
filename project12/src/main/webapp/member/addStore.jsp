<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
<style> 
   .carousel-inner > .carousel-item > img{height: 700px;}
   
   .travelImg{
   
      width:196px;
      height:140px;
   
   }
    
</style>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
<script> 
   $('.carousel').carousel({ interval: 2000 //기본 5초 }) 
</script>
<title>Insert title here</title>
</head>
<body>
 	<h1>addStore.jsp</h1>
 	
 	<form action="" method="post">
 		<input type="text" ><br>
 		<input type="text" ><br>
 		<input type="text" ><br>
 		<input type="text" ><br>
 		<input type="text" ><br>
 		<input type="text" ><br>
 		<input type="text" ><br>
 		<input type="text" ><br>
 		<input type="text" ><br>
 		<input type="text" ><br>
 	</form>
 	
 	
   <div id="demo" class="carousel slide" data-ride="carousel"> 
      <div class="carousel-inner"> <!-- 슬라이드 쇼 --> 
         <div class="carousel-item active"> <!--가로--> 
            <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/여행지1.jpeg" alt="First slide"> 
            <div class="carousel-caption d-none d-md-block"> 
               <h2 class="text-dark text-uppercase text-left">go to travel list</h2> 
               <a href="${pageContext.request.contextPath}/travellist/travelList.travel"><input type="button" value="여행지 보기" class="btn btn-lg btn-outline-success text-white justify-content-start"></a>
            </div> 
         </div> 
         <div class="carousel-item"> 
            <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/호텔.jpg" alt="Second slide">
            <div class="carousel-caption d-none d-md-block"> 
               <h2 class="text-dark text-uppercase text-left">go to hotel list</h2> 
               <a href="${pageContext.request.contextPath}/accommodations/accommodationsList.accommodations"><input type="button" value="호텔 보기" class="btn btn-lg btn-outline-success text-white justify-content-start"></a> 
            </div>  
         </div> 
         <div class="carousel-item"> 
            <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/항공.jpg" alt="Third slide"> 
            <div class="carousel-caption d-none d-md-block"> 
               <h2 class="text-dark text-uppercase text-left">airplane ticket list</h2>
               <a href="${pageContext.request.contextPath}/airplane/AirplaneReservation.jsp"><input type="button" value="항공권 보기" class="btn btn-lg btn-outline-success text-white justify-content-start"></a> 
            </div> 
         </div> <!-- / 슬라이드 쇼 끝 --> <!-- 왼쪽 오른쪽 화살표 버튼 --> 
         <a class="carousel-control-prev" href="#demo" data-slide="prev"> 
            <span class="carousel-control-prev-icon" aria-hidden="true"></span> <!-- <span>Previous</span> --> 
         </a> 
         <a class="carousel-control-next" href="#demo" data-slide="next"> 
            <span class="carousel-control-next-icon" aria-hidden="true"></span> <!-- <span>Next</span> --> 
         </a> <!-- / 화살표 버튼 끝 --> <!-- 인디케이터 --> 
         <ul class="carousel-indicators"> 
            <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작--> 
            <li data-target="#demo" data-slide-to="1"></li> 
            <li data-target="#demo" data-slide-to="2"></li> 
         </ul> <!-- 인디케이터 끝 --> 
      </div>
   </div>
</body>
</html>