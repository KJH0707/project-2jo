package com.fork.coupon.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.coupon.db.CouponDAO;
import com.fork.coupon.db.CouponDTO;
import com.fork.user.db.UserDAO;

public class CouponModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CouponModifyAction_execute() ");
		
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
		
		// 전달 정보 처리
		String c_code = (String)request.getParameter("c_code");
		
		System.out.println(" c_code :"+c_code);
		
		// dao - getCouponDetail
		CouponDAO dao = new CouponDAO();
		CouponDTO coupondetail = dao.getCouponDetail(c_code);
		UserDAO udao = new UserDAO();
		List storeList = udao.getStoreInfo(id);
		
		// request 영역에 저장 
		request.setAttribute("storeList", storeList);
		request.setAttribute("coupondetail", coupondetail);
		request.setAttribute("c_code", c_code);
		
		// 페이징 처리
		forward = new ActionForward();
		forward.setPath("./coupon/ModifyCoupon.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
