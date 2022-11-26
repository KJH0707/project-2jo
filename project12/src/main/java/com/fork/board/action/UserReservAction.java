package com.fork.board.action;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.board.db.BoardDAO;
import com.fork.store.db.StoreDAO;
import com.fork.store.db.StoreDTO;
import com.fork.user.db.UserDAO;

public class UserReservAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		
		if(id==null) {
			forward.setPath("./loginForm.st");
			forward.setRedirect(true);
			return forward;
		}
		
		UserDAO dao = new UserDAO();
	
		
		
		
		request.setAttribute("udto", dao.getMember(id));
		
		
		forward.setPath("./board/reservation.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
