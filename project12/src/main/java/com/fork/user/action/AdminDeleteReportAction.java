package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.UserDAO;

public class AdminDeleteReportAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		UserDAO dao = new UserDAO();
		
		// 아이디 제어 (어드민)
		String id =null;
		HttpSession session = request.getSession();
		if (session.getAttribute("id")!=null) {
			 id = (String) session.getAttribute("id");
		}
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.print("<script>");
			out.print("alert('잘못된 접근입니다');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}
		else if (!(id.equals("admin"))){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.print("<script>");
			out.print("alert('잘못된 접근입니다');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}
		
		// 아이디 제어 (어드민)
		
		int rep_no = Integer.parseInt(request.getParameter("rep_no"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		
		dao.adminDeleteReport(rep_no);
		
		
		forward.setPath("/adminReportList.us?pageNum="+pageNum);
		forward.setRedirect(true);
		return forward;
	}

}
