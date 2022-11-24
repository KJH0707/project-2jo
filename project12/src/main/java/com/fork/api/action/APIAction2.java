package com.fork.api.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class APIAction2 {

	public static String getTagValue(String item, Element eElement) {

    	//결과를 저장할 result 변수 선언
    	String result = "";

		NodeList nlList = eElement.getElementsByTagName(item).item(0).getChildNodes();
	
		result = nlList.item(0).getTextContent();
	
		return result;
	}

	// tag값의 정보를 가져오는 함수
	public static String getTagValue(String item, String childTag, Element eElement) {
	
	//결과를 저장할 result 변수 선언
	String result = "";
	
	NodeList nlList = eElement.getElementsByTagName(item).item(0).getChildNodes();
	
	for(int i = 0; i < eElement.getElementsByTagName(childTag).getLength(); i++) {
	
		//result += nlList.item(i).getFirstChild().getTextContent() + " ";
		result += nlList.item(i).getChildNodes().item(0).getTextContent() + " ";
	}
	
	return result;
	}
	
	public static void main(String[] args) {
	
	// 본인이 받은 api키를 추가
	String key = "r7vMfuIM028q5UlJbPSdZnL%2FVJhFh%2F6L7EsElCD%2Bxp84aM1lBU6YgLII6C5hfi6O%2BV%2B9bsi4Z5nqsTCM26e3Ww%3D%3D";
	
	try{
		// parsing할 url 지정(API 키 포함해서)
		String url = "https://apis.data.go.kr/6260000/FoodService/getFoodKr?serviceKey=r7vMfuIM028q5UlJbPSdZnL%2FVJhFh%2F6L7EsElCD%2Bxp84aM1lBU6YgLII6C5hfi6O%2BV%2B9bsi4Z5nqsTCM26e3Ww%3D%3D";
	    
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		
		// 제일 첫번째 태그
		doc.getDocumentElement().normalize();
		
		// 파싱할 tag
		NodeList nList = doc.getElementsByTagName("item");
	
		for(int temp = 0; temp < nList.getLength(); temp++){
			Node nNode = nList.item(temp);
		
			Element eElement = (Element) nNode;
			
			System.out.println("식당명 : " + getTagValue("식당명", eElement));
			System.out.println("대표메뉴명 : " + getTagValue("대표메뉴명", eElement));
			System.out.println("영업시간내용 : " + getTagValue("영업시간내용", eElement));
			System.out.println("지역명 : " + getTagValue("지역명", eElement));
			System.out.println("주차가능여부 : " + getTagValue("주차가능여부", eElement));
			System.out.println("LAT : " + getTagValue("LAT", eElement));
			System.out.println("LNG : " + getTagValue("LNG", eElement));
			System.out.println("장르 : " + getTagValue("genres", "genre",eElement));
			System.out.println("감독명 : " + getTagValue("directors", "director",eElement));
			System.out.println("출연배우 : " + getTagValue("actors", "actor", eElement));
			
//			System.out.println((String)data.get("식당명"));
//			System.out.println((String)data.get("반려동물입장가능여부"));
//			System.out.println((String)data.get("대표메뉴명"));
//			System.out.println((String)data.get("영업시간내용"));
//			System.out.println((String)data.get("주차가능여부"));
//			System.out.println((String)data.get("지역명"));
//			
//			System.out.println((String)data.get("장소"));
//			System.out.println((String)data.get("위도"));
//			System.out.println((String)data.get("경도"));
//			System.out.println((String)data.get("대표메뉴"));
		}
		
	} catch (Exception e){	
		e.printStackTrace();
	}	
	
}
}
