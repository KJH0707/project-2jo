package com.fork.coupon.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GetCouponAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : GetCouponAction_execute() ");
		
		// 세션처리
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(id==null) {
			forward.setPath("./Login.us");
			forward.setRedirect(true);
			return forward;
		}
		
		// 정보 저장
		
		// DAO
		
		// request 영역 저장
		
		
		// 페이지 이동
		
		return null;
	}

}
