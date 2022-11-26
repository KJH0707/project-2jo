package com.fork.api.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.store.db.StoreDAO;

public class ApiListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id==null ) { //|| id!="admin"
			forward.setPath("./Main.st");
			forward.setRedirect(true);
			return forward;
		}
		
		StoreDAO dao = new StoreDAO();
		List storeList= dao.getStoreList();
		
		session.setAttribute("storeList", storeList);
		
		// 페이지 이동
		forward.setPath("./admin/apiStoreList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	

}
