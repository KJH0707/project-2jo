package com.fork.coupon.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.coupon.db.CouponDAO;
import com.fork.coupon.db.CouponDTO;
import com.fork.user.db.CeoDTO;
import com.fork.user.db.UserDAO;

public class CouponModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CouponModifyProAction_execute() ");
		
		// 세션 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(id==null) {
			forward.setPath("./Login.us");
			forward.setRedirect(true);
			return forward;
		}
		System.out.println(" M : 수정 1단계 ");
		
		// 전달정보 처리
		String c_code = request.getParameter("c_code");
		//System.out.println("M : c_code : "+c_code);
		UserDAO udao = new UserDAO();
		CeoDTO cdto = udao.getCEO(id);
		//int c_no = cdto.getC_no();
		
		CouponDTO dto = new CouponDTO();
		dto.setIsUse(0);						// 사용여부
		dto.setC_sdate(request.getParameter("cou_startDate"));				// 사용시작일
		dto.setC_name(request.getParameter("coupon_name"));				// 쿠폰명
		dto.setC_place(request.getParameter("sto_name"));				// 사용처
		dto.setC_edate(request.getParameter("cou_endDate")); 				// 만료일
		dto.setC_quantity(Integer.parseInt(request.getParameter("coupon_amount")));
		dto.setC_place(request.getParameter("sto_name"));
		dto.setMessage(request.getParameter("cou_message"));
		System.out.println(" M : 수정 2단계 - 전달정보처리 완료 ");
		
		// DAO - 수정 작업 - modifyCoupon() 
		CouponDAO dao = new CouponDAO();
		dao.modifyCoupon(dto, c_code);
		System.out.println(" M : 수정 3단계 ");
		
		// 페이지 이동
		 forward = new ActionForward();
		 forward.setPath("./CouponManage.co");
		 forward.setRedirect(false);
		
		return forward;
	}

}
