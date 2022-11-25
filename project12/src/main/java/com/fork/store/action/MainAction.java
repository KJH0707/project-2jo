package com.fork.store.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.board.db.BoardDAO;
import com.fork.store.db.StoreDAO;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M :  MainAction_execute 호출");
		String price = request.getParameter("price");
		if(price==null) {
			price = "10000";
		}
		System.out.println("MMMMMMMMM : @@@@@@@@@@@@@@@@price : "+price);
		
		StoreDAO dao = new StoreDAO();
		BoardDAO bdao = new BoardDAO();
		
		int price1 = Integer.parseInt(price);
		int cnt = dao.getBoardCount();
		ArrayList recStore = dao.ranStore();
		ArrayList starStore = dao.getBoardListStar(cnt);
		ArrayList costStore = dao.costStore(price1);
//		if(cost != null) {
//			  costStore = dao.costStore(cost);
//		}
		ArrayList readStore = dao.getBoardListRead(cnt);
		List reviewStore = bdao.reviewStore();
		
		
		request.setAttribute("recStore", recStore);
		request.setAttribute("starStore", starStore);
		request.setAttribute("costStore", costStore);			
		
//		if(cost != null) {
//			request.setAttribute("costStore", costStore);			
//		}
		
		request.setAttribute("readStore", readStore);
		request.setAttribute("reviewStore", reviewStore);
		
		System.out.println("recStore : "+recStore);
		System.out.println("starStore : "+starStore);
		
		if(price1 == 0) {
			System.out.println("costStore : "+costStore);
		}
		System.out.println("costStore : "+costStore);
		
		System.out.println("readStore : "+readStore);
		System.out.println("reviewStore : "+reviewStore);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./main/main.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
