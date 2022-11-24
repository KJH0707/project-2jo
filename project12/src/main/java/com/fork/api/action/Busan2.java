package com.fork.api.action;

public class Busan2 extends Resion {
//	static final String busanData2 ="https://api.odcloud.kr/api/15096698/v1/uddi:5f5fb102-1d75-4ac4-8cbe-a9c3fe4d0031";
	static final String busanData2 ="https://api.odcloud.kr/api/15096713/v1/uddi:3c9fef37-f48d-4264-9b9f-b24ee240e54c";
//	static final String busanData2 ="https://api.odcloud.kr/api/15096698/v1/uddi:5f5fb102-1d75-4ac4-8cbe-a9c3fe4d0031";
	
	Busan2() {super(busanData2);	} // 자식 클래스의 생성자 
	
	@Override
	public String toString() {
		return "부산 상세정보";
	}
}
