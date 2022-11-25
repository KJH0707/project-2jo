package com.fork.user.action;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.fork.user.db.ReviewcsDTO;
import com.fork.user.db.UserDAO;

public class CeoMypage_revDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CeoMypage_reDetailAction_execute ");
		
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
		
		// 정보 불러오기
		UserDAO rdao = new UserDAO();
		ReviewcsDTO rdto = rdao.reviewInfo(rev_no);
		
		// 정보 보내기
		request.setAttribute("rdto", rdto);
		
		
		// 페이지 이동
		forward.setPath("./member/ceoReviewDetail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
