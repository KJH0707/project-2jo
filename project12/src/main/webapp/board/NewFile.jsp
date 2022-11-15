<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<script src="./board/jquery-3.6.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
$('#star a').click(function(){ 
	 $(this).parent().children("a").removeClass("on");    
	 $(this).addClass("on").prevAll("a").addClass("on");
	 return false;
});

var star = $('.star');
star.each(function(){
	var targetScore = $(this).attr('date-rate');
	console.log(targetScore);
	
});

 });

</script>

</head>
<body>


<P id="star"> <!-- 부모 -->
<a href="#" value="1" data-rate="1">★</a> <!-- 자식들--> 
<a href="#" value="2" data-rate="2">★</a> 
<a href="#" value="3" data-rate="3">★</a>
<a href="#" value="4" data-rate="4">★</a>
<a href="#" value="5" data-rate="5">★</a>
<p>


<P id="star"> <!-- 부모 -->
<a href="#" value="1" >★</a> <!-- 자식들--> 
<a href="#" value="2" >★</a> 
<a href="#" value="3" >★</a>
<a href="#" value="4" >★</a>
<a href="#" value="5" >★</a>
<p>

</body>
</html>