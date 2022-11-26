package com.fork.store.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

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
		Vector<ArrayList> costStore = dao.costStore();
//		if(cost != null) {
//			  costStore = dao.costStore(cost);
//		}
		ArrayList readStore = dao.getBoardListRead(cnt);
		List reviewStore = bdao.reviewStore();
		
		
		request.setAttribute("recStore", recStore);
		
		
		request.setAttribute("starStore", starStore);
		request.setAttribute("costStore1", costStore.get(0));
		request.setAttribute("costStore2", costStore.get(1));
		request.setAttribute("costStore3", costStore.get(2));
		request.setAttribute("costStore4", costStore.get(3));
		
		
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
