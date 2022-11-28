package com.fork.coupon.action;

import java.io.PrintWriter;
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
