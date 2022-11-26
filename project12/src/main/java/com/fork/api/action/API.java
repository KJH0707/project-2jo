package com.fork.api.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class API {
	protected static final String serviceKey = "r7vMfuIM028q5UlJbPSdZnL%2FVJhFh%2F6L7EsElCD%2Bxp84aM1lBU6YgLII6C5hfi6O%2BV%2B9bsi4Z5nqsTCM26e3Ww%3D%3D";
	//Resion[] resion = new Resion[8]; // 가져온 지역을 저장하기 위한 배열
	URL url;
	String result = "";
	//int i = 0;
	JSONArray dataArr;
	
	JSONArray getJsonObject(Resion r) throws Exception {
		
		try {
			url = new URL(r.dataUrl+"?serviceKey="+ serviceKey+ "&returnType=JSON&perPage=40");
			
			BufferedReader bf;
			
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser(); // json해석기 선언,할당
			JSONObject jsonObject = (JSONObject)jsonParser.parse(result); // json Object 객체에 받아온 결과 저장
			
			dataArr = (JSONArray) jsonObject.get("data"); // json Object 객체 내의 data라는 항목의 데이터 저장
		
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		//resion[i++] = r;
		System.out.println(r +"가 저장되었습니다.");
		
		return dataArr;
	}
	
}
