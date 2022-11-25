package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.UserDAO;

public class CeoReWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CeoReWriteAction_execute ");
		
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
		String reply = request.getParameter("reply");
		System.out.println(rev_no);
		System.out.println(reply);
		
		// DB 수정
		UserDAO dao = new UserDAO();
		int result = dao.ceoReply(rev_no, reply);
		
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
