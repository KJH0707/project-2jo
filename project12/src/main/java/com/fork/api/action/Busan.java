package com.fork.api.action;

public class Busan extends Resion {
	//static final String busanData = "https://api.odcloud.kr/api/15096697/v1/uddi:0bb27225-00f4-4a12-907e-e5afe49f90db"; // 7 Beach
	static final String busanData = "https://api.odcloud.kr/api/15096711/v1/uddi:aa5a69ca-a427-4b7f-b5cd-d39d347f1327"; // 음식테마거리
	
	Busan() {super(busanData);	} // 자식 클래스의 생성자 
	
	@Override
	public String toString() {
		return "부산 기본정보";
	}
	
}

class Busan2 extends Resion {
	//static final String busanData2 ="https://api.odcloud.kr/api/15096698/v1/uddi:5f5fb102-1d75-4ac4-8cbe-a9c3fe4d0031"; // 7 Beach
	static final String busanData2 ="https://api.odcloud.kr/api/15096713/v1/uddi:3c9fef37-f48d-4264-9b9f-b24ee240e54c"; // 음식테마거리
	
	Busan2() {super(busanData2);	} // 자식 클래스의 생성자 
	
	@Override
	public String toString() {
		return "부산 상세정보";
	}
}
