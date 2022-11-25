package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.UserDAO;

public class CeoReDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CeoReDeleteAction_execute ");
		
		// 세션제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./main.st");
			forward.setRedirect(true);
			return forward;
		}
		
		// 정보 저장
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		System.out.println(rev_no);
		
		
		// DB 수정
		UserDAO dao = new UserDAO();
		int result = dao.ceoReDelete(rev_no);
		
		if(result == 1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(result+"");
			out.flush();
			out.close();
		}
		
		return null;
	}

}