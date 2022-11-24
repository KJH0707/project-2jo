package com.fork.api.action;

public class JeonBuk extends Resion {
	static final String jeonbukData = "https://apis.data.go.kr/6450000/ThemeRestaurantService/getThemeRestaurant?ServiceKey=r7vMfuIM028q5UlJbPSdZnL%252FVJhFh%252F6L7EsElCD%252Bxp84aM1lBU6YgLII6C5hfi6O%252BV%252B9bsi4Z5nqsTCM26e3Ww%253D%253D&Theme=%ED%85%8C%EB%A7%88%EB%B6%84%EB%A5%98(mood%3D%EB%B6%84%EC%9C%84%EA%B8%B0%EB%B3%84%20inte%3D%EC%9D%B8%ED%85%8C%EB%A6%AC%EC%96%B4%EB%B3%84%20price%3D%EA%B0%80%EA%B2%A9%EB%8C%80%EB%B3%84%20age%3D%EC%97%B0%EB%A0%B9%EB%8C%80%EB%B3%84)&Search=%EA%B2%80%EC%83%89%EA%B0%92(%EB%B6%84%EC%9C%84%EA%B8%B0%EB%B3%84(%EC%A1%B0%EC%9A%A9%2C%EA%B2%BD%EC%BE%8C%2C%ED%8E%B8%EC%95%88)%2C%EC%97%B0%EB%A0%B9%EB%B3%84(10%EB%8C%80%EB%AF%B8%EB%A7%8C%2C10~20%EB%8C%80%2C20~30%EB%8C%80%2C30~40%EB%8C%80%2C40~50%EB%8C%80%2C50~60%EB%8C%80%2C60%EB%8C%80%EC%9D%B4%EC%83%81%2C%EB%94%94%EC%96%91%ED%95%A8))"; // 전북데이터 정보가져가기
	static final String jeonbukData2 = "https://apis.data.go.kr/6450000/ThemeRestaurantService/getThemeRestaurantDetail?ServiceKey=r7vMfuIM028q5UlJbPSdZnL%252FVJhFh%252F6L7EsElCD%252Bxp84aM1lBU6YgLII6C5hfi6O%252BV%252B9bsi4Z5nqsTCM26e3Ww%253D%253D&SNO=%EA%B3%A0%EC%9C%A0%EA%B0%92";
	JeonBuk() {super(jeonbukData); }

}
