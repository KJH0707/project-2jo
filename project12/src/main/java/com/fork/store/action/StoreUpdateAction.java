package com.fork.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.store.db.StoreDAO;
import com.fork.store.db.StoreDTO;

public class StoreUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M :StoreUpdateAction_execute() ");
		
		// 세션제어
//		HttpSession session = request.getSession();
//		int s_no =  (Integer)session.getAttribute("s_no"); // 뭐가 넘어오는지 확인할 것
//		String cid = (String)session.getAttribute("c_id");
//		
		ActionForward forward = new ActionForward();
//		if(cid == null ) { // 점주 아이디가 없는 경우 
//			forward.setPath("./Login.us"); // 로그인페이지로 연결시킬 것
//			forward.setRedirect(true);
//			return forward;
//		}else if(s_no == 0) {	// 가게번호가 없는 경우
//			forward.setPath("./CeoMyPage.us");
//			forward.setRedirect(true);
//			return forward;
//		}
		
		// DAO - 기존의 가게 정보 가져오기(getStore(s_no))
		StoreDAO dao = new StoreDAO();
		
		// 정보 request 영역 저장
		request.setAttribute("dto", dao.getStore(1)); // 반드시 1대신 s_no로 수정할 것 
		
		// 페이지 이동
		forward.setPath("./ceo/storeUpdate.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
