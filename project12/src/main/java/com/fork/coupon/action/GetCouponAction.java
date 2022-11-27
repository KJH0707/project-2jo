package com.fork.coupon.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.coupon.db.CouponDAO;
import com.fork.coupon.db.CouponDTO;
import com.fork.user.db.CeoDTO;
import com.fork.user.db.MemberDTO;
import com.fork.user.db.UserDAO;

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
		System.out.println(" M : 세션제어 ");
		// 정보 저장 - m_no 가져오기
		UserDAO udao = new UserDAO();
		MemberDTO mdto = udao.getMember(id);
		int m_no = mdto.getM_no();
		String c_code = request.getParameter("c_code"); // 확인해보기
		System.out.println(" M : 회원정보 가져오기");
		
		System.out.println(" M : "+m_no);
		System.out.println(" M : "+c_code);
		
		// DAO - getCouponList(m_no) - 발급받은 쿠폰 리스트
		CouponDAO dao = new CouponDAO();
		List membercoupon = dao.getCouponList(m_no); // m_no
		System.out.println(" M : 발급받은 쿠폰 리스트 가져오기 ");
		List InvaildCoupon = dao.getMemInvaildCoupon(m_no, c_code);
		// request 영역 저장
		request.setAttribute("membercoupon", membercoupon);
		request.setAttribute("InvaildCoupon", InvaildCoupon);
		
		// 페이지 이동
		forward = new ActionForward();
		forward.setPath("./coupon/myPage_coupon.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
