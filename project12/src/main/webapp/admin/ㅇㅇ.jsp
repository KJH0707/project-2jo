<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
	  $("#hide").click(function(){
		  ${'#dd'}.hide();
		});

	
  });
</script>
</head>
<body>
<input type="button" id="hide">
<div id="dd">
	이벤트 기간 :<br> 
	시작일자 <input type="date" name="eventSdate"><br>
	종료일자 <input type="date" name="eventEdate">
												
	</div>
</body>
</html>