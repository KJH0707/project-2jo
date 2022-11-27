package com.fork.coupon.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.coupon.db.CouponDAO;
import com.fork.coupon.db.CouponDTO;

public class UseCouponAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : UseCouponAction_execute() ");
		
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
		System.out.println(" M : 쿠폰 코드 : "+c_code);
		CouponDAO dao = new CouponDAO();
		CouponDTO dto = dao.getCouponDetail(c_code);
		dto.setIsUse(1);
		System.out.println(" M : 쿠폰정보 :"+dto);
		dao.modifyCoupon(dto, c_code);
		
		forward = new ActionForward();
		forward.setPath("./MemberCoupon.co");
		forward.setRedirect(true);
		
		return forward;
		
	}

}
