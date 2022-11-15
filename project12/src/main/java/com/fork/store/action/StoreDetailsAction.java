package com.fork.store.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.CollectionUtils;

import com.fork.store.db.StoreDAO;

public class StoreDetailsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : StoreDetailsAction_execute()호출 ");
		int s_no=  (Integer.parseInt(request.getParameter("s_no")));
		StoreDAO dao = new StoreDAO();
		int cnt = dao.getBoardCount();
		ArrayList recStore = dao.getBoardList(cnt);
		//request저장
		
		request.setAttribute("recStore", recStore);
		request.setAttribute("dto",dao.getStoreDetails(s_no));
		//이동하라
		ActionForward forward = new ActionForward();
		forward.setPath("./board/storeDetails.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

	

}
