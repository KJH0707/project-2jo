package com.fork.coupon.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.coupon.db.CouponDAO;
import com.fork.coupon.db.CouponDTO;
import com.fork.user.db.MemberDTO;
import com.fork.user.db.UserDAO;

public class GetCouponProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : GetCouponProAction_execute() ");
		
		response.setContentType("text/html; charset=UTF-8");
		// => 응답페이지의 형태를 html 형태로 사용
		
		// 아이디 제어
		HttpSession session = request.getSession();
		String id = null;
		
		if(session.getAttribute("id")!=null) {
			id = (String)session.getAttribute("id");
		}
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();	
		if(id == null) {
			response.setContentType("text/html; charset=UTF-8");
				
			out.print("<script>");
			out.print("alert('쿠폰 발급은 로그인시 가능합니다.');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}
		// 아이디 제어 (일반)
		System.out.println(" M : 세션제어 ");
		// 정보 저장 - m_no 가져오기
		UserDAO udao = new UserDAO();
		MemberDTO mdto = udao.getMember(id);
		int m_no = mdto.getM_no(); // 회원번호
		String c_code = request.getParameter("c_code"); // 쿠폰코드  ;확인해보기 
		System.out.println(" M : c_code : "+c_code);
		System.out.println(" M : 회원정보 가져오기");
		
		
		// DAO - getCouponList(m_no) - 발급받은 쿠폰 리스트
		CouponDAO dao = new CouponDAO();
		CouponDTO dto = dao.getCouponDetail(c_code);
		if(dao.duplCoupon(m_no)==1) { // 중복 시
			out.print("<script>");
			out.print("alert('이미 발급받은 쿠폰입니다');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}
		
		int result = dao.getCoupon(m_no, dto, c_code);
		System.out.println(" M : 쿠폰 발급받기(성공(1) / 실패(-1) / 대상없음(0) :  "+result);
		
		
		// 페이지 이동 (컨트롤러 X => 티켓 생성x)
		if(result == 1) {
			out.print("<script>");
			out.print("alert('쿠폰 발급완료');");
			out.print("location.href='./MemberCoupon.co';");
			out.print("</script>");
			out.close();
			
			return null; // 더이상 실행없이 컨트롤러로 전달
			
		} else if(result == 0 ) {
			out.print("<script>");
			out.print("alert('이미 발급받은 쿠폰입니다');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			
			return null;
		} else { //result == -1
			out.print("<script>");
			out.print("alert('쿠폰 마감되었습니다');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			
			return null;
		}
	}

}
