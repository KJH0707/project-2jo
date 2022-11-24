package com.fork.api.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.fork.store.action.ActionForward;

abstract public class storeGetDataAction2 implements APIAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : storeAction_execute()");
		
		// 인증키 (개인이 받아와야함)
    	String serviceKey = "r7vMfuIM028q5UlJbPSdZnL%2FVJhFh%2F6L7EsElCD%2Bxp84aM1lBU6YgLII6C5hfi6O%2BV%2B9bsi4Z5nqsTCM26e3Ww%3D%3D";

    	System.out.println(serviceKey);
    	// 파싱한 데이터를 저장할 변수
    	String result = "";
    	
    	URL url;
		try {
			url = new URL("https://api.odcloud.kr/api/15096697/v1/uddi:0bb27225-00f4-4a12-907e-e5afe49f90db?serviceKey="
					+ serviceKey+ "&returnType=JSON");
			
			BufferedReader bf;
			
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = bf.readLine();
			
//			System.out.println(result);
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
//			System.out.println(jsonObject.getClass()); // jsonObject타입의 클래스 출력
			
			JSONArray dataArr = (JSONArray) jsonObject.get("data");
			
			storeDAO dao = new storeDAO();
			
			if(dataArr.size() > 0) {
				for(int i=0; i < dataArr.size(); i++ ) {
					JSONObject data = (JSONObject)dataArr.get(i);
					
					System.out.println(data);
//					System.out.println(data.get("식당(ID)"));
//					long s_id = (Long)data.get("식당(ID)");
//					System.out.println(s_id);
					
					dao.insertStoreInfo(data);
				}
			}
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./StoreAdd.jsp");
		forward.setRedirect(false);
		
		
		
		return null;
	}

	@Override
	public void Url() {
		
	}
	
	
}
