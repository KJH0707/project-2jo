package com.fork.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.user.db.UserDAO;

public class RefuseReservAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : refuseReservationAction_execute ");
		
		// 정보 저장
		int res_no = Integer.parseInt(request.getParameter("res_no"));
		
		// 수정
		UserDAO dao = new UserDAO();
		int result=dao.RefuseReserv(res_no);
		
		if(result == 1) {
			System.out.println("예약 거절 완료");
		} else {
			System.out.println("예약 거절 실패");
		}
		
		// 페이지이동
		ActionForward forward = new ActionForward();
		forward.setPath("./CeoMyPage_reserv.us");
		forward.setRedirect(true);
		
		return forward;
	}

}
