package com.fork.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.review.db.ReviewDAO;

public class ReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String m_id = session.getId();
		if(m_id == null) {
			response.sendRedirect("/main.st");
		}
		
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		
		ReviewDAO dao = new ReviewDAO();
		dao.deleteReview(rev_no);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./ReviewList.rv?s_no="+s_no);
		forward.setRedirect(true);
		
		return forward;
	}

}
