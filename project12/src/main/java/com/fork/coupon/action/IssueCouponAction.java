package com.fork.coupon.action;

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
		// 세션제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id==null) {
			forward.setPath("./Login.us");
			forward.setRedirect(true);
			return forward;
		}
		
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
