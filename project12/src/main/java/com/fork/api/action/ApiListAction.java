package com.fork.api.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.store.db.StoreDAO;

public class ApiListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		StoreDAO dao = new StoreDAO();
		List storeList= dao.getStoreList();
		
		HttpSession session = request.getSession();
		session.setAttribute("storeList", storeList);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./ceo/apiStoreList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	

}
