package com.fork.coupon.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.coupon.db.CouponDAO;
import com.fork.coupon.db.CouponDTO;
import com.fork.user.db.CeoDTO;
import com.fork.user.db.NoticeDTO;
import com.fork.user.db.UserDAO;

public class eventDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : eventDetailAction_execute() ");
		
		// 세션제어 x
		System.out.println(" M : 수정 1단계 ");
		
		// 전달정보 처리
		int n_no = Integer.parseInt(request.getParameter("n_no"));
		UserDAO dao = new UserDAO();
		ArrayList event = dao.adminGetNoticeList(1, 5, 1);
		System.out.println(event);
		// request 영역에 저장 
		request.setAttribute("event", event);
		request.setAttribute("n_no", n_no);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./coupon/eventDetail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
