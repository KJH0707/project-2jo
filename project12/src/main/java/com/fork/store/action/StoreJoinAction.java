package com.fork.store.action;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.store.db.StoreDAO;
import com.fork.store.db.StoreDTO;
import com.fork.user.db.CeoDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class StoreJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : StoreJoinAction_execute() 호출");
		
		// 한글처리(생략)
		// 정보 처리
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		//int validation = (Integer)session.getAttribute("ceo");
		
		System.out.println(id);
		
		ActionForward forward = new ActionForward();
		if(id == null ) { //|| validation == 2
			forward.setPath("./Login.us"); 
			forward.setRedirect(true);
			return forward;
		}
		

		forward.setPath("./ceo/storeJoin.jsp"); // 점주 마이페이지 또는 가게 등록 페이지로 연결할 것
		forward.setRedirect(false); 
		return forward;
	}
}
