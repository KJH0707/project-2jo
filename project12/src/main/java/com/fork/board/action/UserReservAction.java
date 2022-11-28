package com.fork.board.action;

import java.io.PrintWriter;

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
		
		// 아이디 제어
		HttpSession session = request.getSession();
		String id = null;
		
		if(session.getAttribute("id")!=null) {
			id = (String)session.getAttribute("id");
		}
		
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.print("<script>");
			out.print("alert('로그인 하쇼.');");
			out.print("location.href='./Login.us';");
			out.print("</script>");
			out.close();
			return null;
		}
		// 아이디 제어 (일반)
		
		UserDAO dao = new UserDAO();
	
		
		
		
		request.setAttribute("udto", dao.getMember(id));
		
		
		forward.setPath("./board/reservation.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
