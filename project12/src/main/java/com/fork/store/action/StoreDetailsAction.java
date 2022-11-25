package com.fork.store.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.bookmark.db.BookMarkDAO;
import com.fork.store.db.StoreDAO;

public class StoreDetailsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : StoreDetailsAction_execute()호출 ");
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		String s_name = request.getParameter("s_name");
		
		BookMarkDAO bdao = new BookMarkDAO();
		int result = bdao.checkBookMark(id, s_no);
		
		StoreDAO dao = new StoreDAO();
		dao.updateReadcount(s_no);
		System.out.println(" M : 조회수 1증가 완료! ");
		
		int cnt = dao.getBoardCount();
//		ArrayList recStore = dao.getBoardList(cnt);
		//request저장
		
//		request.setAttribute("recStore", recStore);
		request.setAttribute("dto",dao.getStoreDetails(s_no));
		
		
		request.setAttribute("s_name", s_name);
		
		request.setAttribute("result",result);
		
		//이동하라
		ActionForward forward = new ActionForward();
		forward.setPath("./board/storeDetails.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

	

}
