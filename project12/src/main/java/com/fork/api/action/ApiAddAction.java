package com.fork.api.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fork.store.db.StoreDAO;
import com.fork.store.db.StoreDTO;

public class ApiAddAction implements Action {
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : ApiAddAction_execute()");	
		
		API api = new API();
		
		try {
			
			JSONArray dataArr = api.getJsonObject(new Busan()); // 기본정보
			JSONArray dataArr2 = api.getJsonObject(new Busan2()); // 상세정보
			//JSONArray dataArr3 = api.getJsonObject(new Busan3()); // 이미지정보
			
			Map<Integer, List> map = new HashMap<Integer, List>();
			
			int id;
			
			if(dataArr.size() > 0 || dataArr2.size() > 0) {
				for(int i=0; i < dataArr.size(); i++ ) { // 배열 사이즈만큼 반복
					JSONObject data = (JSONObject)dataArr.get(i); // 객체로 변환 
					JSONObject data2 = (JSONObject)dataArr2.get(i); // 객체로 변환 
					//JSONObject data3 = (JSONObject)dataArr3.get(i); // 객체로 변환 
					List list = new ArrayList();
					
					
					//System.out.println(data); // 내부 데이터 확인
					//System.out.println();
					//System.out.println(data2);
					
					// 원하는 형태로 데이터 변환
					String api_type = (String)data.get("영업신고증업태명");
					String api_hour = (String)data2.get("영업시간내용");
					String hour = "10:00~21:00"; // defalut 값
					
					String corkage = null;
					String group = "대관";
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
						kids = "키즈존";
					}
					String facility = parking+","+animal+","+kids+","+corkage+","+group;
					int price = (int)(Math.random()*10)+1;
					//System.out.println(price*10000);
					
					list.add((String)data.get("식당명"));
					list.add((String)data.get("도로명주소"));
					
					if(api_type.equals("중국식")) {api_type ="중식";}
					list.add(api_type);
					
					list.add((String)data.get("음식점소개내용"));
					list.add((String)data.get("식당대표전화번호"));
					list.add(price*10000);
					list.add("준비중입니다");
					list.add(555555555);
					list.add("default.jsp,null,null");
					list.add("default.jsp,null,null,null,null");
					list.add(price*10000+",,,,");
					
					if(api_hour!=null){ hour = ((String)data2.get("영업시간내용")).split(" ")[1];}
					list.add(hour);
					// 편의시설
					list.add(facility);
					
					id = Long.valueOf((Long)data.get("식당(ID)")).intValue();
					map.put(id, list);
				}
			}	
			
			// 저장 객체 준비 + DAO - 가게 저장 : APIstore(dto)
			StoreDAO dao = new StoreDAO();		
			StoreDTO dto = new StoreDTO();
			for (Integer key : map.keySet()) {
				String tmp = String.valueOf(key);
				if(dao.APIDataCheck(tmp)==0){	// apiID를 이용한 중복데이터 확인
					
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
					dto.setS_facility((String)map.get(key).get(12));
					dto.setApi_ID(key);
					
					dto.setC_no(0);
					
					//System.out.println(map.get(key).get(0));
					dao.APIstore(dto);
				}
			}
			
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 페이징 처리
		ActionForward forward = new ActionForward();
		forward.setPath("ApiStore.ap");
		forward.setRedirect(true);
		
		return forward;
		
	}
		
}
