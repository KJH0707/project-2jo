package com.fork.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.UserDAO;

public class AdminDelPaymentAction implements Action {

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
		String p_no = (String)request.getParameter("p_no");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		System.out.println(p_no);
		
		dao.adminDeletePayment(p_no);
		
		
		forward.setPath("./adminPaymentList.us?pageNum="+pageNum);
		forward.setRedirect(true);
		return forward;
	}

}
