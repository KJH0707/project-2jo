package com.fork.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.StoreDAO;

public class AdminDelGenMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		StoreDAO dao = new StoreDAO();
		
		// 로그인 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
	
		ActionForward forward = new ActionForward();
		
		if (!(id.equals("admin"))) {
			forward.setPath("./main.st");
			forward.setRedirect(true);
			return forward;
					
			} 
		// 로그인 제어
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		
		dao.AdminDeleteGenMem(m_no);
		
		
		forward.setPath("/adminGenCeoList.us?pageNum="+pageNum);
		forward.setRedirect(false);
		return forward;
	}

}
