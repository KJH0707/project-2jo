<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" >
<fieldset style="background-color: #f7f7f7;">
<h2>쿠폰 생성</h2>
<hr>
쿠폰명: <input type="text" size="60%;"><br>
수량 : <input type="number">
할인율(%): <input type="text" pattern="/d">
최대 할인 금액
사용처: <select>
			<option>한식</option>
			<option>중식</option>
			<option>일식</option>
			<option>양식</option>
			<option>오마카세</option>
		</select>
<br>
배포시작일:<input type="date" value="" min="" max="2050-12-31">
배포종료일:<input type="date" value="" min="" max="2050-12-31">
사용시작일:<input type="date" value="" min="" max="2050-12-31">
사용종료일:<input type="date" value="" min="" max="2050-12-31"><br>
<button value="생성" onclick="">생성</button>
<input type="reset" value="취소" onclick="location.href='history.back();'">
</fieldset>
</table>

</body>
</html>