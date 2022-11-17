package com.fork.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.review.db.ReviewDAO;

public class ReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		
		ReviewDAO dao = new ReviewDAO();
		dao.deleteReview(rev_no);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./ReviewList.rv");
		forward.setRedirect(true);
		
		return forward;
	}

}
