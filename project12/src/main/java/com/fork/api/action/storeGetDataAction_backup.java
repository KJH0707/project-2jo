package com.fork.api.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.bag.SynchronizedSortedBag;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fork.store.db.StoreDAO;
import com.fork.store.db.StoreDTO;
import com.google.gson.JsonArray;

public class storeGetDataAction_backup implements Action {
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : storeGetDataAction_execute()");	
		
		API api = new API();
		
		try {
			
			JSONArray dataArr = api.getJsonObject(new Busan()); // object타입을 json배열로 저장
			JSONArray dataArr2 = api.getJsonObject(new Busan2());
			
			Map<Integer, List> map = new HashMap<Integer, List>();
			
			int id;
			
			if(dataArr.size() > 0 ) {
				for(int i=0; i < dataArr.size(); i++ ) { // 배열 사이즈만큼 반복
					JSONObject data = (JSONObject)dataArr.get(i); // 객체로 변환 
					JSONObject data2 = (JSONObject)dataArr2.get(i); // 객체로 변환 
					List list = new ArrayList();
					
					
					//System.out.println(data); // 내부 데이터 확인
					//System.out.println();
					//System.out.println(data2);
					
					// 원하는 형태로 데이터 변환
					String api_type = (String)data.get("영업신고증업태명");
					String api_hour = (String)data2.get("영업시간내용");
					String hour = "10:00~21:00"; // defalut 값
					
					String corkage = null;
					String hirable = null;
					String parking = (String)data2.get("주차가능여부");
					if(parking.equals("Y")){
						parking = "주차가능";
					}else {
						parking = null;
					}
					String animal = (String)data2.get("반려동물입장가능여부");
					if(animal.equals("Y")){
						animal = "반려동물가능";
					}else {
						animal = null;
					}
					String kids = (String)data2.get("놀이방유무");
					if(kids.equals("N")){
						kids = "노키즈존";
					}else {
						kids = null;
					}
					String facility = parking+","+animal+","+kids+","+corkage+","+hirable;
					
					
					list.add((String)data.get("식당명"));
					list.add((String)data.get("도로명주소"));
					
					if(api_type.equals("중국식")) {api_type ="중식";}
					list.add(api_type);
					
					list.add((String)data.get("음식점소개내용"));
					list.add((String)data.get("식당대표전화번호"));
					list.add(0);
					list.add("준비중입니다");
					list.add(555555555);
					list.add("default.jsp,null,null");
					list.add("null,null,null,null,null");
					list.add(",,,,");
					
					if(api_hour!=null){ hour = ((String)data2.get("영업시간내용")).split(" ")[1];}
					list.add(hour);
					// 편의시설
					list.add(facility);
					
					id = Long.valueOf((Long)data.get("식당(ID)")).intValue();
					map.put(id, list);
				}
			}	
			StoreDAO dao = new StoreDAO();		
			StoreDTO dto = new StoreDTO();
			for (Integer key : map.keySet()) {
				if((boolean) dao.APIDataCheck((String)map.get(key).get(4))){
					
					dto.setS_name((String)map.get(key).get(0));
					dto.setS_addr((String)map.get(key).get(1));
					dto.setS_type((String)map.get(key).get(2));
					dto.setS_content((String)map.get(key).get(3));
					dto.setS_tel((String)map.get(key).get(4));
					dto.setS_price((Integer)map.get(key).get(5)); // 가격대
					dto.setS_menuname((String)map.get(key).get(6));
					dto.setS_number((Integer)map.get(key).get(7)); // 기본값 - 사업자번호
					dto.setS_image((String)map.get(key).get(8));
					dto.setS_menuImg((String)map.get(key).get(9));
					dto.setS_menuprice((String)map.get(key).get(10));
					dto.setS_hours((String)map.get(key).get(11));
					dto.setS_type((String)map.get(key).get(12));
					dto.setC_no(0);
					
					dao.APIstore(dto);
					
				}
					
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 페이징 처리
		ActionForward forward = new ActionForward();
		forward.setPath("ApiStore.ap");
		forward.setRedirect(false);
		
		
		return forward;
		
	}
		
//	public static void main(String args[]) {
		
//		Resion b = new Busan(); 			// 부산
//		Resion kyungNam = new kyungNam(); 		// 경남
//		Resion seoul = new Seoul();				// 서울
//		Resion gyunggi = new Gyunggi(); 		// 경기
//		Resion deagu = new Deagu(); 			// 대구
//		Resion kyungBuk = new kyungBuk(); 		// 경북
//		Resion jeju = new Jeju(); 				// 제주
//		Resion chungcheong = new Chungcheong(); // 충청
//		Resion jeonNam = new JeonNam(); 		// 전남
//		Resion jeonBuk = new JeonBuk(); 		// 전북
//		Resion gwangju = new Gwangju(); 		// 광주
//		Resion gangwon = new Gangwon(); 		// 강원
//		Resion deajeon = new Deajeon(); 		// 대전
		
//	}
	
//	@Override
//	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println(" M : storeAction_execute()");
//		
//
//		
//		// 메서드 가져옴
//		StoreDAO dao = new StoreDAO();
//		dao.APIstore(dto);
//		
//		// 페이지 이동
//		ActionForward forward = new ActionForward();
//		forward.setPath("./main.st");
//		forward.setRedirect(false);
//		return null;
//	}
//
//	@Override
//	public void Url() {
//		// TODO Auto-generated method stub
//		
//	}

	
}
