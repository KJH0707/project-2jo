package com.fork.bookmark.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.bookmark.db.BookMarkDAO;

public class reportDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int rep_no=0;
		if (request.getParameter("rep_no")!=null) {
			rep_no = Integer.parseInt(request.getParameter("rep_no"));
		}
		BookMarkDAO dao = new BookMarkDAO();
		HashMap<String,Object> hm = dao.getReportDetail(rep_no);
		
		request.setAttribute("rep", hm);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/reportDetail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
