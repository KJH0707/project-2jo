package com.fork.coupon.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.coupon.db.CouponDAO;
import com.fork.coupon.db.CouponDTO;
import com.fork.user.db.CeoDTO;
import com.fork.user.db.UserDAO;

public class IssueCouponAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : IssueCouponAction_execute() ");
		CouponDTO dto = new CouponDTO();
		CouponDAO dao = new CouponDAO();
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
		
		System.out.println(" @@@1");
		// 전달정보 처리
		UserDAO udao = new UserDAO();
		CeoDTO cdto = udao.getCEO(id);
		int c_no = cdto.getC_no();
		String c_code = request.getParameter("cou_code")+'-'+c_no;
		
		dto.setC_code(c_code); 							// 코드번호
		dto.setIsUse(0);						// 사용여부
		dto.setC_name(request.getParameter("coupon_name"));
		dto.setC_sdate(request.getParameter("cou_startDate"));				// 사용시작일
		dto.setC_edate(request.getParameter("cou_endDate")); 				// 만료일
		dto.setC_quantity(Integer.parseInt(request.getParameter("coupon_amount")));
		dto.setC_place(request.getParameter("sto_name"));
		dto.setMessage(request.getParameter("cou_message"));
		System.out.println(" @@@@@@2");
		
		// 삽입 작업
		dao.makeCoupon(dto);
		System.out.println(" @@@@@3");
		// 페이지 이동
		 forward = new ActionForward();
		 forward.setPath("./CouponManage.co");
		 forward.setRedirect(false);
		
		return forward;
	}
	

}
