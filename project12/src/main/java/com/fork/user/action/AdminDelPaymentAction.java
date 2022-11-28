package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.UserDAO;

public class AdminDelPaymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		UserDAO dao = new UserDAO();
		
		// 아이디 제어 (어드민)
		String id =null;
		HttpSession session = request.getSession();
		if (session.getAttribute("id")!=null) {
			 id = (String) session.getAttribute("c_id");
		}
		ActionForward forward = new ActionForward();
		
		if(!(id.equals("admin")) | id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.print("<script>");
			out.print("alert('잘못된 접근입니다');");
			out.print("history.back()';");
			out.print("</script>");
			out.close();
			return null;
		}
		// 아이디 제어 (어드민)
		
		String p_no = (String)request.getParameter("p_no");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		System.out.println(p_no);
		
		dao.adminDeletePayment(p_no);
		
		
		forward.setPath("./adminPaymentList.us?pageNum="+pageNum);
		forward.setRedirect(true);
		return forward;
	}

}
