package com.fork.api.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BestStore extends Resion {
	static final String bestData ="https://api.odcloud.kr/api/15096713/v1/uddi:3c9fef37-f48d-4264-9b9f-b24ee240e54c";
	
	BestStore() {super(bestData);}

	@Override
	public String toString() {
		return "부산 맛집정보(2020.08.20기준)";
	}
}
