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
		
//		
		int c_no = (int) session.getAttribute("c_no"); // 점주일 경우 
		String cno = (String)session.getAttribute("c_no"); // 일반회원일 경우 -> 따로 세션에 아이디를 저장하지 않기 때문에 m_id로 제어할 수 없음 
														   // 따라서 이 방식대로 제어해야하는데 값이 없으므로 null이 되어서 String으로 취급되어야함
														   // 그러면 차라리 member : 1, ceo : 2, admin : 3 의 값으로 회원구분 컬럼을 만드는 것이 좋지 않을까?
		

		System.out.println(id);
		System.out.println(c_no);
		ActionForward forward = new ActionForward();
		if(id == null || c_no == 0) {
			forward.setPath("./Login.us"); 
			forward.setRedirect(true);
			return forward;
		}
		

		forward.setPath("./ceo/storeJoin.jsp"); // 점주 마이페이지 또는 가게 등록 페이지로 연결할 것
		forward.setRedirect(false); 
		return forward;
	}
}
