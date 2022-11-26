package com.fork.coupon.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.UserDAO;

public class CouponIssuePreAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CouponIssuePreAction_execute() ");
		
		// 세션 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(id==null) {
			forward.setPath("./Login.us");
			forward.setRedirect(true);
			return forward;
		}
		
		// 전달 정보 
		UserDAO udao = new UserDAO();
		List storeList = udao.getStoreInfo(id);
		
		// request영역에 저장
		request.setAttribute("storeList", storeList);
		
		forward = new ActionForward();
		forward.setPath("./coupon/IssueCoupon.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
