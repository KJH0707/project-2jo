package com.fork.coupon.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.coupon.db.CouponDAO;
import com.fork.coupon.db.CouponDTO;

public class UseCouponAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : UseCouponAction_execute() ");
		
		// 아이디 제어
		HttpSession session = request.getSession();
		String id = null;
		
		if(session.getAttribute("id")!=null) {
			id = (String)session.getAttribute("id");
		}
		
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.print("<script>");
			out.print("alert('로그인 하쇼.');");
			out.print("location.href='./Login.us';");
			out.print("</script>");
			out.close();
			return null;
		}
		// 아이디 제어 (일반)
		
		
		String c_code = request.getParameter("c_code");
		CouponDAO dao = new CouponDAO();
		CouponDTO dto = dao.getCouponDetail(c_code);
		dto.setIsUse(1);
		dao.modifyCoupon(dto, c_code);
		
		forward = new ActionForward();
		forward.setPath("./MemberCoupon.co");
		forward.setRedirect(true);
		
		return forward;
		
	}

}
