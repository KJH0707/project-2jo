package com.fork.coupon.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.coupon.db.CouponDAO;

public class CouponDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CouponDeleteAction_execute() ");
		
		// 세션 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(id==null) {
			forward.setPath("./Login.us");
			forward.setRedirect(true);
			return forward;
		}
		
		String c_code = request.getParameter("c_code");
		
		// DAO - 쿠폰삭제 삭제 
		CouponDAO dao = new CouponDAO();
		dao.deleteCoupon(c_code);
		
		// 페이지 이동
		forward = new ActionForward();
		forward.setPath("./CouponManage.co");
		forward.setRedirect(true);
		
		return forward;
	}

}
