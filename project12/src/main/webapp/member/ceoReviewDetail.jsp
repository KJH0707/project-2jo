<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<title>Fork and Knife | My page</title>

<style>
div.polaroid {
  float:left;
  width: 30%;
  height: 30%;
  background-color: white;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  margin-bottom: 25px;
  
}

div.poltext {
  text-align: center;
  padding: 0px 20px;
}  

div.ceo {
  border:1px solid black;
  text-align: center;
  border-radius: 10px;
  background: #F6F6F6;
  padding: 0px 10px;
}

p {
padding: 0px 10px;
font-size:15px;
}
  
</style>

<script>
	$(function(){
		
		// 등록
		$("#write").click(function(){
			let reply = $("#reply").val();
			let rev_no = $("#rev_no").val();
			
			if(reply != null){
			$.ajax({
				url:'${pageContext.request.contextPath}/CeoReWriteAction.us',
				method:'post',
				data:{reply:reply, rev_no:rev_no},
				success:function(result){
					if(result==1){
						alert("등록되었습니다.");
						window.opener.rvok();
						window.location.reload();
						
					}
				},
				error:function(){
					alert("실패");
				}
			});
			} else {
				alert('내용을 입력해주세요');
			}
		});
		
		$("#update").click(function(){
			
			$("#wr").hide();
			$("#upd").show();
		});
		
		// 수정
		$("#write2").click(function(){
			let reply = $("#updreply").val();
			let rev_no = $("#rev_no").val();
		
			if(reply != null){
				$.ajax({
					url:'${pageContext.request.contextPath}/CeoReWriteAction.us',
					method:'post',
					data:{reply:reply, rev_no:rev_no},
					success:function(result){
						if(result==1){
							alert("수정되었습니다.");
							window.location.reload();
						}
					},
					error:function(){
						alert("실패");
					}
				});
				
				} else {
					alert('내용을 입력해주세요');
				}
			});
		
		// 삭제
		$("#delete").click(function(){
			let rev_no = $("#rev_no").val();
		
				$.ajax({
					url:'${pageContext.request.contextPath}/CeoReDeleteAction.us',
					method:'post',
					data:{rev_no:rev_no},
					success:function(result){
						if(result==1){
							alert("삭제되었습니다.");
							window.location.reload();
							window.opener.rvok();
						}
					},
					error:function(){
						alert("실패");
					}
				});
				
			});
		
		
	});

</script>


</head>
<body>
<div class="polaroid" style="width:100%">
  <div style="display:flex; width:100%">
  	  <div style="width:90%">
  	  <input type="hidden" id="rev_no" value="${rdto.rev_no }">
  	  <p style="margin:10px 0px 0px;"><b>${rdto.m_nickname }</b></p>
  	  <p ><small>
  	  <span style="color:#FFE400">
  	 	 <c:choose>
      	   <c:when test="${rdto.rev_star==1}">
      	  	<i class="fa-sharp fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i>
      	   </c:when>
      	   <c:when test="${rdto.rev_star==2}">
      	   	<i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i>
      	   </c:when>
      	   <c:when test="${rdto.rev_star==3}">
      	   	<i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i>
      	   </c:when>
      	   <c:when test="${rdto.rev_star==4}">
      	   	<i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-regular fa-star"></i>
      	   </c:when>
      	   <c:when test="${rdto.rev_star==5}">
       	   	<i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i><i class="fa-sharp fa-solid fa-star"></i>
       	   </c:when>
       	</c:choose>
	 </span>
  	   ${rdto.date }</small></p>
  	  </div>
  	  <div align="right">
  	  <p style="padding: 10px 0px;"><small>
  	  	
  	  </small></p>
  	  </div>
  	  </div>
  <div>
  <c:choose>
    <c:when test="${rdto.rev_file==null }">
  		<img src="assets/img/forks.jpg" alt="none" style="width:100%; height:250px" >
  	</c:when>
  	<c:otherwise>
  		<img src="./upload/${rdto.rev_file.split(',')[0] }" alt="rev_file" style="width:100%; height:250px">
  	</c:otherwise>
  </c:choose>
  </div>
  <div class="poltext">
  <p>${rdto.rev_subject }</p>
  <p>
  <small>${rdto.rev_content }</small>
  </p>
  </div>
</div>
<hr>
<div class="ceo" id="wr">
<c:choose>
	<c:when test="${rdto.rev_c_re == null || rdto.rev_c_re == ''}">
		<details>
		<summary>답글 등록하기</summary>
			<textarea name="reply" id="reply" style="width:90%; height:300px" placeholder="입력해주세요"></textarea>
			<button type="button" id="write">등록</button>
		</details>
	</c:when>
	<c:otherwise>
		<p align="left"><b>사장님</b>
			<button type="button" id="update"><i class="fa-sharp fa-solid fa-pen"></i></button>
			<button type="button" id="delete"><i class="fa-solid fa-trash"></i></button>
		</p>
		<p><small>${rdto.rev_c_re }</small></p>
	</c:otherwise>
</c:choose>
 </div>
 
<div class="ceo" id="upd" style="display:none;">
	<p></p>
	<textarea name="updreply" id="updreply" style="width:90%; height:300px">${rdto.rev_c_re }</textarea>
	<button type="button" id="write2">수정</button>
</div>
</body>
</html>