package com.fork.api.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.fork.store.db.StoreDTO;
import com.google.gson.JsonObject;

public class Busan extends Resion {
	//static final String busanData = "https://api.odcloud.kr/api/15096697/v1/uddi:0bb27225-00f4-4a12-907e-e5afe49f90db"; // 부산데이터 정보가져가기
	static final String busanData = "https://api.odcloud.kr/api/15096711/v1/uddi:aa5a69ca-a427-4b7f-b5cd-d39d347f1327"; // 변경하기
//	List l = new ArrayList();
//	static HashMap<"가게(ID)", l> busan = new HashMap<>();
	
	Busan() {super(busanData);	} // 자식 클래스의 생성자 
	
	@Override
	public String toString() {
		return "부산 기본정보";
	}
	
//	public static void main(String[] args) {
//		for(int i=1;i<'가져오는 데이터의 길이';i++) {
//			addStoreNo("가게(ID)",arraylist);
//		}
//		
//		printList(); // 가게 전체를 저장하는 메서드
//	}
//	// 그룹에 전화번호 추가 메서드
//	static void addTelNo(String StoreID, StoreDTO dto) {
//		addGroup(groupName); // 그룹 분류 메서드
//		HashMap group = (HashMap)busan.get(groupName); // 그룹 번호를 가져와서 group 변수에 저장
//		group.put(dto.getS_tel(), dto); // dto. 전화번호는 key로 취급하고, 뒤는 중복되더라도 가능하게 저장
//		
//	}
//	// 그룹을 추가하는 메서드
//	static void addGroup(String groupName) {
//		if(!busan.containskey(groupName)) busan.put(groupName, new ArrayList()); 
//	}
//	
//	static void printList() { // 전화번호 전체를 출력하는 메서드
//		Set<E> set = busan.entrySet();
//		Iterator it = set.iterator();
//		
//		while(it.hasNext()) {
//			Map.Entry<K, V> e =(Map.Entry<K, V>)it.next(); // 읽어서 map에 저장 // 제일 큰 항목을 부산/경남으로 
//			
//			Set subSet = ((HashMap)e.getValue()).entrySet();	// 내의 하위 ArrayList를 저장
//			Iterator subIt = subSet.iterator(); 				// 하위 리스트를 읽도록 저장 // 크기를 가져오려면 subSet.size() 사용
//			
//			StoreDTO dto = new StoreDTO();
//			while(subIt.hasNext()) { // 해당하는 값이 있다면
//				Map.Entry subE = (Map.Entry)subIt.next();
//				List data = (List)subE.getValue(); // 값을 배열에 저장
//				//하나씩 저장하도록 할 것
//				dto.setS_addr(busanData);		// 주소
//				dto.setS_content(busanData);	// 소개글
//				dto.setS_facility(busanData);	// 시설
//				dto.setS_hours(busanData);		// 운영시간
//				dto.setS_image(busanData);		// 가게 사진
//				dto.setS_menuImg(busanData);	// 메뉴이미지
//				dto.setS_menuname(busanData);	// 메뉴이름
//				dto.setS_menuprice(busanData);	// 메뉴가격
//				dto.setS_name(busanData);	// 가게이름
//				dto.setS_number(0); 		// 사업자번호
//				dto.setS_price(0); 			// 가격대
//				dto.setS_tel(busanData);	// 전화번호
//				dto.setS_type(busanData); 	// 업종
//				
//			}
//			
//			
//			
//		}
//		
//	}
	
	// 기본데이터와 상세데이터 모두 가져 올 것.
	
	
	

//	Map<K, V> map = new HashMap<>();
//	List<E> list = new ArrayList<>();
//	map.put("가게(ID)",list);
//	BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
//	
//	while(true) {
//		String storeID = br.readLine();
//		
//		if(!map.containsKey("가게(ID)")) {
//			continue; // 해당 가게가 없는 경우 
//		}
//		if(!map.get("가게(ID)").equals(list)) {// 가게에 대한 정보가 다른 경우
//			
//		}else {
//			//같으면 데이터를 같은 항목에 update를 사용하여 저장할 것
//		}
//	}
//	Iterator<E> it  map.entrySet().iterator();
//	
//	while(it.hasNext()) {
//		JsonObject obj = it.next(); // 값 하나씩 obj에 저장 
//		
//	}
	
	
	
}
