<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>쿠폰 생성</h2>
쿠폰이름: <input type="text">
수량 : <input type="number">
할인율(%): <input type="text" pattern="/d">
사용처: <select>
			<option>한식</option>
			<option>중식</option>
			<option>일식</option>
			<option>양식</option>
			<option>오마카세</option>
		</select>
배포시작일:<input type="datetime">
배포종료일:<input type="datetime">
사용시작일:<input type="datetime">
사용종료일:<input type="datetime">
<button value="생성"/>
<button value="취소"/>

</body>
</html>