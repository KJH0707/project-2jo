package com.fork.api.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
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
		List<Map<String,Object>> storeList = dao.getStoreList();
		
		API api = new API();
		
		JSONArray dataArr = api.getJsonObject(new Busan()); // 기본정보
		JSONArray dataArr2 = api.getJsonObject(new Busan2()); // 상세정보
		Map<String, List> map = new HashMap<String, List>();
		String id;
		
		for(int i2 = 0; i2 < storeList.size();i2++) {
			
			if(dataArr.size() > 0 ) {
				for(int i=0; i < dataArr.size(); i++ ) { // 배열 사이즈만큼 반복
					JSONObject data = (JSONObject)dataArr.get(i); // 객체로 변환 
					JSONObject data2 = (JSONObject)dataArr2.get(i); // 객체로 변환 
					List list = new ArrayList();
					
					String name = storeList.get(i2).get("s_name").toString();
					String addr = storeList.get(i2).get("s_addr").toString();
					String api_type = storeList.get(i2).get("s_type").toString();
					String str = (String)data.get("영업신고증업태명");
					if(str.equals("중국식")) {str ="중식";}
					String contents = storeList.get(i2).get("s_content").toString();
					String origin_hour = storeList.get(i2).get("s_hours").toString();
					String hour = "10:00~21:00"; 
					if((String)data2.get("영업시간내용")!=null) {
						hour= ((String)data2.get("영업시간내용")).split(" ")[1];
					}
					
					//System.out.println(((String)data2.get("영업시간내용")));
					//if(api_hour!=null){ hour = ((String)data2.get("영업시간내용")).split(" ")[1];}
					//if(api_hour==null){ hour = "10:00~21:00";}
					
					String tel = storeList.get(i2).get("s_tel").toString();
					
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
					String tmp = storeList.get(i2).get("s_facility").toString();
					String facility = parking+","+animal+","+kids+","+corkage+","+hirable;
					id = (Long)data.get("식당(ID)")+" ";
					//int price = (int)(Math.random()*10)+1;
							
					//System.out.println(" M : api : " +id.trim()+"@@@@@@@@@@@@@");
					
					//System.out.println(storeList.get(i2).get("api_ID").toString().equals(id.trim()));
					//System.out.println(" M : dto : "+storeList.get(i2).get("api_ID").toString());
					StoreDTO dto = new StoreDTO();
					if(storeList.get(i2).get("api_ID").toString().equals(id.trim())) {
						
						dto.setS_name(name);
						dto.setS_addr(addr);
			
						dto.setS_type(api_type);
						dto.setS_content(contents);
						dto.setS_tel(tel);
						dto.setS_hours(origin_hour);
						dto.setS_facility(tmp);
						dto.setApi_ID(Integer.parseInt(id.trim()));
						//dto.setS_price(price*10000);
						
						if(!storeList.get(i2).get("s_name").toString().equals((String)data.get("식당명"))) {
							name = (String)data.get("식당명");
							dto.setS_name(name);
							//System.out.println("api :"+name);
							//System.out.println("dto: "+storeList.get(i2).get("s_name").toString());
						}
						else if(!storeList.get(i2).get("s_addr").toString().equals((String)data.get("도로명주소"))) {
							addr = (String)data.get("도로명주소");
							dto.setS_addr(addr);
						}
						else if(!storeList.get(i2).get("s_type").toString().equals(str)) {
							dto.setS_type(str);
						}
						else if(!storeList.get(i2).get("s_content").toString().equals((String)data.get("음식점소개내용"))) {
							contents = (String)data.get("음식점소개내용");
							dto.setS_content(contents);
						}
						else if(!storeList.get(i2).get("s_hours").toString().equals(hour)) {
							dto.setS_hours(hour);
						}
						else if(!tmp.equals(facility)) {
							tmp = facility;
							dto.setS_facility(tmp);
						}
						else if(!storeList.get(i2).get("s_tel").toString().equals((String)data.get("식당대표전화번호"))) {
							tel = (String)data.get("식당대표전화번호");
							dto.setS_tel(tel);
						}
						
						dao = new StoreDAO();
						dao.APIUpdate(dto);
					}
				}
			}
		}
			
		// 페이징 처리
		ActionForward forward = new ActionForward();
		forward.setPath("ApiStore.ap");
		forward.setRedirect(true);
		
		return forward;

	}
}