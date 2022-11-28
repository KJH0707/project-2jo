package com.fork.review.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.review.db.ReviewDAO;

public class ReviewDeleteAction implements Action {

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
		
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		
		ReviewDAO dao = new ReviewDAO();
		dao.deleteReview(rev_no);
		
		forward.setPath("./ReviewList.rv?s_no="+s_no);
		forward.setRedirect(true);
		
		return forward;
	}

}
