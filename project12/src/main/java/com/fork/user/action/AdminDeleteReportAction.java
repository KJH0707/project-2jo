package com.fork.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.UserDAO;

public class AdminDeleteReportAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		UserDAO dao = new UserDAO();
		
		// 로그인 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
	
		ActionForward forward = new ActionForward();
		
		if(id!=null) {
			if (!(id.equals("admin"))) {
			forward.setPath("./main.st");
			forward.setRedirect(true);
			return forward;
			}
		} else{
			forward.setPath("./main.st");
			forward.setRedirect(true);
			return forward;
		}
		// 로그인 제어
		int rep_no = Integer.parseInt(request.getParameter("rep_no"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		
		dao.adminDeleteReport(rep_no);
		
		
		forward.setPath("/adminReportList.us?pageNum="+pageNum);
		forward.setRedirect(true);
		return forward;
	}

}
