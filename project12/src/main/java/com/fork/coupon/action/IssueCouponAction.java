package com.fork.coupon.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.coupon.db.CouponDAO;
import com.fork.coupon.db.CouponDTO;
import com.fork.user.db.CeoDTO;

public class IssueCouponAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : IssueCouponAction_execute() ");
		CeoDTO cdto = new CeoDTO();
		String validation = cdto.getC_id();
		System.out.println(validation);
		
//		HttpSession session = request.getSession();
//		String id = (String)session.getAttribute("id");
//		ActionForward forward = new ActionForward();
//		if(id==null || validation != id) {
//			forward.setPath("./Login.us");
//			forward.setRedirect(true);
//			return forward;
//		}
		
		CouponDTO dto = new CouponDTO();
		 request.getParameter("");
		 
		 // 삽입 작업
		 CouponDAO dao = new CouponDAO();
		
		// 페이지 이동
		 ActionForward forward = new ActionForward();
		 forward.setPath(validation);
		 forward.setRedirect(false);
		
		return null;
	}
	

}
