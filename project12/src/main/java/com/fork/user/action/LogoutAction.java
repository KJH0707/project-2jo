package com.fork.user.action;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./main.st");
		forward.setRedirect(true);
		
		return forward;
		
	}

}
