package com.fork.api.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fork.store.db.StoreDAO;
import com.fork.store.db.StoreDTO;

public class ApiUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : ApiUpdateAction_execute() ");
		StoreDAO dao = new StoreDAO();
		List storeList = dao.getStoreList();
//		StoreDTO dto = (StoreDTO) storeList.get(0);
//		System.out.println("@@@@@@@@@@@@@@@@@@@@@@"+dto.getApi_ID());
//		System.out.println("@@@@@@@@@@@@@@@@@@@@@@"+dto.getS_facility());
		System.out.println(storeList.get(1));
		API api = new API();
		
		//List dto = storeList.get(1);
		//System.out.println("@@@@@@@@"+dto.);
		
		try {
			
			JSONArray dataArr = api.getJsonObject(new Busan()); // 기본정보
			JSONArray dataArr2 = api.getJsonObject(new Busan2()); // 상세정보
			
			Map<Integer, List> map = new HashMap<Integer, List>();
			
			int id;
//			StoreDTO dto;
			
			if(dataArr.size() > 0 ) {
				for(int i=0; i < dataArr.size(); i++ ) { // 배열 사이즈만큼 반복
					JSONObject data = (JSONObject)dataArr.get(i); // 객체로 변환 
					JSONObject data2 = (JSONObject)dataArr2.get(i); // 객체로 변환 
					List list = new ArrayList();
					
					String name = null;
					String addr = null;
					String api_type = null;
					String contents = null;
					String api_hour = null;
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
					String temp = null;
					id = Long.valueOf((Long)data.get("식당(ID)")).intValue();
					
					System.out.println("@@@@@@@@@" +id);
					//dto = (StoreDTO) storeList.get(0);
					
					//System.out.println(storeList.size());
					for(int i2 = 0; i < storeList.size();i2++) {
						dto = (StoreDTO) storeList.get(i2);
						//System.out.println(i2);
						System.out.println("@@@@"+dto.getApi_ID());
						
						if((Integer)dto.getApi_ID()==id) {
							if(!dto.getS_name().equals((String)data.get("식당명"))) {
								name = (String)data.get("식당명");
								System.out.println(name);
							}
							else if(!dto.getS_addr().equals((String)data.get("도로명주소"))) {
								addr = (String)data.get("도로명주소");
								
							}
							else if(!dto.getS_type().equals((String)data.get("영업신고증업태명"))) {
								api_type = (String)data.get("영업신고증업태명");
							}
							else if(!dto.getS_content().equals((String)data.get("음식점소개내용"))) {
								contents = (String)data.get("음식점소개내용");
							}
							else if(!dto.getS_hours().equals((String)data2.get("영업시간내용"))) {
								api_hour = (String)data2.get("영업시간내용");
							}
							else if(!dto.getS_facility().equals(facility)) {
								temp = facility;
							}
							
							System.out.println("@@@@@@@@@" +name);
							list.add(name);
							list.add(addr);
							
							if(api_type.equals("중국식")) {api_type ="중식";}
							list.add(api_type);
							
							list.add(contents);
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
							list.add(temp);
							
							map.put(id, list);
								
						}
						
					}
				}
			}
			
			// 저장 객체 준비 + DAO - 가게 저장 : APIstore(dto)
			dao = new StoreDAO();		
			dto = new StoreDTO();
			
			for (Integer key : map.keySet()) {
				if(dao.APIDataCheck(key)==0){	// 중복데이터 확인
					
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
				
					dto.setC_no(0);
					
					//System.out.println(map.get(key).get(0));
					//dao.APIUpdate(dto);
				}
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		// 페이징 처리
		ActionForward forward = new ActionForward();
		forward.setPath("ApiStore.ap");
		forward.setRedirect(true);
		
		return forward;
	}

}
